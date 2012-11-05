(add-to-list 'load-path "~/.emacs.d/modes")

(require 'pig-mode)

(add-to-list 'load-path "~/.emacs.d/modes/scala-mode")
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;; Note to self: not using electric mode because it SUCKS!
;; scala-mode-feature-electric-mode doesn't have typeover!

(add-to-list 'load-path "~/.emacs.d/modes/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'autopair)
(autopair-global-mode)
