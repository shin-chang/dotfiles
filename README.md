# 使い方
## １．前準備
- home以下の.dotfilesに、vimの設定ファイルをクローンする。この時、自身のgithubにforkして、cloneするとなお良い
```bash
git clone https://github.com/matsu0228/dotfiles.git ~/.dotfiles
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
chmod 755 ~/.dotfiles/dotfilesLink.sh  
~/.dotfiles/dotfilesLink.sh  
```

※rootでも使いたい場合、同様にrootフォルダ以下の .vimrcにシンボリックリンクを貼る必要がある。  

- 設定ファイルを追加後 vimを開く。このとき、pluginが自動でinstallされる
```bash
vim hoge
```

- bashrcの追記  
```
 tail ~/.bashrc
 cat ~/.dotfiles/_bashrc  >> ~/.bashrc
 source ~/.bashrc
```

## ３．注意点  
- vimのバージョンは7.4以降である必要あり（macならmacportでinstall）
- UniteGrepできない場合は、vimprocを手動でmakeする必要有






