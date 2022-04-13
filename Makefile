build:
	docker build -t unimedrj-ruby .

shell:
	docker run --rm -w /app -it unimedrj-ruby /bin/sh

run:
	docker run -p 3000:3000 --rm -w /app -it unimedrj-ruby
	open http://0.0.0.0:3000/
