(setq-default indent-tabs-mode nil)

(setq package-archives `(("myelpa" . ,(expand-file-name "../myelpa"))))

(setq my-pkgs
      '(
	dart-mode
	exec-path-from-shell
	evil
	evil-org
	evil-surround
	fsbot-data-browser
	ivy
	magit
	markdown-mode
	nix-mode
	ordinal
	quelpa
	rust-mode
	terminal-here
	use-package
	webpaste
	yasnippet
	))

(require 'package)
(when (seq-remove 'package-installed-p my-pkgs)
  (package-refresh-contents))

(dolist (pkg my-pkgs)
  (package-install pkg t))
