;;; pakage --- summary
;;; Commentary:
;;; Code:
;;; *************************************************
;;;	> Filename        :	init-packages.el
;;;	> Description     :	emacs包管理
;;;	> Creat time      :	2023-02-05 10:58
;;;	> Last modified   :	2023-02-06 12:01
;;;	> Author          :	Daiwu Shen
;;;	> Email           :	shendaiwu@163.com
;;; *************************************************
;;;;---------------------------------基础配置------------------------------------------
(use-package electric-pair-mode
  :ensure nil
  :hook(after-init . electric-pair-mode))

(use-package show-paren-mode
  :ensure nil
  :hook((text-mode prog-mode) . show-paren-mode))

(use-package column-number-mode
  :ensure nil
  :hook((text-mode prog-mode) . column-number-mode))

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
  :hook (after-init . global-hl-line-mode))

(use-package tool-bar-mode
  :ensure nil
  :init
  (tool-bar-mode 0))

(use-package size-indication-mode
  :ensure nil
  :hook(after-init . size-indication-mode))

(use-package auto-fill-mode
  :ensure nil
  :hook(after-init . auto-fill-mode))

(use-package auto-save-visited-mode
  :ensure nil
  :hook(after-init . auto-save-visited-mode))

;; 美化符号
(use-package global-prettify-symbols-mode
  :ensure nil
  :hook (TeX-mode . global-prettify-symbols-mode))

;; 保存历史记录
(use-package savehist-mode
  :ensure nil
  :hook (kill-buffer . savehist-mode)
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
  :hook(kill-buffer . save-place-mode))

;; 最近打开的列表
(use-package recentf-mode
  :ensure nil
  :config
  (setq recentf-max-menu-items 5)
  :hook (after-init . recentf-mode))

;; 在状态条上显示当前光标在哪个函数体内部
(use-package which-function-mode
  :ensure nil
  :hook (prog-mode . which-function-mode))

;;;;----------------------------------用户包-----------------------------------
;;;;---------------------------------minibuffer增强----------------------------
;; marginalia---minibuffer注解增强
(use-package marginalia
  :hook(minibuffer-mode . marginalia-mode))

;; vertico---minibuffer补全
(use-package vertico
  :hook(after-init . vertico-mode))

;; embark---minibuffer行为增强
(use-package embark
  :config
  (setq prefix-help-command 'embark-prefix-help-command)
  :bind
  (:map global-map
	("C-x ;" . embark-act)))

;; consult---文件内搜索增强
(use-package consult
  :bind (:map global-map
	      ("C-s" . consult-line)
	      ("C-c C-s" . consult-ripgrep)
	      ("C-x b" . consult-buffer)))

;; orderless---无序搜索
(use-package orderless
  :init
  (setq completion-styles '(orderless)))

;;;;-------------------------------------实用工具---------------------------------
;; which-key-mode
(use-package which-key
  :hook(after-init . which-key-mode)
  :config (setq which-key-idle-delay 0))

;; format-all
(use-package format-all
  :hook(before-save . format-all-buffer)
  :bind
  (:map prog-mode-map("C-c f b" . format-all-buffer)))

;; iedit---多点编辑
(use-package iedit
  :bind(("C-<f2>" . iedit-mode)
	("C-c <f2>" . iedit-mode-toggle-on-function)))

;; 文件树
(use-package treemacs
  :config
  (setq treemacs-indentation-string " "
	treemacs-show-hidden-files t)
  :bind
  (:map global-map
	("C-1" . treemacs-select-window)
	("C-c t t" . treemacs)
	("C-c t d" . treemacs-select-directory))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

;; projectile
(use-package projectile
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-track-known-projects-automatically nil
	projectile-enable-caching t))

;;
(use-package treemacs-projectile
  :after (treemacs projectile))

;;;;-----------------------------------github-------------------------------------
;; git
(use-package magit)

;;;;----------------------------------美化相关--------------------------------------
;; dashboard
(use-package dashboard
  :defer nil
  :config
  (setq dashboard-banner-logo-title "Happy Hacking!";个性签名
	dashboard-projects-backend 'projectile
	dashboard-startup-banner 'official;自定义图片
	dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5)))
  :init (dashboard-setup-startup-hook)
  )

;;;;------------------------------------补全相关---------------------------------------
;; company
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1 ; 只需敲 1 个字母就开始进行自动补全
	company-tooltip-align-annotations t
	company-idle-delay 0.0
	company-show-quick-access t ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
	company-selection-wrap-around t
	company-transformers '(company-sort-by-occurrence)) ; 根据选择的频率进行排序
  :bind
  (:map company-active-map
	("<tab>" . company-complete-common-or-cycle)
	("C-h" . company-show-doc-buffer)))
;; yasnippet---提示代码片段
(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode)
  :config
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar 'company-mode/backend-with-yas company-backends)))

;; yasnippet-snippets
(use-package yasnippet-snippets
  :after yasnippet)

;; lsp
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 500)
  :hook
  (lsp-mode . lsp-enable-which-key-integration) ; which-key integration
  :commands (lsp lsp-deferred)
  :config
  ;; (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
  (setq lsp-headerline-breadcrumb-enable t)
  :bind
  ("C-c l s" . lsp-ivy-workspace-symbol)) ;; 可快速搜索工作区内的符号（类名、函数名、变量名等）

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] 'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] 'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'at-point)
  :hook(prog-mode . lsp-ui-mode))

;; 语法检查
(use-package flycheck
  :config
  (setq truncate-lines nil)
  :hook
  (prog-mode . flycheck-mode)
  :bind
  (:map flycheck-mode-map
	("M-<down>" . flycheck-next-error)
	("M-<up>" . flycheck-previous-error)))

(provide 'init-packages)
;;; init-packages.el ends here
