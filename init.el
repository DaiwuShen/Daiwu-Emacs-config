;;; package --- Summary
;;; Commentary:
;;; Code:
;;; *************************************************
;;;	> Filename        :	init.el
;;;	> Description     :	emacs根配置文件
;;;	> Creat time      :	2023-02-05 15:46
;;;	> Last modified   :	2023-02-05 15:47
;;;	> Author          :	Daiwu Shen
;;;	> Email           :	shendaiwu@163.com
;;; *************************************************
;;;---------------------------------------启动-----------------------------------------
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; custom-file
(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)
(if init-file-debug
    (setq use-package-verbose t
          use-package-expand-minimally nil
          use-package-compute-statistics t
          debug-on-error t)
  (setq use-package-verbose nil
        use-package-expand-minimally t))

;;;----------------------------------------require-------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'init-basic);基础设置
(require 'init-packages);use-package配置
(require 'init-keybindings);快捷键绑定
;(require 'init-themes);ui与主题


(provide 'init)
;;; init.el ends here
(put 'narrow-to-region 'disabled nil)
