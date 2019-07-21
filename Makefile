VERSION := `poetry run show_version`

build-docker: Dockerfile
	docker build -t jmhossler/hossler-website:$(VERSION) -t jmhossler/hossler-website:latest .
