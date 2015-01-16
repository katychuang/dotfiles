;; Show seconds
(setq system-time-locale "C")
(setq org-time-stamp-formats
      '("<%Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M:%S>"))

;; Change this setting in your org-journal.el file
(defcustom org-journal-time-format "%T "
  "Format string for time, by default HH:MM. Set it to a blank
string if you want to disable timestamps. %T for 24-hr notation (%H:%M:%S)"
  :type 'string :group 'org-journal)
