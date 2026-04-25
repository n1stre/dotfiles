;;; -*- lexical-binding: t; -*-



(defun ns-treemacs-mode-handler()
  (face-remap-add-relative 'default `(:background ,ns-clr-treemacs))
  (face-remap-add-relative 'fringe `(:background ,ns-clr-treemacs))
  )


(defun ns-treemacs-open-ws-switch-menu(event)
  (interactive "e")
  (popup-menu
   '("Menu"
     ["Dashboard" (dashboard-open) t]
     ("LSP"
      ["Show Symbols" (lsp-treemacs-symbols) t]
      )
     ("Say something"
      ["Say Hello" (message "Hello!") t]
      ["Say Goodbye" (message "Goodbye!") t]
      )
     )
   event)
  )

(defvar my-mode-line-menu-map
  (let ((map (make-sparse-keymap)))
    (define-key map [header-line mouse-1] #'ns-treemacs-open-ws-switch-menu)
    map
    ))


(setq ns-treemacs-header
      '(:eval
        (let* ((ws (treemacs-workspace->name (treemacs-current-workspace)))
               (wst (upcase (s-truncate 20 ws)))
               )
          (ns-justify-between
           (concat
            " "
            (propertize
             (format "%s" (ns-nerd-icon "nf-md-menu"))
             'face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'mode-line-inactive))
             'mouse-face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'default))
             'help-echo "Explorer menu"
             'local-map my-mode-line-menu-map
             )
            (ns-create-bar-image 'header-line 1 50)
	          (propertize
             (format " WS:%s " wst)
             'face `(:foreground ,(face-foreground 'mode-line-inactive) :weight bold)
             'mouse-face `(:foreground ,(face-foreground 'default))
             'help-echo "Current workspace"
             'local-map my-mode-line-menu-map
             )
            )
           
           (concat
            (propertize
             (format "%s" (ns-nerd-icon "nf-md-arrow_collapse_left"))
             'help-echo "Decrease Explorer Width"
             'local-map my-mode-line-menu-map
             'face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'mode-line-inactive))
             'mouse-face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'default))                        
             )
            (propertize
             (format "%s" (ns-nerd-icon "nf-md-arrow_collapse_right"))
             'help-echo "Increase Explorer Width"
             'local-map my-mode-line-menu-map
             'face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'mode-line-inactive))
             'mouse-face `(:family ,nerd-icons-font-family :foreground ,(face-foreground 'default))                        
             )
            
            )
           4
	         ))))

