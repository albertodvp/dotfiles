(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(org-babel-load-file "~/.emacs.d/config.org")
(garbage-collect)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(ignored-local-variable-values '((encoding . utf-8)))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(vterm code-review pdf-tools flycheck-elm poetry json-mode mmm-jinja2 jinja2-mode yafolding tide typescript-mode vue-mode nu-mode eglot lsp-pyright elm-mode cargo graphql-mode hl-todo bash-completion protobuf-mode rust-mode vscode-dark-plus-theme solaire-mode dhall-mode purescript-mode nix-mode treemacs-projectile ripgrep elixir-mode org which-key use-package toml-mode subatomic256-theme smartparens realgud pyimport py-isort py-autopep8 projectile php-mode org-roam org-journal org-fragtog org-bullets ob-elixir ob-async multiple-cursors minions magit lsp-ui lsp-python-ms lsp-haskell hindent helm-xref helm-lsp hasklig-mode golden-ratio git-gutter flycheck-haskell expand-region exec-path-from-shell elpy doom-themes doom-modeline dockerfile-mode docker-compose-mode diff-hl darktooth-theme dap-mode crux ccls blacken all-the-icons))
 '(purescript-mode-hook '(capitalized-words-mode turn-on-purescript-indentation))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'set-goal-column 'disabled nil)
