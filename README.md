# 使い方
## １．前準備
- コンパイルのためgccパッケージが必要  
```bash
sudo yum -y install gcc
```

- ローカル(好きなディレクトリ)にリポジトリをクローンする。
```bash
git clone git@github.com:shin-chang/dotfiles.git  
```

## ２．インストール
- .vimディレクトリ、.vimrcを作成するため、dotfileディレクトリからシンボリックリンクを貼る

```bash
cd dotfiles/  
./dotfilesLink.sh  
```

※rootでも使いたい場合、.vimrcと、.vim/ のシンボリックリンクを貼る必要がある。  
サンプルとして、```dotfilesLink.sh``` をおいているが、適宜ユーザ名を編集して使用してください  

-  その他関連ファイル

```bash
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  
cd ~/.vim/bundle/vimproc/  
```

- vim を開くと、プラグインのコンパイルが始まる。ひたすらエンターキー 【y(es)】 を押し、インストールする。  
```
vim  
```

※そもそもVim(OSバージョンがCentos5系など)が古いとNeoBundleがエラーを吐きます。  
その場合、手動でVIM7.4を入れましょう  
http://qiita.com/tukiyo3/items/7750fc09efd6465b7a38  
