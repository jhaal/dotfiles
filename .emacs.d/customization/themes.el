;;; themes.el --- theme settings for my emacs configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  user01

;; Author: user01 <user01@24Online>
;; Keywords: extensions

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

;;; Commentary: this configuration is for the purpose of loading themes in EMACS init files

;;; Code:
(provide 'themes)
(load-theme 'solarized-dark t)
;;####################################################################
;; powerline -theme
;;####################################################################
(use-package powerline
  :ensure t
  :init
  (setq powerline t))
(require 'powerline)
;; (powerline-default-theme)
;; airline theme, a variant of powerline theme
(use-package airline-themes
  :ensure t
  :init
  (setq airline-themes t))
;; (require 'airline-themes)
(load-theme 'airline-dark t)
(setq airline-display-directory-full t)

;; Doom theme application starts here
;; (use-package doom-themes
  ;; :ensure t
  ;; :init
  ;; (doom-themes t))
;; (require 'doom-themes)
;; (setq doom-themes-enable-bold t
     ;; doom-themes-enable-italic t)
;; (setq doom-font (font-spec :family "Fira Mono":size 14))
;; (load-theme 'doom-molokai t)

;;; themes.el ends here
