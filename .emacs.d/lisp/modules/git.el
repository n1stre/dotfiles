(use-package magit) ;; best git UI in Emacs


(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq
   git-gutter:update-interval 2
   git-gutter:hide-gutter -1
   git-gutter:always-show-separator t
   git-gutter:margin-left 1
   )

  (custom-set-variables
   '(git-gutter:modified-sign "=")
   '(git-gutter:added-sign "+")
   '(git-gutter:deleted-sign "-")
   '(git-gutter:unchanged-sign " ")
   '(git-gutter:window-width git-gutter:margin-left)
   )

  ;; (set-face-foreground 'git-gutter:modified "purple")
  ;; (set-face-foreground 'git-gutter:added "#eeeeee")
  ;; (set-face-foreground 'git-gutter:deleted "red")
  
  (defun git-gutter-set-margins ()
    "Set margins in current buffer."
    (setq left-margin-width git-gutter:margin-left)  
    (set-window-buffer nil (current-buffer))
    )
  
  (add-hook 'prog-mode-hook 'git-gutter-set-margins)
  
  )

(provide 'git)
