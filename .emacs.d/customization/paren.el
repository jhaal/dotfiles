;;; paren.el --- parenthesis settings                -*- lexical-binding: t; -*-

;; Copyright (C) 2019  user01

;; Author: user01 <user01@24Online>
;; Keywords: internal

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
(setq show-paren-mode t)
(setq
show-paren-ring-bell-on-mismatch t
show-paren-when-point-in-periphery t
show-paren-when-point-inside-paren t)
(setq show-paren-delay 0)
(show-paren-mode 1)
(provide 'paren)
;;; paren.el ends here
