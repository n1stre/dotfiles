(menu-bar-mode -1) ;; disable top menu bar
(tool-bar-mode -1) ;; disable toolbar
(scroll-bar-mode -1) ;; disable scrollbar

(setq inhibit-startup-screen t) ;; disable startup screen

(global-display-line-numbers-mode 1) ;; show line numbers globally

(use-package gruvbox-theme)
(load-theme 'gruvbox-dark-hard)
(set-face-attribute 'line-number nil :background nil)   
;; (set-face-attribute 'line-number-current-line nil :foreground "yellow" :background "blue")   

(provide 'core-ui)