;; == package mgmt ==========================================================

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; -- load everything from dotfiles-init-dir ---------------------------------
(setq init-file (or load-file-name buffer-file-name))
(setq dotfiles-dir (file-name-directory init-file))
(setq dotfiles-init-dir (expand-file-name "init.d" dotfiles-dir))
(if (file-exists-p dotfiles-init-dir)
  (dolist (file (directory-files dotfiles-init-dir t "\\.el$"))
    (load file)))


;; == third-party packages ===================================================
(setq vendor-dir (expand-file-name "vendor" dotfiles-dir))
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'window-numbering)
(window-numbering-mode 1)

(require 'osx-clipboard)

(require 'sanity)

;;(require 'rails-dev-env)


;; -- M-g g is annoying
 (global-set-key (kbd "C-x l") 'goto-line)

;; -- disable stuff ----------------------------------------------------------
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)

;; TODO turn off linum in multi-term dammit!

;; -- look -------------------------------------------------------------------
(setq default-line-spacing 5)
(set-default-font "Georgia-18")

;; -- coding -----------------------------------------------------------------
(setq tags-table-list
  '("/Users/sean/projects/qs-core/TAGS"))

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . enh-ruby-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; == themes =================================================================

;; It's in Cask now instead /themes. Yay!
(load-theme 'zenburn t)

;; == projectile setup from http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/?utm_source=rubyweekly&utm_medium=email

(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-x b") 'projectile-switch-to-buffer)


;;; Hey, backspace, work right, dammit!
(normal-erase-is-backspace-mode 0)

;;; global mappings

(windmove-default-keybindings)

; gist private/public
(setq gist-view-gist t)
(global-set-key (kbd "C-c g r") 'gist-region-or-buffer-private)
(global-set-key (kbd "C-c g u") 'gist-region-or-buffer)

;;; auto-complete-mode
(auto-complete)
(auto-complete-mode)

; I want it everywhere!
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

; comment/uncomment region
;(define-key global-map (kbd "C-/") 'comment-region)
;(define-key global-map (kbd "C-.") 'uncomment-region)

; multi-term
(global-unset-key (kbd "C-x m"))
(define-key global-map (kbd "C-x m") 'multi-term)

;;; ruby

(add-hook 'ruby-mode-hook 'auto-complete-mode)
(add-hook 'ruby-mode-hook 'robe-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ruby-deep-arglist (quote f)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

