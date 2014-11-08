TeX Report Template
===================

##  必須環境

* Ruby >= 1.9.3
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

`config.yml`を編集して保存してください。

### ソースコードの添付
* `src`ディレクトリ以下にソースコードを保存
* `\lstinputlisting[caption=hoge,label=hoge]{filename}`を表示したい場所に添付
  * このときfilenameは上で保存したファイル名(src/は不要)
  * captionはコードの説明、labelは添付したソースコード固有のid

### .pngファイルをTeXに添付
* .pngファイルを`images`ディレクトリ以下に保存
* 以下のコード片を表示したい場所に添付
  * このときfilenameは上で保存したファイル名(images/は不要)

```
\begin{figure}[htbp]
  \begin{center}
    \label{hoge}
    \includegraphics[width=15cm]{filename}
    \caption{hoge}
  \end{center}
\end{figure}
```
