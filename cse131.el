 ;;; cse131.el --- CSE 131 major mode

;; Copyright (C) 2016  Matthew Chan

;; Author: Matthew Chan
;; Keywords: extensions

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

 ;;; Commentary:

;;

 ;;; Code:


;; (defvar cse131-mode-map
;;   (let ((lambda-char (make-char 'greek-iso8859-7 107)))

;;     map)
;;   "Keymap for `cse131-mode'.")

(defvar cse131-constants
  '( "true"     "false"
     "add1"     "sub1"     "isNum"    "isBool"   "print"
     ))

(defvar cse131-keywords
  '( "if"       "else"
     "let"      "in"
     "def"      "lambda"   "λ"
     ))

(defvar cse131-font-lock-defaults
  `((
     ;; stuff between double quotes
     ("\"\\.\\*\\?" . font-lock-string-face)

     ( ,(string-join '(":" "," "(" ")" ) "\\|")
       . font-lock-builtin-face)

     ( ,(string-join '("=" "+" "-" "*")  "\\|")
       . font-lock-warning-face)

     ( ,(regexp-opt cse131-keywords 'words)
       . font-lock-keyword-face)

     ( ,(regexp-opt cse131-constants 'words)
       . font-lock-constant-face)

     ( ,(rx symbol-start "def" (1+ space) (group (1+ (or word ?_))))
       . font-lock-function-name-face)

     )))

(defvar cse131-tab-width 2)
(defvar cse131-indent-tab nil)
(defvar cse131-lambda-char (make-char 'greek-iso8859-7 107))

 ;;;###autoload
(define-derived-mode cse131-mode fundamental-mode "CSE 131"
  "A major mode for editing CSE131 source files.
\\{cse131-mode-map}"

  ;; :syntax-table cse131-mode-syntax-table

  (setq-local comment-start "\/\/")
  (setq-local comment-start-skip "\/\/+\\s-*")

  (setq-local tab-width             cse131-tab-width)
  (setq-local indent-tabs-mode      cse131-indent-tab)
  (setq-local font-lock-defaults    cse131-font-lock-defaults)
  ;;  (setq-local indent-line-function 'cse131-indent-line)

  ;;(setq-local imenu-generic-expression  sample-imenu-generic-expression)
  ;;(setq-local outline-regexp sample-outline-regexp)
  (define-key cse131-mode-map (kbd "C-M-y")
    '(lambda ()
       (interactive)
       (insert-char cse131-lambda-char 1)))

  )


 ;;; Indentation

;; (defun cse131-indent-line ()
;;   "Indent current line of Sample code."
;;   (interactive)
;;   (let ((savep (> (current-column) (current-indentation)))
;;         (indent (condition-case nil (max (sample-calculate-indentation) 0)
;;                   (error 0))))
;;     (if savep
;;         (save-excursion (indent-line-to indent))
;;       (indent-line-to indent))))

;; (defun cse131-calculate-indentation ()
;;   "Return the column to which the current line should be indented."
;;   0)

(provide 'cse131)
 ;;; sample.el ends here
