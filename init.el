;; Quality of life
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;; Text editing

;; GUI-only settings
(when window-system
  (progn
    (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
    (add-to-list 'default-frame-alist '(alpha . (85 . 50)))
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

(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit evil nlinum which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
