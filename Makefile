VERSION := `poetry run show_version`

build-docker: Dockerfile
	docker build -t jmhossler/hossler-website:$(VERSION) -t jmhossler/hossler-website:latest .

run-local: build-docker
	docker run -p 8080:8080 jmhossler/hossler-website:$(VERSION)

clean:
	rm -rf pip-wheel-metadata
