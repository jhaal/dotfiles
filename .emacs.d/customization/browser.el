;;; browser.el --- browser choice set                -*- lexical-binding: t; -*-

;; Copyright (C) 2018  user01

;; Author: user01 <user01@24Online>
;; Keywords:

(use-package engine-mode
  :ensure t
  :init
  (engine-mode t))
;; (require 'engine-mode)
;; (engine-mode t)
(engine/set-keymap-prefix (kbd "C-s-s"))

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine stack-exchange
  "https://stackexchange.com/search?q=%s"
  :keybinding "s")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

;; (defengine stack-overflow
  ;; "https://stackoverflow.com/search?q=%s"
  ;; :keybinding "s")

;; (defengine github
  ;; "https://github.com/search?ref=simplesearch&q=%s"
  ;; :keybinding "G")

;; (defengine twitter
  ;; "https://twitter.com/search?q=%s"
  ;; :keybinding "t")

;; (defengine wikipedia
  ;; "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  ;; :keybinding "w"
  ;; :docstring "Searchin' the wikis.")

;; (defengine slashdot
  ;; "https://slashdot.org/index2.pl?fhfilter=%s"
  ;; :keybinding "S")

;; (defengine amazon
  ;; "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

;; (defengine google-images
  ;; "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

;; (defengine google-maps
  ;; "http://maps.google.com/maps?q=%s"
  ;; :docstring "Mappin' it up.")

;; (defengine project-gutenberg
  ;; "http://www.gutenberg.org/ebooks/search/?query=%s")

;; (defengine wiktionary
  ;; "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

;; (defengine wolfram-alpha
  ;; "http://www.wolframalpha.com/input/?i=%s")


;; ################################################################
;; Set to open url in chrome browser
;; ################################################################
;; (use-package google-this
  ;; :ensure t
  ;; :config
  ;; (global-set-key (kbd "C-s-g") 'google-this-mode-submap))
;; (require 'engine-mode)
;; (engine-mode t)
;; (engine/set-keymap-prefix (kbd "C-s s"))
