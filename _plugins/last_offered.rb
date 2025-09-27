require 'net/http'
require 'uri'

module Jekyll
  class LastOfferedGenerator < Generator
    safe true
    priority :low

    SEMESTER_ORDER = %w[FA SU SP]

    def generate(site)
      puts "Running LastOfferedGenerator..."

      site.posts.docs.each do |post|
        ece_code = extract_ece_code(post.data['codes'])
        next unless ece_code

        department, number = ece_code.split(' ')
        semester = find_last_offered_semester(department, number)

        if semester
          post.data['last_offered'] = semester
          post.data['roster_url'] = "https://classes.cornell.edu/browse/roster/#{semester}/class/#{department}/#{number}"
          puts " → #{ece_code} last offered: #{semester}"
        else
          puts " → #{ece_code} not found in recent semesters."
        end
      end
    end

    private

    def extract_ece_code(codes)
      return nil unless codes.is_a?(Array)
      codes.find { |code| code.start_with?("ECE") }
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
  end
end
