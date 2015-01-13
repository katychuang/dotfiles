;; Use variable width font face in current buffer
(defun my-buffer-face-variable ()
"Activate with M-x my-buffer-face-variable RET"
(interactive)
(setq buffer-face-mode-face '(:family "Avenir" :height 100 :width semi-condensed))
(buffer-face-mode))