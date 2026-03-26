(menu-bar-mode -1) ;; disable top menu bar
(tool-bar-mode -1) ;; disable toolbar
(scroll-bar-mode -1) ;; disable scrollbar

(setq inhibit-startup-screen t) ;; disable startup screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; (global-display-line-numbers-mode 1) ;; show line numbers globally
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; (use-package gruvbox-theme)
;; (load-theme 'gruvbox-dark-hard)

(use-package catppuccin-theme
  :ensure t
  :demand
  :config
  (load-theme 'catppuccin t)
  (catppuccin-load-flavor 'frappe))  ;; 'frappe | 'latte | 'macchiato | 'mocha

;; (set-face-attribute 'line-number nil :background nil)   
;; (set-face-attribute 'line-number-current-line nil :foreground "yellow" :background "blue")   
(set-face-attribute 'default nil :height 160)

(provide 'core-ui)
