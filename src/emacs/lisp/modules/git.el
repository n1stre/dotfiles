;;; -*- lexical-binding: t; -*-

(use-package magit)


(defun ns-enable-diff-hl ()
  "Setup function for diff-h1-mode"
  (turn-on-diff-hl-mode)
  (diff-hl-show-hunk-mouse-mode)
  )

(use-package diff-hl
  :config
  (setq diff-hl-show-hunk-buffer-name " *diff-hl-show-hunk-buffer*")
  (setq diff-hl-show-hunk-diff-buffer-name " *diff-hl-show-hunk-diff-buffer*")
  ;;(setq diff-hl-show-hunk-function 'diff-hl-show-hunk-inline)
  (setq diff-hl-show-hunk-function 'diff-hl-show-hunk-posframe)

  ;; Only in `prog-mode' buffers, with `vc-dir' integration:  
  (add-hook 'prog-mode-hook 'ns-enable-diff-hl)
  (add-hook 'vc-dir-mode-hook 'ns-enable-diff-hl)
  )

(provide 'git)
