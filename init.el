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

(global-linum-mode t) ; enable line numbers globally
(setq inhibit-startup-message t) ; hide startup message

;; ---- DOOM THEME STUFF ----

(setq doom-themes-enable-bold t    ; bold not universally disabled
      doom-themes-enable-italic t) ; italics not universally disabled

(load-theme 'doom-one t) ; load particular doom theme
(doom-themes-visual-bell-config) ; enable flashing mode-line on errors
(doom-themes-org-config)

;; ---- PYTHON CONFIGURATION ----

(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; flycheck with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save) ; autopep8 on save
(add-hook 'elpy-mode-hook 'column-enforce-mode) ; column-enforce-mode with elpy

;; ---- CONDA VIRTUAL ENV STUFF ----

(setenv "WORKON_HOME" "/anaconda/envs") ; point to location of anaconda venvs
(pyvenv-mode 1)

;;init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/pandoc") ; point to Markdown processor
 (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ))
