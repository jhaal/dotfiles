;;; myDef.el --- my defined functions for emacs      -*- lexical-binding: t; -*-

;; Copyright (C) 2019  user01

;; Author: user01 <user01@24Online>
;; Keywords: 

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

;;; Commentary:

;; 

;;; Code:
(defun other-window-backward (n)
  "SELECT n-th PREVIOUS WINDOW. "
  (interactive "p")
  (other-window (- n)))

(global-set-key (kbd "C-x-a") 'other-window)
(global-set-key (kbd "C-x-z") 'other-window-backward)


(provide 'myDef)
;;; myDef.el ends here
