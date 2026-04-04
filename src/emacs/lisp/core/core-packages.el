(require 'package)

(setq package-archives '(
	 ("melpa" . "https://melpa.org/packages/") ;; comment this out if magit fails to install
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/"))
      )

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(setq recentf-save-file (expand-file-name ".cache/recentf" user-emacs-directory))

(provide 'core-packages)
