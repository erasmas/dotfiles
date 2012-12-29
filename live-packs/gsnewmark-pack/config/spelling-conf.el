(add-hook 'clojure-mode-hook
          (lambda ()
            (flyspell-prog-mode)))

(add-hook 'actionscript-mode-hook
          (lambda ()
            (flyspell-prog-mode)))

(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (ac-flyspell-workaround)))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

;; flyspell key bindings
;; dictionary switching
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "ukrainian") "english" "ukrainian")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))
(global-set-key (kbd "<f6>") 'fd-switch-dictionary)
;; correction keyboard shortcuts
(global-set-key (kbd "C-<f6>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f6>") 'flyspell-check-next-highlighted-word)
