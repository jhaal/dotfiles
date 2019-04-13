;;; keybindings.el --- emacs custom keybindings for my purpose  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  user01

;; Author: user01 <user01@24Online>
;; Keywords: tools, convenience

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
;; string-replace & emacs-init-time
;;############################################################################
(global-set-key (kbd "C-h")  'replace-string)
(global-set-key (kbd "M-h")  'replace-regexp)
(global-set-key (kbd "C-a")  'emacs-init-time)
(global-set-key (kbd "M-?")  'help-command)
(global-set-key (kbd "s-b") 'compile)
(global-set-key (kbd "C-/") 'comment-line)

(provide 'keybindings)
;;; keybindings.el ends here
