.SILENT:

.PHONY: vendor update_vendor \
	remove_vendor/escreen.el update_vendor/escreen.el
	remove_vendor/linum+.el update_vendor/linum+.el

vendor: vendor/escreen.el vendor/linum+.el
update_vendor: update_vendor/escreen.el update_vendor/linum+.el


vendor/escreen.el:
	echo "fetching vendor/escreen.el..." && \
	curl -s -L -o vendor/escreen.el \
	https://github.com/renard/escreen-el/raw/master/escreen.el

remove_vendor/escreen.el:
	( \
		test -f "vendor/escreen.el" && rm "vendor/escreen.el" && \
		echo "removed vendor/escreen.el" \
	) || exit 0

update_vendor/escreen.el: remove_vendor/escreen.el vendor/escreen.el


vendor/linum+.el:
	echo "fetching vendor/linum+.el..." && \
	curl -s -L -o vendor/linum+.el \
	http://www.emacswiki.org/emacs/download/linum%2b.el

remove_vendor/linum+.el:
	( \
		test -f "vendor/linum+.el" && rm "vendor/linum+.el" && \
		echo "removed vendor/linum+.el" \
	) || exit 0

update_vendor/linum+.el: remove_vendor/linum+.el vendor/linum+.el