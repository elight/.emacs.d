;; osx-clipboard.el begins here.

;; k. montuori <montuori at ignavus.info>
;; 11 july 2003

;; this is free software; 
;; if you make significant improvements, let me know!

;; of all the things apple's X implementation does well, managing the
;; global/os x clipboard isn't one of them.  these functions allow the 
;; osx clipboard to be "pasted" into the buffer at point or have the
;; current region (or zmacs-region) copied (or cut) into the clipboard.  

;; C-cM-c -- copy the region to clipboard (like cmd-c)
;; C-cM-x -- cut the region into the clipboard (like cmd-x)
;; C-cM-v -- paste the clipboard into the buffer at point (like cmd-v)

;; to install, put this .el file in your load-path somewhere and call
;;   (require 'osx-clipboard) 
;; in your .emacs file.

(defvar osx-pbpaste-cmd "/usr/bin/pbpaste"
  "*command-line paste program")

(defvar osx-pbcopy-cmd "/usr/bin/pbcopy"
  "*command-line copy program")

(defun osx-pbpaste ()
  "paste the contents of the os x clipboard into the buffer at point."
  (interactive)
  (call-process osx-pbpaste-cmd nil t t))

(defun osx-pbcopy ()
  "copy the contents of the region into the os x clipboard."
  (interactive)
;;  (if (region-exists-p)
  (if (or (and (boundp 'mark-active) mark-active)
         (and (fboundp 'region-exists-p) (region-exists-p)))
    (call-process-region 
     (region-beginning) (region-end) osx-pbcopy-cmd nil t t)
    (error "region not selected")))

(defun osx-pbcut ()
  "cut the contents of the region; put in os x clipboard."
  (interactive)
  (if (region-exists-p)
    (call-process-region 
     (region-beginning) (region-end) osx-pbcopy-cmd t t t)
    (error "region not selected")))

(define-key global-map "\C-c\M-v" 'osx-pbpaste)
(define-key global-map "\C-c\M-c" 'osx-pbcopy)
(define-key global-map "\C-c\M-x" 'osx-pbcut)

(provide 'osx-clipboard)

;; end osx-clipboard.el
