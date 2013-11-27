;; I'm too brain dead to get this to work as a vendored component. But then 
;; again, I haven't needed this for several months so *shrug*

(defun my-terminal ()
  (interactive)
  (custom-multi-term "TERMINAL"))

(defun rails-console ()
  (interactive)
  (custom-multi-term "CONSOLE")
  (term-send-raw-string "rails c\n"))

(defun rails-server ()
  (interactive)
  (custom-multi-term "RAILS")
  (term-send-raw-string "rails s\n"))

(defun custom-multi-term (name)
  (multi-term)
  (rename-buffer name)
  (linum-mode 0))

(defun my-rails-work ()
  (interactive)

  (my-terminal)

  (split-window-right)
  (next-multiframe-window)

  (rails-console)

  (split-window-below)
  (next-multiframe-window)


  (rails-server)
  (next-multiframe-window)

  (split-window-below)
  (next-multiframe-window)
)

(define-key global-map (kbd "C-x m t") 'my-terminal)

(define-key global-map (kbd "C-x m w") 'my-rails-work)

(provide 'rails-dev-env)
