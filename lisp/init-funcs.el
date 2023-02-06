;;; package --- summary
;;; commentary:
;;; code:
;;; *************************************************
;;;	> Filename        :	init-funcs.el
;;;	> Description     :	emacs的自定义变量和函数
;;;	> Creat time      :	2023-02-04 19:24
;;;	> Last modified   :	2023-02-06 13:56
;;;	> Author          :	Daiwu Shen
;;;	> Email           :	shendaiwu@163.com
;;; *************************************************

;;; ----------------------------------------自定义全局变量--------------------------------
(defvar User-Name "Daiwu Shen")
(defvar User-Email "shendaiwu@163.com")

;;; ----------------------------------------自定义函数------------------------------------
(defun open-init-file()
  "打开配置文件."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun insert-header()
  "插入文件头."
  (interactive)
  (if (or (string= (file-name-nondirectory (buffer-file-name)) "yml") (string= (file-name-extension (buffer-file-name)) "py"))
      (insert (format "#*************************************************
#\t> Filename        :\t%s
#\t> Description     :\t
#\t> Creat time      :\t%s
#\t> Last modified   :\t%s
#\t> Author          :\t%s
#\t> Email           :\t%s
#*************************************************\n"
					  (file-name-nondirectory (buffer-file-name))
					  (format-time-string "%Y-%m-%d %H:%M")
					  (format-time-string "%Y-%m-%d %H:%M")
					  User-Name
					  User-Email)))
  (if (or (or (or (or (string= (file-name-extension (buffer-file-name)) "c") (string= (file-name-extension (buffer-file-name)) "cpp")) (string= (file-name-extension (buffer-file-name)) "h")) (string= (file-name-extension (buffer-file-name)) "css")) (string= (file-name-extension (buffer-file-name)) "js"))
      (insert (format "/**************************************************
\t> Filename        :\t%s
\t> Description     :\t
\t> Creat time      :\t%s
\t> Last modified   :\t%s
\t> Author          :\t%s
\t> Email           :\t%s
**************************************************/\n"
					  (file-name-nondirectory (buffer-file-name))
					  (format-time-string "%Y-%m-%d %H:%M")
					  (format-time-string "%Y-%m-%d %H:%M")
					  User-Name
					  User-Email)))
  (if (or (string= (file-name-extension (buffer-file-name)) "el") (string= (file-name-extension (buffer-file-name)) "asm"))
      (insert (format ";;; package --- summary
;;; commentary:
;;; code:
;;; *************************************************
;;;\t> Filename        :\t%s
;;;\t> Description     :\t
;;;\t> Creat time      :\t%s
;;;\t> Last modified   :\t%s
;;;\t> Author          :\t%s
;;;\t> Email           :\t%s
;;; *************************************************\n\n\n\n
;;; %s ends here"
					  (file-name-nondirectory (buffer-file-name))
					  (format-time-string "%Y-%m-%d %H:%M")
					  (format-time-string "%Y-%m-%d %H:%M")
					  User-Name
					  User-Email
					  (file-name-nondirectory (buffer-file-name)))))
  (if (or (string= (file-name-nondirectory (buffer-file-name)) "xml") (string= (file-name-extension (buffer-file-name)) "html"))
      (insert (format"<!DOCTYPE html>
<html lang=\"en\">
<!------------------------------------------------------
#\t> Filename        :\t%s
#\t> Description     :\t
#\t> Creat time      :\t%s
#\t> Last modified   :\t%s
#\t> Author          :\t%s
#\t> Email           :\t%s
------------------------------------------------------->\n
<head>
\t<meta charset=\"UTF-8\">
\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
\t<link rel=\"stylesheet\" href=\"static/css/style.css\" type=\"text/css\">
\t<title>HTML DOCUMENT TILE</title>
</head>
<body>\n\n\n</body>
</html>"
					 (file-name-nondirectory (buffer-file-name))
					 (format-time-string "%Y-%m-%d %H:%M")
					 (format-time-string "%Y-%m-%d %H:%M")
					 User-Name
					 User-Email))))

(defun update-last-modified ()
  "更新修改时间."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward
           (regexp-quote "\t> Last modified   :\t")
           nil 'no-error)
      (delete-region (point) (line-end-position))
      (insert (format-time-string "%Y-%m-%d %H:%M")))))

(provide 'init-funcs)
;;; init-funcs.el ends here
