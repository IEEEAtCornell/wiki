require 'net/http'
require 'uri'

module Jekyll
  class CoursePreprocessor < Generator
    safe true
    priority :low

    SEMESTER_ORDER = %w[FA SU SP]

    def has_cs_code?(codes)
      return false unless codes.is_a?(Array)
      codes.any? { |code| code.start_with?("CS") }
    end

    def generate(site)
      puts "Running course preprocessing..."

      current_semester_code = get_current_semester_code
      site.config['current_semester'] = current_semester_code
      puts " → Current semester set to: #{current_semester_code}"

      if site.collections['courses']
        site.collections['courses'].docs.each do |course|
          ece_code = extract_ece_code(course.data['codes'])
          next unless ece_code

          # Tag as CS Crosslisted if codes include any CS code
          if has_cs_code?(course.data['codes'])
            course.data['tags'] ||= []
            unless course.data['tags'].include?("CS Crosslisted")
              course.data['tags'] << "CS Crosslisted"
            end
          end

          department, number = ece_code.split(' ')
          semester = find_last_offered_semester(department, number)

          if semester
            course.data['last_offered'] = semester
            course.data['roster_url'] = "https://classes.cornell.edu/browse/roster/#{semester}/class/#{department}/#{number}"
            puts " → #{ece_code} last offered: #{semester}"
          else
            puts " → #{ece_code} not found in recent semesters."
          end

          # Set primary_level
          ece_levels = extract_ece_levels(course.data['codes'])
          unless ece_levels.empty?
            course.data['primary_level'] = ece_levels.min
          end
        end
      end
    end

    private

    def extract_ece_code(codes)
      return nil unless codes.is_a?(Array)
      codes.find { |code| code.start_with?("ECE") }
    end

    def extract_ece_levels(codes)
      return [] unless codes.is_a?(Array)

      codes.map do |code|
        next unless code.start_with?("ECE")
        match = code.match(/ECE\s+(\d+)/)
        next unless match
        (match[1].to_i.div(1000)) * 1000
      end.compact
    end

    def find_last_offered_semester(dept, number)
      now = Time.now
      current_year = now.year % 100
      current_month = now.month

      # Start from current semester and go back
      semesters = generate_semester_list(current_year, current_month)

      semesters.each do |semester|
        url = "https://classes.cornell.edu/browse/roster/#{semester}/class/#{dept}/#{number}"
        puts "  Checking: #{url}"
        return semester if url_exists?(url)
      end

      nil
    end

    def generate_semester_list(current_year, current_month)
      semesters = []
      year = current_year
      sem_index = semester_index_from_month(current_month)

      10.times do  # Go back ~10 semesters (~3+ years)
        semester_code = SEMESTER_ORDER[sem_index] + format('%02d', year)
        semesters << semester_code

        sem_index += 1
        if sem_index > 2
          sem_index = 0
          year -= 1
        end
      end

      semesters
    end

    def semester_index_from_month(month)
      if month >= 8
        0 # FA
      elsif month >= 5
        1 # SU
      else
        2 # SP
      end
    end

    def url_exists?(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response.code == "200"
    rescue => e
      puts "Error checking URL #{url}: #{e.message}"
      false
    end

    def get_current_semester_code
      now = Time.now
      year = now.year % 100
      month = now.month

      semester_prefix =
        if month >= 8
          "FA"
        elsif month >= 5
          "SU"
        else
          "SP"
        end

      "#{semester_prefix}#{format('%02d', year)}"
    end
  end
end
