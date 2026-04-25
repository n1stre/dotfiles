(defun ns-one-window-excluding-treemacs-p ()
  "Return non-nil if there is only one window excluding treemacs."
  (interactive)
  (let* (
	       (buffers (mapcar (lambda (x) (buffer-name (window-buffer x))) (window-list)))
	       (buffers-non-treemacs (seq-filter (lambda (x) (unless (string-prefix-p treemacs-buffer-name-prefix x) x )) buffers))
	       )
    (< (length buffers-non-treemacs) 2)
    ))

(defun ns-posn-window-modeline-match-p (click)
  "Check if the user hasn't moved point out of the mode line before releasing the button."
  (interactive "e")
  (and (eq (posn-area (event-end click)) 'mode-line)
       (eq (posn-window (event-end click))
           (posn-window (event-start click))
	         )))

(defun ns-mouse-delete-window-and-buffer (click)
  "Delete the window you click on with killing its buffer. This command must be bound to a mouse click."
  (interactive "e")
  (mouse-minibuffer-check click)
  (when (ns-posn-window-modeline-match-p click)
    (let* ((w (posn-window (event-start click)))
	         (b (buffer-name (window-buffer w))))
      (unless (ns-one-window-excluding-treemacs-p)
	      (message "Mouse Killing Window %s" w)
	      (delete-window w)
	      )
      (message "Mouse Killing Buffer %s" b)
      (kill-buffer b)
      )))

(defun ns-set-current-window-height (n)
  "Set the selected window's height to N lines."
  (interactive "Height (N Lines): ")
  (let ((current-height (window-height)))
    (enlarge-window (- n current-height))
    ))

(defun ns-open-zsh ()
  "Open zsh term"
  (interactive)
  (let ((w (split-window-below)))
    (select-window w)
    (term "/bin/zsh")
    (rename-uniquely)
    (toggle-window-dedicated)
    (ns-set-current-window-height 6)
    ))

(defun ns-middle-click (prompt)
  "Super+LeftClick is MiddleClick. Needed for mouseless touchpad usage"
  (defun ns-middle-click-inner (e)
    (interactive "e")
    (setcar e 'mouse-2)
    (vector e))
  (call-interactively 'ns-middle-click-inner))


(defun ns-dashboard-init-time ()
  "Return Emacs starting time string in seconds."
  (if (fboundp 'elpaca--queued)
      (format "%s seconds" (float-time (time-subtract elpaca-after-init-time before-init-time)))
    (emacs-init-time)
    ))


(defun ns-nerd-icon (icon &rest args)
  (cond
   ((string-prefix-p "nf-seti-" icon) (apply #'nerd-icons-sucicon icon args))
   ((string-prefix-p "nf-custom-" icon) (apply #'nerd-icons-sucicon icon args))
   ((string-prefix-p "nf-dev-" icon) (apply #'nerd-icons-devicon icon args))
   ((string-prefix-p "nf-fa-" icon) (apply #'nerd-icons-faicon icon args))
   ((string-prefix-p "nf-fae-" icon) (apply #'nerd-icons-faicon icon args))
   ((string-prefix-p "nf-md-" icon) (apply #'nerd-icons-mdicon icon args))
   ((string-prefix-p "nf-weather-" icon) (apply #'nerd-icons-wicon icon args))
   ((string-prefix-p "nf-oct-" icon) (apply #'nerd-icons-octicon icon args))
   ((string-prefix-p "nf-pl-" icon) (apply #'nerd-icons-powerline icon args))
   ((string-prefix-p "nf-ple-" icon) (apply #'nerd-icons-powerline icon args))
   ((string-prefix-p "nf-iec-" icon) (apply #'nerd-icons-ipsicon icon args))
   ((string-prefix-p "nf-linux-" icon) (apply #'nerd-icons-flicon icon args))
   ((string-prefix-p "nf-pom-" icon) (apply #'nerd-icons-pomicon icon args))
   ((string-prefix-p "nf-cod-" icon) (apply #'nerd-icons-codicon icon args))
   (t nil)
   ))




(defun ns-create-bar-image (face width height)
  "Create the bar image.
Use FACE for the bar, WIDTH and HEIGHT are the image size in pixels.
This function is borrowed from doom-modeline package.
Its purpose is to adjust height of modeline or headerline
"
  (when (and (image-type-available-p 'pbm)
             (numberp width) (> width 0)
             (numberp height) (> height 0))
    (propertize
     " " 'display
     (let ((color (or (face-background face nil t) "None")))
       (ignore-errors
         (create-image
          (concat (format "P1\n%i %i\n" width height)
                  (make-string (* width height) ?1)
                  "\n")
          'pbm t :scale 1 :foreground color :ascent 'center))))))


(defun ns-justify-between (left right adjust)
  "Return a string of `window-width' length containing left, and
right aligned respectively."
  (let* ((available-width (- (window-total-width) (length left) (or adjust 0))))
    (format (format "%%s %%%ds" available-width) left right)
    ))



(provide 'core-functions)
