;;; -*- lexical-binding: t; -*-


(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq
   doom-modeline-lsp t
   doom-modeline-lsp-icon t
   doom-modeline-height 36
   doom-modeline-bar-width 1
   )
  
  (doom-modeline-def-segment window-state
    (let ((face (if (doom-modeline--active) 'doom-modeline-emphasis 'doom-modeline)))
      (cond
       ((eq (window-dedicated-p) t)
	      (propertize
	       (format "%s" (doom-modeline-icon 'mdicon "nf-md-pin" "⍑" "D" :face face))
	       'help-echo "Window strongly dedicated to its buffer\nmouse-1: Toggle"
	       'local-map mode-line-window-dedicated-keymap
	       'mouse-face 'mode-line-highlight))
       ((window-dedicated-p)
	      (propertize
	       (format "%s" (doom-modeline-icon 'mdicon "nf-md-pin_outline" "⊤" "d" :face face))
	       'help-echo "Window dedicated to its buffer\nmouse-1: Toggle"
	       'local-map mode-line-window-dedicated-keymap
	       'mouse-face 'mode-line-highlight))
       (t (propertize
	         (format "%s" (doom-modeline-icon 'mdicon "nf-md-pin_off_outline" "⍑" "D" :face face))
	         'help-echo "Window is not dedicated to its buffer\nmouse-1: Toggle"
	         'local-map mode-line-window-dedicated-keymap
	         'mouse-face 'mode-line-highlight))
       )))


  (defvar mode-line-kill-buffer-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map [mode-line mouse-1] 'ns-mouse-delete-window-and-buffer)
      (purecopy map)
      ) "Keymap for what is displayed by `mode-line-kill-buffer'." 
    )

  (doom-modeline-def-segment kill-buffer
    (propertize
     (format " %s " (doom-modeline-icon 'mdicon "nf-md-skull" "⍑" "D" :face `(:foreground ,ns-clr-danger)))
     'help-echo "mouse-1: Kill buffer"
     'local-map mode-line-kill-buffer-keymap
     'mouse-face 'mode-line-highlight)
    )

  
  (custom-set-faces
   '(doom-modeline-bar ((t (:inherit mode-line))))
   '(doom-modeline-bar-inactive ((t (:inherit mode-line-inactive)))))

  (doom-modeline-add-segment 'kill-buffer 'time :before 'all)
  )








(provide 'ui.modeline.doom)
