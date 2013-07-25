(live-add-pack-lib "nrepl")
(live-add-pack-lib "ac-nrepl")

(require 'nrepl)
(require 'ac-nrepl)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(eval-after-load "nrepl"
  '(progn
     (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
     (custom-set-variables '(nrepl-history-file (concat live-etc-dir "nrepl-history.eld")))))

;;; some personal settings. customize at will
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)