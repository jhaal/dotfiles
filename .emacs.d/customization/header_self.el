;;; header.el --- header auto add for new files, load with init.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  user01

;; Author: user01 <user01@24Online>
;; Keywords: extensions, languages, internal

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

;;; Commentary:header auto add for new files, load with init.el

;;#####################################################################
;; Header configuration
;; https://www.emacswiki.org/emacs/AutoInsertMode
;;#####################################################################
;; c-mode autoinsert
(auto-insert-mode)
(setq auto-insert-query nil);; if you don't want to be prompted before insertion
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.c\\'" . "C skeleton")
     '(
       "Short description: "
       "/**\n * "
       (file-name-nondirectory (buffer-file-name))
       \n"*DESCRIPTION:" str \n
       "*REQUIREMENTS:"\n
       "*BUGS:"\n
       "*AUTHOR: Alok_Jha"\n
       "*E-mail: jhaalok1984_at_gmail.com"\n
       "*ORGANIZATION:NPCIL"\n
       "*VERSION:"\n
       "*REVISION:"\n
       "*CREATED:"(format-time-string "%A, %e %B %Y.")\n
       "*/" > \n \n
       "#include <stdio.h>" \n
       "int main()" \n
       "{" > \n
       > _ \n
       "}" > \n)))
;; c++ mode autoinsert
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '(
       "Short description: "
       "/**\n * "
       (file-name-nondirectory (buffer-file-name))
       \n"*DESCRIPTION:" str \n
       "*REQUIREMENTS:"\n
       "*BUGS:"\n
       "*AUTHOR: Alok_Jha"\n
       "*E-mail: jhaalok1984_at_gmail.com"\n
       "*ORGANIZATION:NPCIL"\n
       "*VERSION:"\n
       "*REVISION:"\n
       "*CREATED:"(format-time-string "%A, %e %B %Y.")\n
       "*/" > \n \n
       "#include <iostream>" \n
       "using namespace std;" \n \n
       "main()" \n
       "{" \n
       > _ \n
       "}" > \n)))
;; fortran mode auto-insert
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.\\(f90\\|f95\\|f03\\|for\\|f\\)\\'" . "fortran skeleton")
     '(
       "Short description: "
       "  !"(file-name-nondirectory (buffer-file-name))\n
       "!DESCRIPTION:" str \n
       "!REQUIREMENTS:"\n
       "!BUGS:"\n
       "!AUTHOR: Alok_Jha"\n
       "!E-mail: jhaalok1984_at_gmail.com"\n
       "!ORGANIZATION:NPCIL"\n
       "!VERSION:"\n
       "!REVISION:"\n
       "!CREATED:"(format-time-string "%A, %e %B %Y.")\n
        \n \n
	)))
;; python mode auto-insert
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.py\\'" . "python skeleton")
     '(
       "Short description: "
       "  #"(file-name-nondirectory (buffer-file-name))\n
       "#DESCRIPTION:" str \n
       "#REQUIREMENTS:"\n
       "#BUGS:"\n
       "#AUTHOR: Alok_Jha"\n
       "#E-mail: jhaalok1984_at_gmail.com"\n
       "#ORGANIZATION:NPCIL"\n
       "#VERSION:"\n
       "#REVISION:"\n
       "#CREATED:"(format-time-string "%A, %e %B %Y.")\n
       "#==================================="\n
       "#      !!ENVIRONMENT VARIABLES!!   "\n
       "#!/home/user01/anaconda3/bin/python3"\n
       "##!/usr/env/python3"\n
       "#==================================="\n
       \n \n
       )))
;; #####################################################################
;; template-based headings
;; #####################################################################
;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/templates/")
;; (setq auto-insert-query nil);; if you don't want to be prompted before insertion
;; (define-auto-insert "\.py" "templatepy.py")
;; (define-auto-insert "\.c" "templatec.py")
;; (define-auto-insert "\.cpp" "templatecpp.py")
;; (define-auto-insert "\.f90" "templatefort.py")
;;; Code:
(provide 'header)
;;; header.el ends here