;; (setq ns-treemacs-modeline nil)
(setq ns-treemacs-modeline
      (eval
       '(progn
          (require 'doom-modeline)

          (doom-modeline-def-segment ns-treemacs-workspace-name
            (propertize
             (format " %s " (treemacs-workspace->name (treemacs-current-workspace)))
             'face (doom-modeline-face 'doom-modeline-buffer-minor-mode)
             ))
          
          (doom-modeline-def-segment ns-treemacs-icon
            (propertize
             (format "%s" (doom-modeline-icon 'faicon "nf-fa-tree" "⍑" "D" :face `(:foreground ,ns-clr-success)))
             ;;'help-echo "mouse-1: Kill buffer"
             ;;'local-map mode-line-kill-buffer-keymap
             ;;'mouse-face 'mode-line-highlight
             ))
          
          (doom-modeline-def-modeline 'treemacs '(bar ns-treemacs-icon major-mode) '(ns-treemacs-workspace-name))
          (doom-modeline 'treemacs)
          )))



(defun ns-treemacs-start-on-boot (&optional focus-treemacs)
  (-let [initial-window (selected-window)]
    (treemacs)
    (hl-line-highlight)
    (setq header-line-format ns-treemacs-header)
    (redisplay)
    (unless focus-treemacs (select-window initial-window))
    ))


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  ;; (with-eval-after-load 'treemacs
  ;;   (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))
  :config
  (progn
    (require 'treemacs-nerd-icons)
    (treemacs-nerd-icons-config)
    
    (setq treemacs-buffer-name-function            #'treemacs-default-buffer-name
	        treemacs-buffer-name-prefix              " *Treemacs-Buffer-"
          
	        ;;treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)

          treemacs-collapse-dirs                   0
	        treemacs-deferred-git-apply-delay        0.5
	        treemacs-directory-name-transformer      #'identity
	        treemacs-display-in-side-window          t
	        treemacs-eldoc-display                   'simple
	        treemacs-file-event-delay                2000
	        treemacs-file-extension-regex            treemacs-last-period-regex-value
	        treemacs-file-follow-delay               0.2
	        treemacs-file-name-transformer           #'identity
	        treemacs-follow-after-init               t
	        treemacs-expand-after-init               t
	        treemacs-find-workspace-method           'find-for-file-or-pick-first
	        treemacs-git-command-pipe                ""
	        treemacs-goto-tag-strategy               'refetch-index
	        treemacs-header-scroll-indicators        '(nil . "^^^^^^")
	        treemacs-hide-dot-git-directory          t
	        treemacs-hide-dot-jj-directory           t
	        treemacs-indentation                     1
	        ;;treemacs-indentation-string              "·"
	        treemacs-indentation-string              " "
	        ;;treemacs-indentation-string              (propertize " " 'face 'treemacs-git-ignored-face)
	        treemacs-is-never-other-window           nil
	        treemacs-max-git-entries                 5000
	        treemacs-missing-project-action          'ask
	        treemacs-move-files-by-mouse-dragging    t
	        treemacs-move-forward-on-expand          nil
	        treemacs-no-png-images                   nil
	        treemacs-no-delete-other-windows         t
	        treemacs-project-follow-cleanup          nil
	        treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	        treemacs-position                        'left
	        treemacs-read-string-input               'from-child-frame
	        treemacs-recenter-distance               0.1
	        treemacs-recenter-after-file-follow      nil
	        treemacs-recenter-after-tag-follow       nil
	        treemacs-recenter-after-project-jump     'always
	        treemacs-recenter-after-project-expand   'on-distance
	        treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
	        treemacs-project-follow-into-home        nil
	        treemacs-show-cursor                     nil
	        treemacs-show-hidden-files               t
	        treemacs-silent-filewatch                nil
	        treemacs-silent-refresh                  nil
	        treemacs-sorting                         'alphabetic-asc
	        treemacs-select-when-already-in-treemacs 'move-back
	        treemacs-space-between-root-nodes        t
	        treemacs-tag-follow-cleanup              t
	        treemacs-tag-follow-delay                1.5
	        treemacs-text-scale                      nil
	        treemacs-user-mode-line-format           ns-treemacs-modeline
          treemacs-user-header-line-format         nil
	        treemacs-wide-toggle-width               70
	        treemacs-width                           35
	        treemacs-width-increment                 1
	        treemacs-width-is-initially-locked       nil
	        treemacs-no-png-images                   nil ;; TODO: investigate why npm related icons is not showing when setting this to t
	        treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;; (treemacs-resize-icons 44)

    

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    ;;(treemacs-indent-guide-mode t)
    (treemacs-fringe-indicator-mode 'always)
    ;;(treemacs-resize-icons 16)

    (set-face-background 'treemacs-window-background-face ns-clr-treemacs)    
    (set-face-foreground 'treemacs-git-modified-face ns-clr-treemacs-git-modified)
    
    (set-face-bold 'treemacs-root-face t)
    (set-face-underline 'treemacs-root-face t)

    ;;(set-face-foreground 'treemacs-root-face "red")
    ;;(set-face-background 'treemacs-hl-line-face "green")

    
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t) (treemacs-git-mode 'deferred))
      (`(t . _) (treemacs-git-mode 'simple))
      )
    )
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  )



;; (use-package treemacs-evil
;;   :after (treemacs evil)
;;   :ensure t)

;; (use-package treemacs-projectile
;;   :after (treemacs projectile)
;;   :ensure t)

;; (use-package treemacs-icons-dired
;;   :hook (dired-mode . treemacs-icons-dired-enable-once)
;;   :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))

;; (use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
;;   :after (treemacs)
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Tabs))


;;    (treemacs-start-on-boot)


(add-hook 'treemacs-mode-hook 'ns-treemacs-mode-handler)
(ns-treemacs-start-on-boot)

;;(set-face-background 'treemacs-window-background-face ns-clr-treemacs)    

(provide 'ui.treemacs)
