(use-package magit)

(use-package diff-hl
  :config
  
  (defun enable-diff-hl ()
    "Setup function for diff-h1-mode"
    (turn-on-diff-hl-mode)
    (diff-hl-show-hunk-mouse-mode)
    )
  
  ;; Only in `prog-mode' buffers, with `vc-dir' integration:  
  (add-hook 'prog-mode-hook 'enable-diff-hl)
  (add-hook 'vc-dir-mode-hook 'enable-diff-hl)
  )

(provide 'git)
