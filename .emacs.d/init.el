(require 'package)
(setq-default
 load-prefer-newer t
 package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))

(setq-default
 use-package-always-defer t
 use-package-always-ensure t)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(garbage-collect)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(custom-safe-themes
   '("4a201d19d8f7864e930fbb67e5c2029b558d26a658be1313b19b8958fe451b55" default))
 '(flycheck-disabled-checkers '(haskell-stack-ghc))
 '(haskell-check-command "hlint")
 '(haskell-compile-cabal-build-command "stack build")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-stylish-on-save t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(hasklig-mode lsp-haskell ob-async subatomic256-theme realgud which-key use-package transpose-frame toml-mode python-pytest pylint pyimport py-isort py-autopep8 org-journal nyan-mode meghanada magit lsp-ui lsp-javacomp lsp-java jedi importmagic hindent flycheck-mypy flycheck-haskell elpy dockerfile-mode docker-compose-mode darktooth-theme ccls blacken))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
