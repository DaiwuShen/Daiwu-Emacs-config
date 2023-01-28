;;;; 内置包
;;; 功能优化
(use-package electric-pair-mode
  :ensure nil
  :hook(after-init . electric-pair-mode))

(use-package show-paren-mode
  :ensure nil
  :hook(after-init . show-paren-mode))

(use-package column-number-mode
  :ensure nil
  :hook(after-init . column-number-mode))

(use-package global-auto-revert-mode
  :ensure nil
  :hook(after-init . global-auto-revert-mode))

(use-package delete-selection-mode
  :ensure nil
  :hook(after-init . delete-selection-mode))

(use-package global-display-line-numbers-mode
  :ensure nil
  :hook(after-init . global-display-line-numbers-mode))

(use-package global-hl-line-mode
  :ensure nil
  :hook (after-init . global-hl-line-mode)
)
  
(use-package tool-bar-mode
  :ensure nil
  :init
  (tool-bar-mode 0))

(use-package size-indication-mode
  :ensure nil
  :hook(after-init . size-indication-mode))

(use-package display-battery-mode
  :ensure nil
  :hook(after-init . display-battery-mode))

(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode)
  :bind (("C-c <left>" . winner-undo)
	 ("C-c <right>" . winner-redo)))

;; 保存历史记录
(use-package savehist-mode
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300))

;; 保存光标位置
(use-package save-place-mode
  :ensure nil
  :hook(after-init . save-place-mode))

;; 最近打开的列表
(use-package recentf-mode
  :ensure nil
  :config
  (setq recentf-max-menu-items 5)
  :hook (after-init . recentf-mode))

;;;; 用户包
;;; 功能优化
;; vertico
(use-package vertico
  :hook(after-init . vertico-mode))

;; marginalia
(use-package marginalia
  :init(marginalia-mode t))

;; which-key-mode
(use-package which-key
  :hook(after-init . which-key-mode)
  :config (setq which-key-idle-delay 0))

;; 文件树
(use-package treemacs
  :config
  (setq treemacs-indentation-string " "
	treemacs-show-hidden-files t)
  :bind
  (:map global-map
	("C-1" . treemacs-select-window)
	("C-c t t" . treemacs)
	("C-c t d" . treemacs-select-directory)
	)
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)
	)
)

;; projectile
(use-package projectile
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile"
	projectile-track-known-projects-automatically nil
	projectile-enable-caching t)
  :hook (after-init . projectile-mode)
  )

;;
(use-package treemacs-projectile
  :after (treemacs projectile))

;; git
(use-package magit)

(use-package git-gutter+
  :config
  (progn
    (global-git-gutter+-mode)))

;;; 美化相关
;; dashboard
(use-package dashboard
  :defer nil
  :config
  (setq dashboard-banner-logo-title "Welcom to Emacs!");个性签名
  (setq dashboard-projects-backend 'projectile); 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official);自定义图片
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)))
  (dashboard-setup-startup-hook)
  )

;;; 补全相关
;; company
(use-package company
  :hook(prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1 ; 只需敲 1 个字母就开始进行自动补全
	company-tooltip-align-annotations t
	company-idle-delay 0.0;弹出列表延迟
	company-show-numbers t ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
	company-selection-wrap-around t;列表循环
	company-transformers '(company-sort-by-occurrence)) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉
  )

;;; 主模式
(use-package json-mode)

(use-package markdown-mode)


(provide 'init-packages)
