;;; 520-mode.el --- Emacs说:"我爱你多一点" -*- lexical-binding: t; -*-

;; Copyright (C) 2004-2016 Free Software Foundation, Inc.

;; Author: DarkSun <lujun9972@gmail.com>
;; Created: 2016-05-20
;; Version: 0.1
;; Keywords: convenience, menu
;; Package-Requires: ((emacs "24.4"))
;; URL: https://github.com/lujun9972/520-mode

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Source code
;;
;; 520-mode's code can be found here:
;;   http://github.com/lujun9972/520-mode

;;; Commentary:
;; Emacs说: “我爱你多一点”

;; 因此

;; 每次输入520,都会随机变成5.20或52.0 

;; Quick start:

;; execute =M-x 520-mode=

;;; Code:

(defun 520-mode--insert-a-point ()
  (insert ".")
  (let ((overlay (make-overlay (- (point) 1)
                               (point))))
    (overlay-put overlay 'display "❤")
    (run-at-time 0.5 nil (lambda ()
                         (delete-overlay overlay)))))

(defun 520-mode-dyd ()
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
      (add-hook 'post-self-insert-hook #'520-mode-dyd)
    (remove-hook 'post-self-insert-hook #'520-mode-dyd)))

;;; 520-mode.el ends here
