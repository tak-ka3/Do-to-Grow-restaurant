# README
- migrateの時点で、[データベースにデータを入れる](https://qiita.com/mHadate/items/bc698ce5c126c932487e)

## createアクション周辺(resources)
1. 最初にnew_pokemon_path(/pokemons/new)に相当するnewアクションで、formを作る。
2. 次に、そのformでの入力はpokemons_pathにPOSTリクエスストされる。その際の処理はcreateアクションに書く。
3. indexアクションで全体の表示。showアクションで個別の表示。どちらかに2の後にリダイレクトする。

## heroku
1. jpegが使えないので、jpgに名前を変更しておく。
2. ログを見れば大体どこがエラーになっているかわかる。
3. rubyは最新版のものを使わないとエラーになる。
- `heroku run rails db:migrate`を最初に実行するのも忘れない！

## API
1. APIを一回で取り出すデータの数を指定できることも。

## エラー
- `Webpacker can't find application`というエラーが出た時は、以下を実行すれば良い。
```ruby
rails webpacker:install
rails webpacker:compile
```