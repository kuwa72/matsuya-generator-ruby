# Saize

folkd from [Matsuya](https://github.com/toshia/matsuya-generator-ruby)

既存のサイゼリヤのメニューを参考にして、ありそうなメニューを適当に作ります。たまに実在するメニューも出てきます。

## Installation

bundle

```ruby
gem 'saize'
```

こうじゃ

    $ bundle

こっちでもいいかな

    $ gem install saize

## Usage
### シェルから使う
`gem install`した場合は、以下のようなコマンドを入力するとなにか出てきます。
```
% saize
ミルクシチリアアンチョビのペペロンチーノ
% saize
ベルデッキオ（辛口・中）
% saize
ランブルスコセッコ（赤）辛口
% saize -o 0.8
カプチーノ(アイスケーキ)(季節限定)
% saize
スモールライス
%
```
キツい

コマンドラインオプションについては -h オプションをつけてくれ

### ライブラリとして
```ruby
require 'saize'

puts Saize.order
puts Saize.order(0)
puts Saize.order(0.8)
```

output:

```
ガーリックトースト
キャンティルフィナリゼルパ（辛口・重い）
若鶏のサラダ
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/saizeriya-generator-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
