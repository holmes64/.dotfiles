## 重複したパスを登録しない。
typeset -U path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す
alias ql='qlmanage -p "$@" >& /dev/null'

# Change for M1
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)


# Setting the go path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

