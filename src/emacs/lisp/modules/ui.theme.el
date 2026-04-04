;; (use-package gruvbox-theme)
;; (load-theme 'gruvbox-dark-hard)

(use-package catppuccin-theme
  :ensure t
  :demand
  :config
  (load-theme 'catppuccin t)
  (catppuccin-load-flavor 'frappe))  ;; 'frappe | 'latte | 'macchiato | 'mocha

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  ;; (nerd-icons-font-family "GeistMono Nerd Font")  
  )

(provide 'ui.theme)
