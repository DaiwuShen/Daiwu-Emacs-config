;;; require
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-funcs)

;;常用命令全局快捷键设置
(global-set-key (kbd "C-h C-f") 'find-function);查找 函数 帮助
(global-set-key (kbd "C-h C-v") 'find-variable);
(global-set-key (kbd "C-h C-k") 'find-function-on-key);
(global-set-key (kbd "C-<f2>") 'open-init-file);打开配置文件
(global-set-key (kbd "C-c g s") 'consult-ripgrep);跨文件查找
(global-set-key (kbd "C-`") 'eshell);打开终端
(global-set-key (kbd "C-c 2") '(lambda()
				   (interactive)
				   (split-window-below -15)));分割窗口
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x ;") 'embark--act);自适应context menu
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-c C-/") 'comment-line);快速注释
(global-set-key (kbd "C-<f5>") 'run-program)
(global-set-key (kbd "C-c DEL") 'kill-whole-line)

;; 模式快捷键
(add-hook 'prog-mode-hook #'hs-minor-mode)



(provide 'init-keybindings)
