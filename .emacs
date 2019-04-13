;;############################################################################
(org-babel-load-file(expand-file-name "~/.emacs.d/customization/config.org"))
;;############################################################################;
;;FileTree in Emacs;
;############################################################################
(add-to-list 'load-path "/home/user01/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
;;############################################################################
(cua-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;;############################################################################
;; Toggle comment lines
;; change all prompts of yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)
;;############################################################################
;;abbrev-mode(making word abbreviaitons at startup)
;;############################################################################
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/customization/.abbrev_defs")
(setq save-abbrevs t)
;;############################################################################
;;Load and add MELPA, ELPA, ORG-MODE
;;############################################################################
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/"))))
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )

(package-initialize)
;; ################################################################
;; Package utility for use-package,which-key,beacon,dashboard etc.
;; It has the added advantage to check and install if package not
;; installed earlier
;; ################################################################
(unless package-archive-contents
  (package-refresh-contents))
(setq package-load-list '(all))
(unless (package-installed-p 'org)
  (package-install 'org))
;; Org-mode autocomplete
(require 'org-ac)
(org-ac/config-default)
(add-to-list 'ac-modes 'org-mode)
;; org-mode-bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(setq org-pretty-entities t)
;; (global-set-key [f8] (lambda () (interactive) (org-latex-export-to-pdf t)))
;; ####################################################################
;; use-package utility
;; ####################################################################
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; which-key utility package
(use-package which-key
  :ensure t
  :init
  (which-key-mode))
;; beacon utility package
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))
;; (setq beacon-color "#000080")
(setq beacon-blink-delay '1.5)
(setq beacon-push-mark '1.5)
;; ################################################################
;; pop-up-kill-ring
;; ################################################################
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))
(use-package swiper
  :ensure t
  :bind ("C-r" . swiper))
;; ################################################################
;; clang formatting for c and c++ codes
;; ################################################################
(require 'clang-format)
(load-file "/home/user01/.emacs.d/customization/clang.el")
;;############################################################################
;; turn on visible-bell
;;############################################################################
(setq visible-bell 1)
;; ################################################################
;;(require 'keybindings.el)			
(load-file "/home/user01/.emacs.d/customization/keybindings.el")
;;############################################################################
;; turn on parenthesis highlighting
;;############################################################################
(require 'paren)
(load-file "/home/user01/.emacs.d/customization/paren.el")
;;############################################################################
;; cause new tabs to open in new frame/window
;;############################################################################
;; (setq pop-up-frames t)
;; ################################################################
;; search from emacs interactively in browser
;; ################################################################
(require 'engine-mode)
;;(require 'browser.el)
(load-file "/home/user01/.emacs.d/customization/browser.el")
;; ################################################################
;; themes file load setting
;; ################################################################
(load-file "/home/user01/.emacs.d/customization/themes.el")
;; ################################################################
;; autocomplete settings file load
;; ################################################################
(load-file "/home/user01/.emacs.d/customization/autocomplete.el")
;; ################################################################
;; header for new file load
;; ################################################################
(load-file "/home/user01/.emacs.d/customization/header.el")
;; (require 'header2)
;; (autoload 'auto-make-header "header2")
;; (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;; (add-hook 'c-mode-common-hook   'auto-make-header)
;; (load-file "/home/user01/.emacs.d/customization/header2.el")
;;###################################################################
;; LATEX/AUCTEX settings for emacs
;;###################################################################
(load-file "/home/user01/.emacs.d/customization/latexmode.el")
;;###################################################################
;; desktop-save-mode yes/no & cursor save mode
;; Automatically save and restore sessions
;;###################################################################
(load-file "/home/user01/.emacs.d/customization/desktop.el")
;;###################################################################
;; minimap mode settings file
;;###################################################################
(load-file "/home/user01/.emacs.d/customization/minimap.el")
;; ;; ################################################################
;; multiple cursor
;; ################################################################
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(require 'multiple-cursors)
;; for active region spanning multiple lines
(global-set-key (kbd "C-s-M C-s-M") 'mc/edit-lines)
;;When you want to add multiple cursors not based on continuous lines
;; but based on keywords in the buffer, use
(global-set-key (kbd "C-s-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-s-<mouse-1>") 'mc/add-cursor-on-click)
;; ################################################################
;; frames as tabbar
;; ################################################################
(when (require 'tabbar nil t)
  (tabbar-mode 1))
;;####################################################################
;; shell command redifinition
;; #####################################################################
(setq explicit-shell-file-name "/bin/bash")
(global-set-key (kbd "<f5>") 'ansi-term)
(global-set-key (kbd "<f6>") 'shell)
;; set ibuffer
;; (setq ibuffer-expert t)
;; (global-set-key (kbd "<f7>") 'ibuffer-list-buffers)
;; (global-set-key (kbd "<f8>") 'shell-command)
;;##########################################################
;; smooth scrolling
;;##########################################################
;; (setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; two lines at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq next-line-add-newlines nil)
;;###################################################################
;;Default settings/ Factory settings
;;###################################################################
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1")
 '(TeX-source-correlate-mode t)
 '(TeX-view-program-list (quote (("Okular" ("okular –unique %o#src:%n%b") ""))))
 '(TeX-view-program-selection
   (quote
    ((output-pdf "Atril")
     ((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open"))))
 '(font-use-system-font nil)
 '(package-selected-packages
   (quote
    (parent-mode clang-format fontawesome ac-php-core minimap flyspell-popup google-this ox-reveal org-ac nyan-mode smart-mode-line-powerline-theme popup-kill-ring org-bullets ac-math auctex auctex-latexmk auto-complete-auctex fill-column-indicator sublime-themes smooth-scrolling auto-complete-c-headers ac-c-headers ac-clang neotree org-download airline-themes fortpy jedi clues-theme f90-interface-browser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 129 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(minimap-active-region-background ((t (:background "light gray" :slant italic :weight normal)))))
(put 'dired-find-alternate-file 'disabled nil)
