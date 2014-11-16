TeX Report Template
===================

##  必須環境

* Ruby >= 2.0.0
* rake
* jlisting.sty

### Macの環境設定
#### Rubyのバージョンチェック
```
$ ruby -v
```

#### Rakeコマンドのインストール
```
$ sudo gem install rake
```

bundlerを使っている場合は以下

```
$ bundle install --path vendor/bundle
```

#### jlisting.styのインストール
[ここ](http://prdownloads.sourceforge.jp/mytexpert/26068/jlisting.sty.bz2)からjlisting.styをダウンロードして以下を実行。`/path/to/jlisting.sty`はjlisting.styの場所、`*`はインストールしているTeXのバージョンを参照の上確認する。

```
$ sudo cp /path/to/jlisting.sty /usr/local/texlive/*/texmf-dist/tex/latex/listings/jlisting.sty
$ sudo chmod 644 /usr/local/texlive/*/texmf-dist/tex/latex/listings/jlisting.sty
$ sudo mktexlsr
```

## レポートの初期設定
```
$ git clone git@github.com:masawada/tex_report.git REPORT_NAME
$ cd REPORT_NAME
$ rake init
```

## TeXファイルの作成
```
$ rake create NAME=PAGE_NAME
```

## TeXのコンパイル
```
$ rake compile
```

または

```
$ rake
```

### 表紙の編集
```
$ editor conifg/title.yml
```

`title.yml`を編集して保存してください。

### Rubyの埋め込み
erbでRubyを埋め込むことが可能です。

```
\begin{itemize}
<% ["hoge", "fuga", "hogefuga"].each do |item| %>
  \item <%= item %>
<% end %>
\end{itemize}
```

また、ヘルパ関数を定義して呼び出すことができます。

`lib/helpers`以下に`.rb`ファイルを作成して、内部で関数を定義してください。コンパイル時、TeXファイルの中から呼び出すことが可能です。

デフォルトで

* ソースコードの添付
* 画像の添付

のヘルパ関数が登録されています。

### ソースコードの添付
* `src`ディレクトリ以下にソースコードを保存
* TeXファイルに以下のようにerbを記述(ここでは`src/hoge.c`を保存したとする)

```erb
<%= code("hoge.c", "hoge.cのソースコード") %>
```

ラベルはデフォルトで`.`を`-`に置き換えたものが指定されます(ここでは`hoge-c`)。ラベルを独自のものに変更したい場合は第三引数にそれを記述してください。

```erb
<%= code("hoge.c", "hoge.cのソースコード", "dokuji-label") %>
```

また、言語はデフォルトでC言語が指定されます。変更したい場合は第四引数に言語を記述してください。

```erb
<%= code("hoge.rb", "hoge.rbのソースコード", "dokuji-label", "ruby") %>
```

このとき、ラベルをデフォルトにしたい場合は第三引数を`nil`してください。

### 画像ファイルをTeXに添付
* .pngファイルまたは.jpgファイルを`images`ディレクトリ以下に保存
* TeXファイルに以下のようにerbを記述(ここでは`images/hoge.png`を保存したとする)

```erb
<%= image("hoge.png", "hogeの画像") %>
```

ラベルはデフォルトで`.`を`-`に置き換えたものが指定されます(ここでは`hoge-png`)。ラベルを独自のものに変更したい場合は第三引数にそれを記述してください。

```erb
<%= image("hoge.png", "hogeの画像", "dokuji-label") %>
```

また、サイズはデフォルトで横幅15cmです。変更したい場合は第四引数に記述してください。

```erb
<%= image("hoge.png", "hogeの画像", "dokuji-label", "10cm") %>
```

このとき、ラベルをデフォルトにしたい場合は第三引数を`nil`してください。

### 参考文献の出力
`config/bibliography.yml`を編集すると参考文献を出力することができます。

```
label: item
```

TeX本文からは`\cite{label}`でlabelに対応する参考文献を呼び出すことができます。
