# 使い方

- コンパイルのためgccパッケージが必要  
```bash
sudo yum -y install gcc
```

- 上記コマンドで生成したid-rsa.pubの中身をgithubに登録  
```bash
git clone git@github.com:shin-chang/dotfiles.git  
cd dotfiles/  
./dotfilesLink.sh  
```
※rootでも.vimrcと、.vim/ のシンボリックリンクが必要。適宜名前を変更すること  
```bash
./dotfilesLink-for-root.sh  
```

```bash
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc  
cd ~/.vim/bundle/vimproc/  
```

- vim を開いて、y(es) を押し、インストールする。ひたすらエンターキーを押す。  
```
vim  
```

※そもそもVim(OSバージョンがCentos5系など)が古いとNeoBundleがエラーを吐きます。  
その場合、手動でVIM7.4を入れましょう  
http://qiita.com/tukiyo3/items/7750fc09efd6465b7a38  
