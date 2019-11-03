# README

## 環境
- OS
  - 仮想環境Ubuntu 1.04
- Lang
  - ruby 2.5.1-57
  - rails 5.2.3
 - Herokuを利用予定

## about App
### What
コードをTwitter上でシェアする。
### Why
現状、Twitterでコードを投稿すると、Syntax highlightは反映されず、また`User.name`とするとエスケープされず、リンクとして認識されてしまう。
### How
1. RubyonRailsを利用し、マークダウンで投稿できるWebサイトを構築。
2. Twitterログイン機能等を付加し、同時にTwitterシェア出来るようにする。
3. Twitterカード機能を利用する。アイキャッチはcanvas等で作成させる。

## update
- 2019.11.3：作成開始
