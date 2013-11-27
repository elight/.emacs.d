(global-set-key (kbd "M-s")     'fixup-whitespace) ; best function ever

(when window-system (global-unset-key "\C-z")) ; ugh

;;;###autoload
(defun rwd-previous-line-6 () ; C-up 6 lines at a time, ala xemacs
  (interactive)
  (previous-line 6))

;;;###autoload
(defun rwd-forward-line-6 () ; C-down 6 lines at a time, ala xemacs
  (interactive)
  (forward-line 6))

;;;###autoload
(defun rwd-scroll-up () ; M-up moves text but not cursor
  (interactive)
  (scroll-down 1))

;;;###autoload
(defun rwd-scroll-down () ; M-down moves text but not cursor
  (interactive)
  (scroll-up 1))

;; compatibility:
;;(global-set-key (kbd "M-g")      'goto-line)
(global-set-key (kbd "<C-up>")   'rwd-previous-line-6)
(global-set-key (kbd "<C-down>") 'rwd-forward-line-6)
(global-set-key (kbd "<M-up>")   'rwd-scroll-up)
(global-set-key (kbd "<M-down>") 'rwd-scroll-down)

(provide 'sanity)
