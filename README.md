# README


## createアクション周辺(resources)
1. 最初にnew_pokemon_path(/pokemons/new)に相当するnewアクションで、formを作る。
2. 次に、そのformでの入力はpokemons_pathにPOSTリクエスストされる。その際の処理はcreateアクションに書く。
3. indexアクションで全体の表示。showアクションで個別の表示。どちらかに2の後にリダイレクトする。

## heroku
1. jpegが使えないので、jpgに名前を変更しておく。
2. ログを見れば大体どこがエラーになっているかわかる。
3. rubyは最新版のものを使わないとエラーになる。