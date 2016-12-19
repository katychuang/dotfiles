
(defvar insight-blog-location "~/PATH/TO/BLOG/"
  "Return the location of my blog files.")

;; Takes 3 string inputs and autofills them to a new post.
(defun datablog-new-post (title tags bg)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive "sTitle: \nsTags: \nsheaderImg: header/")
  (hakyll-do-write
   (format "%s/%s-%s.md"
           insight-blog-location
           (format-time-string "%Y-%m-%d")
           (replace-regexp-in-string " " "-" (downcase title)))
   (format "---\ntitle: %s\ntags: %s\nheaderImg: header/%s\n---\n\n"
           title
           tags
           bg)))

(defun hakyll-do-write (file-name str)
  (find-file file-name)
  (insert str)
  (save-buffer))

(defvar 5min-blog-location "~/PATH/TO/BLOG/"
  "Return the location of my blog files.")
(defun 5min-new-post (title tags bg)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive "sTitle: \nsTags:  \nsCategory: ")
  (jekyll-do-write
   (format "%s/%s-%s.md"
           5min-blog-location
           (format-time-string "%Y-%m-%d")
           (replace-regexp-in-string " " "-" (downcase title)))
   (format "---\ntitle: %s\ntags: %s\ncategory: %s\n---\n\n"
           title
           tags
           bg)))

(defun jekyll-do-write (file-name str)
  (find-file file-name)
  (insert str)
  (save-buffer))
