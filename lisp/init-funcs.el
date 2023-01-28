;;;自定义函数
(defun open-init-file();打开配置文件
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-below-window()
    (interactive)
    (split-window-below 25)
    )

(defun run-program()
  (interactive)
  (save-buffer)
  (setq filename (buffer-file-name)
	file-type (file-name-extension filename)
	file-notype (file-name-sans-extension filename))
  (if (or (string= file-type "c") (string= file-type "cpp"))
      (progn
	(if (string= file-type "c")
	    (setq exe "gcc ")
	  (setq exe "g++ "))
	(setq cmd (concat exe
			  filename
			  " -o "
			  file-notype))
	(message (concat "compile " cmd))
	(compile cmd)
	(message (concat "编译成功！\n即将运行：" file-notype)))
    (progn
      (if (string= file-type "py")
	(python-shell-send-buffer)))))



(provide 'init-funcs)
