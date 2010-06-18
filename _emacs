(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil nil (tool-bar)))	;不显示工具栏

;;emacs常规设置
(add-to-list 'load-path "~/.emacs.d/extension") ;设置emacs扩展读取路径
(setq column-number-mode t)				;显示列号
(setq line-number-mode t)				;显示行号
(menu-bar-mode nil)						;去除menubar
(scroll-bar-mode nil)					;去除scrollbar
(setq-default cursor-type 'bar)			;设置光标为i-Beam
(ido-mode t)							;ido模式默认开启
(setq display-time-24hr-format t)		;mode-line时间格式设置
(setq display-time-day-and-date t)		;mode-line日期格式设置
(display-time)							;mode-line显示日期与时间
;(set-frame-font "WenQuanYi Micro Hei Mono-10")			;英文字体
;(set-frame-font "Terminus-10")			;英文字体
;(set-fontset-font "fontset-default" 'han '("WenQuanYi Bitmap Song")) ;中文字体
(show-paren-mode 1)													 ;显示配对括号
(setq show-paren-delay 1)											 ;显示配对括号延迟时间
(mouse-avoidance-mode 'animate)										 ;鼠标避开靠近的光标

;;设置主题
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/color-theme")
;(require 'color-theme)
;(eval-after-load "color-theme"
;  '(progn
;	 (color-theme-initialize)
;	 (if window-system
;		 (color-theme-comidia)			;GUI主题
;	   (color-theme-comidia)			;CLI主题
;	 )))

;;yasnippet配置
(add-to-list 'load-path
			 "~/.emacs.d/extension/yasnippet-0.6.1c/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/extension/yasnippet-0.6.1c/snippets")

;;C语言开发环境配置
(setq-default c-default-style "linux"	;缩进风格为Linux内核开发风格
			  tab-width 4					;tab大小设置
			  c-basic-offset 4				;自动缩进大小
			  indent-tabs-mode t)			;自动缩进使用的是tab而非空格

;;HTML开发环境配置
(add-hook 'html-mode-hook
		  (lambda ()
			(set (make-local-variable 'sgml-basic-offset) 4)))
(add-hook 'sgml-mode-hook
		  (lambda ()
			(set (make-local-variable 'sgml-basic-offset) 2)
			(sgml-guess-indent)))

;;按F11进入全屏模式
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )

;;自动补全(auto complete)设置
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/extension/dict")
(ac-config-default)

;;快速切换buffer(pinbar)
(require 'pinbar)
(global-set-key "\M-0" 'pinbar-add)
(pinbar-mode t)

;;jabber客户端设置
(setq jabber-account-list
	  '(("ghosthomas@gmail.com"
		 (:network-server . "talk.google.com")
		 (:connection-type . ssl))))

;;erc配置
(setq erc-default-coding-system '(utf-8 . utf-8)) ;设置默认编码
(setq erc-nick "ghosTM55"
      erc-user-full-name "Thomas X. Iverson"
	  erc-system-name "ghosTunix")
(setq erc-server "irc.oftc.net")
(erc-autojoin-mode 1)					;自动加入
(setq erc-autojoin-channels-alist
      '(("oftc.net"
         "#arch-cn"
         "#emacs-cn")
		("freenode.net"
		 "#shlug"
		 "#kalug"
		 "#ubuntu-tw"
		 "#ubuntu-cn"
		 "#chinalug"
		 "#gentoo-cn")))
(erc-timestamp-mode 1)											;启用时间戳
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left) ;设置时间戳在左边
;(setq erc-fill-column 100)										;设置fill宽度
(add-hook 'window-configuration-change-hook 
		  '(lambda ()
			 (setq erc-fill-column (- (window-width) 2)))
		  )
(setq erc-fill-prefix "      > ")								;设置fill前缀
(setq erc-ignore-list nil)										;忽略指定信息
(setq erc-hide-list
      '("JOIN" "PART" "QUIT" "MODE"))	;隐藏指定信息(这里是登录登出信息)
