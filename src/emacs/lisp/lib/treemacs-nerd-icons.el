;;; treemacs-nerd-icons.el --- Emacs Nerd Font Icons theme for treemacs -*- lexical-binding: t -*-

;; Copyright (C) 2023 Hongyu Ding <rainstormstudio@yahoo.com>

;; Author: Hongyu Ding <rainstormstudio@yahoo.com>
;; Keywords: lisp
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3") (nerd-icons "0.0.1") (treemacs "0.0"))
;; URL: https://github.com/rainstormstudio/treemacs-nerd-icons
;; Keywords: files, icons, treemacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; nerd-icons theme for treemacs

;;; Code:

(require 'nerd-icons)
(require 'treemacs)

(defface treemacs-nerd-icons-root-face
  '((t (:inherit nerd-icons-dorange)))
  "Face used for the root icon in nerd-icons theme."
  :group 'treemacs-faces)

(defface treemacs-nerd-icons-file-face
  '((t (:inherit nerd-icons-orange)))
  "Face used for the directory and file icons in nerd-icons theme."
  :group 'treemacs-faces)

(defface treemacs-nerd-icons-error-face
  '((t (:inherit nerd-icons-red)))
  "Face used for the directory and file icons in nerd-icons theme."
  :group 'treemacs-faces)

(defface treemacs-nerd-icons-warning-face
  '((t (:inherit nerd-icons-yellow)))
  "Face used for the directory and file icons in nerd-icons theme."
  :group 'treemacs-faces)

(defface treemacs-nerd-icons-info-face
  '((t (:inherit nerd-icons-blue)))
  "Face used for the directory and file icons in nerd-icons theme."
  :group 'treemacs-faces)

(defcustom treemacs-nerd-icons-icon-size 1.0
  "The default icon size in treemacs."
  :group 'treemacs
  :type 'float)

(defvar treemacs-nerd-icons-tab (propertize "\t" :face 'treemacs-nerd-icons-file-face))

(treemacs-create-theme "nerd-icons"
  :config
  (let* (
	       ;;(sep treemacs-nerd-icons-tab)
	       (sep " ")
         (face 'treemacs-nerd-icons-file-face)
         (size treemacs-nerd-icons-icon-size)
         (icon-base (lambda (icon) (format "%s%s" (ns-nerd-icon icon :face face :height size) sep)))
	       (icon-err (lambda (icon) (format "%s%s" (ns-nerd-icon icon :face 'treemacs-nerd-icons-error-face :height size) sep)))
	       (icon-warn (lambda (icon) (format "%s%s" (ns-nerd-icon icon :face 'treemacs-nerd-icons-warning-face :height size) sep)))
	       (icon-info (lambda (icon) (format "%s%s" (ns-nerd-icon icon :face 'treemacs-nerd-icons-info-face :height size) sep)))
	       )
    
    (dolist (item nerd-icons-extension-icon-alist)
      (let* ((extension (car item))
             (func (cadr item))
             (args (append (list (cadr (cdr item))) `(:v-adjust 0.0 :height ,size :face ,face) (cdr (cddr item))))
             (icon (apply func args))
	           )
        (let* ((icon-pair (cons (format "%s%s" icon sep) (format "%s%s" icon sep)))
               (gui-icons (treemacs-theme->gui-icons treemacs--current-theme))
               (tui-icons (treemacs-theme->tui-icons treemacs--current-theme))
               (gui-icon  (car icon-pair))
               (tui-icon  (cdr icon-pair)))
          (ht-set! gui-icons extension gui-icon)
          (ht-set! tui-icons extension tui-icon))))

    ;; directory and other icons
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_multiple") :extensions (root-closed root-open) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-folder_open_o")  :extensions (dir-open "src-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-folder") :extensions (dir-closed "src-closed") :fallback 'same-as-icon)
    ;;(treemacs-create-icon :icon (funcall icon-base "nf-oct-code") :extensions ("src-open") :fallback 'same-as-icon)
    ;;(treemacs-create-icon :icon (funcall icon-base "nf-oct-code") :extensions ("src-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("build-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_cog") :extensions ("build-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("test-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_check") :extensions ("test-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("bin-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_zip") :extensions ("bin-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("git-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_git") :extensions ("git-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("github-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_github") :extensions ("github-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("public-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_eye") :extensions ("public-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("private-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_lock") :extensions ("private-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("temp-open" "tmp-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_question") :extensions ("temp-closed" "tmp-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("readme-open" "docs-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_file") :extensions ("readme-closed" "docs-closed") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-custom-folder_open") :extensions ("screenshots-open" "icons-open") :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-folder_image") :extensions ("screenshots-closed" "icons-closed") :fallback 'same-as-icon)

    (treemacs-create-icon :icon (funcall icon-base "nf-oct-package") :extensions (tag-open) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-oct-package") :extensions (tag-closed) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-oct-tag") :extensions (tag-leaf) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-mail") :extensions (mail) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-oct-bookmark") :extensions (bookmark) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-monitor") :extensions (screen) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-home") :extensions (house) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-list") :extensions (list) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-repeat") :extensions (repeat) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-suitcase") :extensions (suitcase) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-md-close") :extensions (close) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-oct-calendar") :extensions (calendar) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-briefcase") :extensions (briefcase) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-err "nf-oct-flame") :extensions (error) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-warn "nf-oct-stop") :extensions (warning) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-info "nf-oct-info") :extensions (info) :fallback 'same-as-icon)
    (treemacs-create-icon :icon (funcall icon-base "nf-fa-file_o") :extensions (fallback) :fallback 'same-as-icon)

    (treemacs-create-icon :icon (funcall icon-base "nf-dev-emacs") :extensions (emacs-lisp-mode))

    (treemacs-create-icon :icon (funcall icon-base "nf-fa-file_o") :extensions ("manifest"))
    (treemacs-create-icon :icon (funcall icon-base "nf-dev-npm") :extensions ("npmignore" "npmrc" "package.json" "package-lock.json" "npm-shrinwrap.json"))
    (treemacs-create-icon :icon (funcall icon-base "nf-dev-nginx") :extensions ("nginx.conf" "nginx"))
    (treemacs-create-icon :icon (funcall icon-base "nf-dev-bash") :extensions ("sh" "zsh" "zshrc" "zshenv" "fish" "zprofile" "zlogin" "zlogout" "bash" "bash_profile" "bashrc" "bash_login" "profile" "bash_aliases"))
    ))


;;;###autoload
(defun treemacs-nerd-icons-config ()
  "Install treemacs configuration."
  (treemacs-load-theme "nerd-icons"))

(provide 'treemacs-nerd-icons)
;;; treemacs-nerd-icons.el ends here
