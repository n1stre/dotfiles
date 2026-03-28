
;; (use-package gruvbox-theme)
;; (load-theme 'gruvbox-dark-hard)

(use-package catppuccin-theme
  :ensure t
  :demand
  :config
  (load-theme 'catppuccin t)
  (catppuccin-load-flavor 'frappe))  ;; 'frappe | 'latte | 'macchiato | 'mocha

(provide 'ui.theme)
