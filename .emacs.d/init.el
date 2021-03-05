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
 '(flycheck-disabled-checkers '(haskell-stack-ghc))
 '(haskell-check-command "hlint")
 '(haskell-compile-cabal-build-command "stack build")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-stylish-on-save t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(lsp-ui-doc-use-webkit t)
 '(package-selected-packages
   '(org-roam stack-mode doom-modeline all-the-icons which-key vue-html-mode use-package treemacs-projectile transpose-frame toml-mode sublime-themes subatomic256-theme subatomic-theme soothe-theme seoul256-theme realgud rainbow-mode pyimport py-isort py-autopep8 org-journal org-bullets ob-async nyan-mode nord-theme modus-vivendi-theme modus-operandi-theme magit lsp-ui lsp-java lsp-haskell js3-mode importmagic hindent hasklig-mode git-gutter flycheck-mypy flycheck-haskell emojify emoji-cheat-sheet-plus elpy dockerfile-mode docker-compose-mode darktooth-theme ccls blacken auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
