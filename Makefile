.PHONY: build
build:
	bundle exec middleman build

.PHONY: serve
serve:
	bundle exec middleman serve

.PHONY: clean
clean:
	rm -Rf build/
