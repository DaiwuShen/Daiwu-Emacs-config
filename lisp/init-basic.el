;;;基础配置
(setq initial-frame-alist '((width . 100))
 tab-always-indent 'complete;设置tab键作补全
      inhibit-startup-message t             ; 关闭启动 Emacs 时的欢迎界面
      mouse-wheel-progressive-speed nil;设置鼠标滚动速度
      make-backup-files nil;关闭自动备份
      completion-styles '(orderless);无序搜索
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
(setq-default cursor-type '(bar . 2));设置鼠标样式
(fset 'yes-or-no-p 'y-or-n-p);把yes、no的选项换成简写
(toggle-scroll-bar -1) ; 图形界面时关闭滚动条



(provide 'init-basic)
