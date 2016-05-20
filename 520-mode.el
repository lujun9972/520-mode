(defun 520dyd ()
  (interactive)
  (save-excursion
    (when (and (> (point) 3)
               (string= "520" (buffer-substring-no-properties (- (point) 3)
                                                              (point))))
      (backward-char (+ 1 (random 2)))
      (insert "."))))

(define-minor-mode 520-mode "我爱你多一点"
  ;; The initial value
  nil
  ;; The indicator for the mode line
  " 520"
  :group '520-mode
  :global t
  (if (and (boundp '520-mode)
           520-mode)
      (add-hook 'post-self-insert-hook #'520dyd)
    (remove-hook 'post-self-insert-hook #'520dyd)))
