# Do-To-Grow

![LandingPage](app/assets/images/landingpage.png "ランディングページ")  
![TaskList](app/assets/images/task_list.png "伸び代一覧")  
![RestaurantList](app/assets/images/restaurant_list.png "取得飲食店一覧")

## アプリケーションの概要
- 基本的なTodoアプリのタスクの管理が可能
- タスクの登録をする際に、優先度も同時に登録する。タスクが終わった後、そのタスクの優先度が自分のポイントとして加算される。
- 10ポイント貯まると飲食店ガチャを1回引くことができる。自分の住む都道府県の飲食店がランダムで出る。
- ガチャで出た飲食店は、自分のコレクションとして貯めておくことができる。

## URL集
- [アプリケーション](https://do-to-grow.herokuapp.com/)
- [デモ動画](https://drive.google.com/file/d/1y_IJLWq4QACGayd379j3wbZ4fg1MkGjC/view?usp=sharing)



## 技術的な学び

### createアクション周辺(resources)
1. 最初にnew_pokemon_path(/pokemons/new)に相当するnewアクションで、formを作る。
2. 次に、そのformでの入力はpokemons_pathにPOSTリクエスストされる。その際の処理はcreateアクションに書く。
3. indexアクションで全体の表示。showアクションで個別の表示。どちらかに2の後にリダイレクトする。

### heroku
1. jpegが使えないので、jpgに名前を変更しておく。
2. ログを見れば大体どこがエラーになっているかわかる。
3. rubyは最新版のものを使わないとエラーになる。
- `heroku run rails db:migrate`を最初に実行するのも忘れない！
- データベースのリセットの方法
1. `heroku pg:reset -a do-to-grow`を実行。
2. `heroku run rails db:migrate`を実行。

### API
1. APIを一回で取り出すデータの数を指定できることも。

### エラー
- `Webpacker can't find application`というエラーが出た時は、以下を実行すれば良い。
```ruby
rails webpacker:install
rails webpacker:compile
```
- background-imageはそのまま、`background-image: url("growth.jpg");`でやるとエラーが出るので、以下の手順を踏むべき。
1. background-imageを書く場所をcssではなく、scssファイルにする。
2. `background-image: image-url("growth.jpg");`のように書く。

### その他
- migrateの時点で、[データベースにデータを入れる](https://qiita.com/mHadate/items/bc698ce5c126c932487e)