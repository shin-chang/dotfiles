# 使い方
## １．前準備
- コンパイルのためgccパッケージが必要  
```bash
sudo yum -y install gcc
```

- ローカル(好きなディレクトリでよい)に、メインファイルが集まるリポジトリをクローンする。
```bash
cd "好きなディレクトリ"
git clone git@github.com:shin-chang/dotfiles.git  
```

- プラグイン neobundle, vimprocをクローンする。
```bash
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  
```

## ２．インストール
- .vimディレクトリ、.vimrcを作成するため、dotfileディレクトリからシンボリックリンクを貼る

```bash
cd dotfiles/  
./dotfilesLink.sh  
```

※rootでも使いたい場合、同様にrootフォルダ以下の .vimrcと、.vim/ にシンボリックリンクを貼る必要がある。  
サンプルとして、```dotfilesLink-for-root.sh``` をおいているが、適宜ユーザ名を編集して使用してください  

- vimprocディレクトリに移動し、vim を開くと、プラグインのコンパイルが始まる。ひたすらエンターキー 【y(es)】 を押し、インストールする。  
```bash
cd ~/.vim/bundle/vimproc/  
vim  
```

※そもそもVim(OSバージョンがCentos5系など)が古いとNeoBundleがエラーを吐きます。  
その場合、手動でVIM7.4を入れましょう  
http://qiita.com/tukiyo3/items/7750fc09efd6465b7a38  
