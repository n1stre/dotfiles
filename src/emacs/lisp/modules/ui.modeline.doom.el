(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq
   doom-modeline-lsp t
   doom-modeline-lsp-icon t
   doom-modeline-height 36
   )
  
  )

(provide 'ui.modeline.doom)
