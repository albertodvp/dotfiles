(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ccls vue-mode use-package try transpose-frame toml-mode toml telega sublime-themes stack-mode spacemacs-theme realgud-ipdb python-pytest pytest pylint pyimpsort pyimport pyenv-mode py-isort py-autopep8 plantuml-mode pdf-tools pdb-mode org-kanban org-journal org-capture-pop-frame ob-ipython material-theme magit lsp-haskell jupyter js-format js-auto-format-mode jedi isortify htmlize flymake-python-pyflakes eslint-fix elpy ein dockerfile-mode docker-compose-mode dante blacken auctex-latexmk))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
