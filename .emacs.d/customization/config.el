
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(global-whitespace-mode t)

(setq initial-scratch-message "")
;;(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-hook 'do-auto-fill)

(defun kill-curr-buffer ()
(interactive)
(kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(defun kill-all-buffers()
(interactive)
(mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-SPC") 'kill-all-buffers)

(defun kill-whole-word ()
 (interactive)
 (backward-word)
 (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)
;; subword-mode
(global-subword-mode 1)

(setq ad-redefinition-action 'accept)

(delete-selection-mode 1)

(when window-system (global-hl-line-mode t))
;;(when window-system (global-prettify-symbols-mode t))

(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq inhibit-splash-screen t)
(setq make-backup-files nil)

(global-linum-mode t)

(display-time-mode 1)

(setq electric-pair-pairs '(
                            (?\( . ?\))
                            (?\{ . ?\})
                            (?\[ . ?\])
                            (?\" . ?\")
                           ))
(electric-pair-mode t)

(global-visual-line-mode 1)
(blink-cursor-mode 0)
