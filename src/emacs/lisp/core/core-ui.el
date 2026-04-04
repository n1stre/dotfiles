(menu-bar-mode -1) ;; disable top menu bar
(tool-bar-mode -1) ;; disable toolbar
(scroll-bar-mode -1) ;; disable scrollbar

(setq 
 inhibit-startup-screen t  ;; disable startup screen
 )

(setopt display-line-numbers-width-start 100)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)


;; (set-face-attribute 'line-number nil :background nil)   
;; (set-face-attribute 'line-number-current-line nil :foreground "yellow" :background "blue")   
(set-face-attribute 'default nil :font "GeistMono Nerd Font" :height 140)
;; (set-face-attribute 'default nil :font "Menlo" :height 150)


;; (setq display-time-day-and-date nil)
;; (setq display-time-load-average nil)
;; (setq display-time-24hr-format t)
;; (display-time-mode 1)
;; (setq-default mode-line-format '("11 %b %* %z " display-time-string " (%l, %c)"))

(set-default 'truncate-lines t)
;; (setq truncate-partial-width-windows nil)
;; Horizontal scrolling mouse events should actually scroll left and right.
;; (global-set-key (kbd "<mouse-6>") (lambda () (interactive)
;; 				    (if truncate-lines (scroll-right 1))))
;; (global-set-key (kbd "<mouse-7>") (lambda () (interactive)
;; 				    (if truncate-lines (scroll-left 1))))

(provide 'core-ui)
