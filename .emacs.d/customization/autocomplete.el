;;; autocomplete.el --- auto complete i.e., auto-insert file headers, and auto completion loading file for init.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  user01

;; Author: user01 <user01@24Online>
;; Keywords: extensions, languages

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
;;; Commentary:auto-insert file headers, and auto completion loading file for init.el
;;; Code:
;; ################################################################
;; start auto-complete with emacs
;; ################################################################
;; bash autocompletion
;; (require 'shell-command)(shell-command-completion-mode)
;; (use-package auto-complete
  ;; :ensure t
  ;; :init
  ;; (auto-complete t))
;; require yasnippet
;; (use-package yasnippet
  ;; :ensure t
  ;; :init
;; (yasnippet t))
;; (require 'auto-complete-auctex)
(require 'package)
(package-initialize)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete setup, sequence is important
(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
(require 'ac-math) ; package should be installed first 
(defun my-ac-latex-mode () ; add ac-sources for latex
   (setq ac-sources
         (append '(ac-source-math-unicode
           ac-source-math-latex
           ac-source-latex-commands)
                 ac-sources)))
(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
(setq ac-math-unicode-in-math-p t)
(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-start t)            ; if t starts ac at startup automatically
(setq ac-auto-show-menu t)
(global-auto-complete-mode t)


;; auto complete initialization for auto-complete-c-headers and c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/opt/intel/compilers_and_libraries_2018.3.222/linux/ipp/include")
  (add-to-list 'achead:include-directories '"/opt/intel/compilers_and_libraries_2018.3.222/linux/mkl/include")
  (add-to-list 'achead:include-directories '"/opt/intel/compilers_and_libraries_2018.3.222/linux/pstl/include")
  (add-to-list 'achead:include-directories '"/opt/intel/compilers_and_libraries_2018.3.222/linux/tbb/include")
  (add-to-list 'achead:include-directories '"/opt/intel/compilers_and_libraries_2018.3.222/linux/daal/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed")
  )
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
;; add time-stamp to saved file
(add-hook 'before-save-hook 'time-stamp)
;;##########################################################
;;Python language support
;;##########################################################
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
;;##########################################################
;;Fortran language support
;;##########################################################
(add-hook 'f90-mode-hook 'fortpy-setup)
(setq fortpy-complete-on-percent t)
(setq fortpy-complete-on-bracket t)
;;#########################################################
;; HTML etc. language support
;;#########################################################
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; ########################################################
;;C and C++ language support
;;#########################################################
;; (use-package company
	     ;; :ensure t
	     ;; :config
	     ;; (setq company-idle-delay 0)
	     ;; (setq company-minimum-prefix-length 3))

;; (with-eval-after-load 'company
 ;; (define-key company-active-map (kbd "M-n") nil)
 ;; (define-key company-active-map (kbd "M-p") nil)
 ;; (define-key company-active-map (kbd "C-n") #'company-select-next)
 ;; (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (use-package company-irony
	     ;; :ensure t
	     ;; :config
	     ;; (require 'company)
	     ;; (add-to-list 'company-backends 'company-irony))

;; (use-package irony
	     ;; :ensure t
	     ;; :config
	     ;; (add-hook 'c++-mode-hook 'irony-mode)
	     ;; (add-hook 'c-mode-hook 'irony-mode)
	     ;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; (with-eval-after-load 'company
 ;; (add-hook 'c++-mode-hook 'company-mode)
 ;; (add-hook 'c-mode-hook 'company-mode))
;; ******************************
(provide 'autocomplete)
;;; autocomplete.el ends here
