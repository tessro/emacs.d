(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")

;; Enable evil by default
(require 'evil)
(evil-mode 1)

(load "~/.emacs.d/modes.el")

;; Whitespace
(setq whitespace-action '(auto-cleanup))
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab tabs))
(global-whitespace-mode)

;; OS X
(when (eq system-type "darwin")
  (set-face-attribute 'default nil :font "Menlo 12"))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 110))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) 80)
                             (frame-char-height)))))))

(add-hook 'after-make-frame-functions
          'set-frame-size-according-to-resolution)
(add-hook 'after-init-hook
          'set-frame-size-according-to-resolution)

(color-theme-solarized 'dark)
