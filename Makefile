
# Build the Docker image
build:
	docker compose build

# Run the local development server
serve:
	docker compose up

# Stop the development server
stop:
	docker compose down

# Rebuild the container without cache (optional)
rebuild:
	docker compose build --no-cache

# Clean up volumes, containers, and images created by this project
clean:
	docker compose down --volumes --rmi local
