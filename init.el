;; Quality of life
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(require 'ido)
(ido-mode t)

;; Text editing
(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "spanish") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'latex-mode-hook 'outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") ; Or something else

(setq-default indent-tabs-mode nil)

;; GUI-only settings
(when window-system
  (progn
    ;; Set transparency of emacs
    (defun transparency (value)
      "Sets the transparency of the frame window. 0=transparent/100=opaque"
      (interactive "nTransparency Value 0 - 100 opaque:")
      (set-frame-parameter (selected-frame) 'alpha value))

    (set-frame-parameter (selected-frame) 'alpha '(90 . 50))
    (add-to-list 'default-frame-alist '(alpha . (90 . 50)))
    (add-to-list 'default-frame-alist '(fullscreen . maximized))))


;; Package management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

;; NLinum (faster line number package)
(use-package nlinum
  :ensure t
  :init (global-nlinum-mode 1))

;; Evil mode (vim emulation)
(use-package evil
  :ensure t
  :config (evil-mode 1))

;; Magit (git integration)
(use-package magit
  :ensure t
  :bind (("C-x m" . magit-status)))

;; Beacon (flash cursor when adjusting positions)
(use-package beacon
  :if window-system
  :ensure t
  :diminish beacon-mode
  :disabled t
  :init (beacon-mode 1)
  :config
  (add-to-list 'beacon-dont-blink-major-modes 'eshell-mode))

;; Emmet mode (html shortcuts)
(use-package emmet-mode
  :ensure t
  :diminish emmet-mode
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'vue-mode-hook 'emmet-mode))

;; Web mode (improved mode for editing web stuff)
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

;; LaTeX
(use-package tex
  :if (locate-file "latex" exec-path)
  :ensure auctex
  :no-require t
  :config
  (require 'tex)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil))

;; Powerline
(use-package powerline
  :ensure t
  :config (powerline-center-evil-theme))

;; Diff-hl deleted)
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

;; Themes
(setq custom-safe-themes t)

(use-package gotham-theme
  :if window-system
  :ensure t
  :no-require t
  :disabled t)

(use-package noctilux-theme
  :if window-system
  :ensure t
  :no-require t
  :disabled t)

(use-package afternoon-theme
  :if window-system
  :ensure t
  :no-require t
  :disabled t)

(use-package silkworm-theme
  :if window-system
  :ensure t
  :no-require t
  :disabled t)

(use-package tronesque-theme
  :if window-system
  :ensure t
  :no-require t
  :disabled t)

(load-theme 'tronesque)

(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#292929" "#ff3333" "#aaffaa" "#aaeecc" "#aaccff" "#FF1F69" "#aadddd" "#999999"])
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(foreground-color "#cccccc"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
