dir = $(shell pwd)

build: clean image
	mkdir -p 'out'
	sudo docker run -t\
		--mount type=bind,source="$(dir)/builder.sh",target=/app/builder.sh\
		--mount type=bind,source="$(dir)/out",target=/app/out\
		builder:latest
	
image:
	sudo docker build --tag 'builder:latest' .

.PHONY: clean
clean:
	rm -rf out
