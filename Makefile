.EXPORT_ALL_VARIABLES:

.PHONY: clean \
        package \
        release

SHELL=/bin/bash -o pipefail

VERSION := "$$(cat buildpack.toml | grep '^version' | head -1 | sed -e 's/version = //g' | xargs)"

all : package

clean:
	rm -fr vendor jvmkill-cnb-$(VERSION).tgz

package: clean
	./bin/vendor-assets
	tar cvzf jvmkill-cnb-$(VERSION).tgz bin/ vendor/ buildpack.toml README.md LICENSE

release: clean
	git tag $(VERSION)
	git push --tags origin master