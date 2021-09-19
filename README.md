# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## createアクション周辺(resources)
1. 最初にnew_pokemon_pathに相当するnewアクションで、formを作る。
2. 次に、そのformでの入力はpokemons_pathにPOSTリクエスストされる。その際の処理はcreateアクションに書く。
3. indexアクションで全体の表示。showアクションで個別の表示。どちらかに2の後にリダイレクトする。