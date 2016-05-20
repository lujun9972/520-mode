;; -*- lexical-binding: t; -*-

(defun 520-mode--insert-a-point ()
  (insert ".")
  (let ((overlay (make-overlay (- (point) 1)
                               (point))))
    (overlay-put overlay 'display "❤")
    (run-at-time 0.5 nil (lambda ()
                         (delete-overlay overlay)))))

(defun 520dyd ()
  (interactive)
  (save-excursion
    (when (and (> (point) 3)
               (string= "520" (buffer-substring-no-properties (- (point) 3)
                                                              (point))))
      (backward-char (+ 1 (random 2)))
      (520-mode--insert-a-point))))

(define-minor-mode 520-mode "我爱你多一点"
  ;; The initial value
  nil
  ;; The indicator for the mode line
  " ❤"
  :group '520-mode
  :global t
  (if (and (boundp '520-mode)
           520-mode)
      (add-hook 'post-self-insert-hook #'520dyd)
    (remove-hook 'post-self-insert-hook #'520dyd)))
