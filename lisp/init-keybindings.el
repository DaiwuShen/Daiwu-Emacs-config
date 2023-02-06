;;; package --- summary
;;; commentary:
;;; Code:
;;; *************************************************
;;;	> Filename        :	init-keybindings.el
;;;	> Description     :	emacs全局按键绑定
;;;	> Creat time      :	2023-02-05 15:42
;;;	> Last modified   :	2023-02-06 14:17
;;;	> Author          :	Daiwu Shen
;;;	> Email           :	shendaiwu@163.com
;;; *************************************************
;;; require
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-funcs)

;;常用命令全局快捷键设置
(global-set-key (kbd "C-h C-f") 'find-function);查找 函数 帮助
(global-set-key (kbd "C-h C-v") 'find-variable);
(global-set-key (kbd "C-h C-k") 'find-function-on-key);
(global-set-key (kbd "C-=") 'open-init-file);打开配置文件
(global-set-key (kbd "C-`") 'eshell);打开终端
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-c C-/") 'comment-line);快速注释
(global-set-key (kbd "C-c <DEL>") 'kill-whole-line)

;; hook
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'before-save-hook 'update-last-modified)


(provide 'init-keybindings)
;;; init-keybindings.el ends here
