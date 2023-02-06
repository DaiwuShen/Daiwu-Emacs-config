;;; package --- Summary
;;; Commentary:
;;; Code:
;;; *************************************************
;;;	> Filename        :	init-basic.el
;;;	> Description     :	emacs基础配置
;;;	> Creat time      :	2023-02-05 10:40
;;;	> Last modified   :	2023-02-06 13:12
;;;	> Author          :	Daiwu Shen
;;;	> Email           :	shendaiwu@163.com
;;; *************************************************
;;;------------------------------------------基础配置--------------------------------------
(setq tab-always-indent 'complete      ;设置tab键作补全
      inhibit-startup-message t        ;关闭启动 Emacs 时的欢迎界面
      mouse-wheel-progressive-speed nil;设置鼠标滚动速度
      make-backup-files nil            ;关闭自动备份
      prefix-help-command 'embark-prefix-help-command;增强搜索和跳转
      create-lockfiles nil
      package-archives '(("gnu-cn"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa-cn"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu-devel-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu-devel/")
			 ("nongnu-devel-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu-devel/")
			 ("stable-melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
			 ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"));换源
      use-package-always-ensure t
      use-package-always-defer t)
(setq-default cursor-type '(bar . 2)
	      tab-width 4);设置鼠标样式
(fset 'yes-or-no-p 'y-or-n-p);把yes、no的选项换成简写
(toggle-scroll-bar -1) ; 图形界面时关闭滚动条

;;;-----------------------------------------window布局----------------------------------------
(defvar parameters '(window-parameters . ((no-other-window . t) (no-delete-other-windows . t))))
(setq fit-window-to-buffer-horizontally t
      window-resize-pixelwise t
      window-sides-vertical t
      display-buffer-alist '(
			     ("\\*\\(?:shell\\|eshell\\|python\\|compilation\\|Buffer List\\)\\*"
			      display-buffer-in-side-window
			      (side . bottom)
			      (slot . 0)
			      (window-height . 12)
			      (window-preserve-size . (nil . t))
			      parameters)
			     ("\\*\\(?:Tags List\\|Help\\|Metahelp\\|Completions\\|lsp-performancs\\|Abbrew\\)\\*"
			      display-buffer-in-side-window
			      (side . right)
			      (slot . 0)
			      (window-width . fit-window-to-buffer)
			      (window-preserve-size . (t . nil))
			      parameters
			      )))

(provide 'init-basic)
;;; init-basic.el ends here
