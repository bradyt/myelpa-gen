(setq-default indent-tabs-mode nil)

(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ;; ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ))

(setq package-archive-priorities
      '(
        ("gnu" . 4)
        ("nongnu" . 3)
        ("melpa-stable" . 2)
        ;; ("melpa" . 1)
        ))

(setq package-pinned-packages
      '(
        (dart-mode . "nongnu")
        (dash . "gnu")
        (evil . "nongnu")
        ;; (evil-org . "melpa")
        (evil-surround . "melpa-stable")
        (exec-path-from-shell . "melpa-stable")
        (fsbot-data-browser . "melpa-stable")
        (git-commit . "nongnu")
        (ivy . "melpa-stable")
        (magit . "nongnu")
        (magit-section . "nongnu")
        (markdown-mode . "nongnu")
        (nix-mode . "nongnu")
        (ordinal . "melpa-stable")
        (quelpa . "melpa-stable")
        (request . "nongnu")
        (rust-mode . "nongnu")
        (transient . "gnu")
        (use-package . "gnu")
        (webpaste . "nongnu")
        (with-editor . "nongnu")
        (yasnippet . "melpa-stable")
      ))

(setq my-pkgs (mapcar 'car package-pinned-packages))

(require 'package)
(when (seq-remove 'package-installed-p my-pkgs)
  (package-refresh-contents))

(dolist (pkg my-pkgs)
  (package-install pkg t))

(setq custom-file "/dev/null")

(setq quelpa-checkout-melpa-p nil)
(setq quelpa-update-melpa-p nil)
(setq quelpa-melpa-recipe-stores nil)
(setq quelpa-upgrade-p nil)
(setq quelpa-self-upgrade-p nil)
(setq quelpa-stable-p t)

(quelpa '(elpa-mirror :stable t
                      :fetcher git
                      :url "https://github.com/redguardtoo/elpa-mirror.git"))

(quelpa '(terminal-here :stable t
                        :fetcher git
                        :url "https://github.com/davidshepherd7/terminal-here.git"))

(quelpa '(evil-org :stable nil
                   :fetcher git
                   :url "https://github.com/Somelauw/evil-org-mode.git"))

(setq elpamr-default-output-directory "../myelpa")
(elpamr-create-mirror-for-installed)
