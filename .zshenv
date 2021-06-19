## 重複したパスを登録しない。
typeset -U path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す
alias ql='qlmanage -p "$@" >& /dev/null'

path=(# システム用
      /bin(N-/)
      # 自分用
      $HOME/local/bin(N-/)
      # Debian GNU/Linux用
      /var/lib/gems/*/bin(N-/)
      # MacPorts用
      /opt/local/bin(N-/)
      	/usr/bin(N-/)
	)

# home-brewにPATHを通す
export PATH=/usr/local/bin:$PATH
