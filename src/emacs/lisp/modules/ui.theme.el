;;; -*- lexical-binding: t; -*-

;; (use-package gruvbox-theme)
;; (load-theme 'gruvbox-dark-hard)

(set-face-attribute 'default nil :font "GeistMono Nerd Font" :height 140)
;;(set-face-attribute 'default nil :font "Menlo" :height 140)
;;(set-face-attribute 'default nil :font "OverpassM Nerd Font Mono" :height 140)
;;(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140 :weight 'Light)
;;(set-face-attribute 'default nil :font "MonaspiceNe Nerd Font" :height 140 :weight 'Regular)

(use-package catppuccin-theme
  :ensure t
  :demand
  :config
  (load-theme 'catppuccin t)
  (catppuccin-load-flavor 'frappe)  ;; 'frappe | 'latte | 'macchiato | 'mocha  
  ) 

(use-package nerd-icons
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  ;;(nerd-icons-font-family "GeistMono Nerd Font")  
  )


(setq ns-clr-sf-0 (catppuccin-color 'crust))
(setq ns-clr-sf-1 (catppuccin-color 'mantle))
(setq ns-clr-sf-2 (catppuccin-color 'base))
(setq ns-clr-sf-3 (catppuccin-color 'surface1))

(setq ns-clr-success (catppuccin-color 'green))
(setq ns-clr-warning (catppuccin-color 'yellow))
(setq ns-clr-danger (catppuccin-color 'red))
(setq ns-clr-divider ns-clr-sf-3)
(setq ns-clr-header-line ns-clr-sf-1)
(setq ns-clr-treemacs ns-clr-sf-1)
(setq ns-clr-treemacs-git-modified (catppuccin-color 'yellow))

(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)
(setq window-divider-default-places t)
;;(setq window-divider-first-pixel 'window-divider)
;;(setq window-divider-last-pixel 'window-divider)
(window-divider-mode 1)

(set-face-background 'default ns-clr-sf-1)
(set-face-background 'fringe ns-clr-sf-1)
(set-face-background 'line-number ns-clr-sf-1)
(set-face-foreground 'window-divider ns-clr-divider)
(set-face-background 'mode-line ns-clr-sf-0)
(set-face-background 'mode-line-inactive ns-clr-sf-1) 


;; (custom-set-faces
;;  `(header-line ((t (:background ,ns-clr-header-line))))
;;  )

;; (setq ns-header-line-box `(:line-width 20 :color ,ns-clr-header-line))
;; (custom-set-faces `(header-line ((t (:background ,ns-clr-header-line :foreground "Red" :box ,ns-header-line-box )))))


;;(add-to-list 'default-frame-alist '(internal-border-width . 10))

(provide 'ui.theme)
