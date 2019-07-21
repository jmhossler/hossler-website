VERSION := `poetry run version`

build-docker: Dockerfile
	docker build -t jmhossler/hossler-website:$(VERSION) -t jmhossler/hossler-website:latest .
