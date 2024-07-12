VERSION := $(shell cargo metadata --no-deps --format-version 1 | jq -r '.packages[0].version')

.PHONY: release
release:
	git cliff --bump -o
	git add .
	git commit -sm "chore(release): release version v$(VERSION)"
	git tag "v$(VERSION)"
	git push origin main --tags
