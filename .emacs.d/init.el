(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fiplr yaml-mode elpy neotree all-the-icons js2-refactor js2-highlight-vars ac-js2 projectile markdown-mode dockerfile-mode flycheck magit-find-file magit-filenotify magit which-key terraform-mode hcl-mode git-blamed csv-nav csv-mode csv auto-complete-rst ansible))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-linum-mode t)

;; what fiplr should ignore
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*~"))))

;; elpy
(elpy-enable)

;; neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; which-key
(which-key-mode)
