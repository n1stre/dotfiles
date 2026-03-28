(menu-bar-mode -1) ;; disable top menu bar
(tool-bar-mode -1) ;; disable toolbar
(scroll-bar-mode -1) ;; disable scrollbar

(setq 
 inhibit-startup-screen t  ;; disable startup screen
 )

(setopt display-line-numbers-width-start t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;; (set-face-attribute 'line-number nil :background nil)   
;; (set-face-attribute 'line-number-current-line nil :foreground "yellow" :background "blue")   
(set-face-attribute 'default nil :height 160)


;; (setq display-time-day-and-date nil)
;; (setq display-time-load-average nil)
;; (setq display-time-24hr-format t)
;; (display-time-mode 1)
;; (setq-default mode-line-format '("11 %b %* %z " display-time-string " (%l, %c)"))

(provide 'core-ui)
