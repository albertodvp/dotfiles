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
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(awesome-tray-mode-line-active-color "#0031a9")
 '(awesome-tray-mode-line-inactive-color "#e0e0e0")
 '(custom-enabled-themes '(darktooth))
 '(custom-safe-themes
   '("bf4b3dbc59b2b0873bd74ebf8f3a8c13d70dc3d36a4724b27edb1e427f047c1e" "845489fb9f7547e6348a80f942402fc7ac7c6854b0accabc49aeddd8cd4a2bd9" "4a201d19d8f7864e930fbb67e5c2029b558d26a658be1313b19b8958fe451b55" "b7133876a11eb2ded01b4b144b45d9e7457f80dd5900c332241881ab261c50f4" "a1e54c03c2fa33d4cacabd32fcdbab8a8f3c287d8e6565605817c61cf179c6c0" "8878226b9bda9a16c2639a85d86af1a4eac16e88522587afa368d745006ef476" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#202020")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(fringe-mode 4 nil (fringe))
 '(highlight-tail-colors '(("#aecf90" . 0) ("#c0efff" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#70480f")
     ("TODO" . "#721045")
     ("NEXT" . "#5317ac")
     ("THEM" . "#8f0075")
     ("PROG" . "#00538b")
     ("OKAY" . "#30517f")
     ("DONT" . "#315b00")
     ("FAIL" . "#a60000")
     ("BUG" . "#a60000")
     ("DONE" . "#005e00")
     ("NOTE" . "#863927")
     ("KLUDGE" . "#813e00")
     ("HACK" . "#813e00")
     ("TEMP" . "#5f0000")
     ("FIXME" . "#a0132f")
     ("XXX+" . "#972500")
     ("REVIEW" . "#005a5f")
     ("DEPRECATED" . "#201f55")))
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-header)
 '(linum-format " %7i ")
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(package-selected-packages
   '(importmagic darktooth-theme seoul256-theme subatomic256-theme subatomic-theme modus-operandi-theme modus-vivendi-theme nord-theme soothe-theme ccls vue-mode use-package try transpose-frame toml-mode toml telega sublime-themes stack-mode spacemacs-theme realgud-ipdb python-pytest pytest pylint pyimpsort pyimport pyenv-mode py-isort py-autopep8 plantuml-mode pdf-tools pdb-mode org-kanban org-journal org-capture-pop-frame ob-ipython material-theme magit lsp-haskell jupyter js-format js-auto-format-mode jedi isortify htmlize flymake-python-pyflakes eslint-fix elpy ein dockerfile-mode docker-compose-mode dante blacken auctex-latexmk))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#a60000")
     (40 . "#721045")
     (60 . "#8f0075")
     (80 . "#972500")
     (100 . "#813e00")
     (120 . "#70480f")
     (140 . "#5d3026")
     (160 . "#184034")
     (180 . "#005e00")
     (200 . "#315b00")
     (220 . "#005a5f")
     (240 . "#30517f")
     (260 . "#00538b")
     (280 . "#093060")
     (300 . "#0031a9")
     (320 . "#2544bb")
     (340 . "#0000c0")
     (360 . "#5317ac")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["#000000" "#a60000" "#005e00" "#813e00" "#0031a9" "#721045" "#00538b" "#f0f0f0"])
 '(xterm-color-names-bright
   ["#505050" "#972500" "#315b00" "#70480f" "#2544bb" "#8f0075" "#30517f" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
