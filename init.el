;; init.el --- Emacs configuration

;; ---- INSTALL PACKAGES ----

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    column-enforce-mode
    doom-themes
    ein
    elpy
    flycheck
    magit
    markdown-mode
    neotree
    py-autopep8
    pyvenv))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; ---- BASIC CUSTOMIZATION ----

(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally

;; ---- DOOM THEME STUFF ----

(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(load-theme 'doom-one t) ; load particular doom theme
(doom-themes-visual-bell-config) ; enable flashing mode-line on errors
(doom-themes-org-config)

;; ---- PYTHON CONFIGURATION ----

(elpy-enable)
;; (elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8 on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; use column-enforce-mode with elpy
(require 'column-enforce-mode)
(add-hook 'elpy-mode-hook 'column-enforce-mode)

;; ---- CONDA VIRTUAL ENV STUFF ----

(setenv "WORKON_HOME" "/anaconda/envs") ; point to location of anaconda venvs
(pyvenv-mode 1)

;;init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/pandoc") ; point to location of Markdown processor
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
