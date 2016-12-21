# 使い方
## １．前準備
- home以下の.dotfilesに、vimの設定ファイルをクローンする。この時、自身のgithubにforkして、cloneするとなお良い
```bash
git clone git@github.com:shin-chang/dotfiles.git  ~/.dotfiles
```

- vimパッケージを管理するためのdein.vimをクローンする。
```bash
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
  ~/.vim/dein/repos/github.com/Shougo/dein.vim
```

## ２．インストール
- Vimの設定ファイル(.vimrc)を作成するため、.dotfilesディレクトリからシンボリックリンクを貼る

```bash
~/.dotfiles/dotfilesLink.sh  
```

※rootでも使いたい場合、同様にrootフォルダ以下の .vimrcにシンボリックリンクを貼る必要がある。  

- 設定ファイルを追加後 vimを開いて、pluginのinstallを実施する
```bash
vim  
(in vim)	:call dein#install()
```
