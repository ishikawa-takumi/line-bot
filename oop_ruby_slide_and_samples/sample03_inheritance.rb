=begin 【解説】
クラス設計をちゃんとすれば継承とオーバーライドはとても便利な機能です。
（今回はサンプルなのでキレイではないですが）
一部だけ処理を書き換えたり、完全に書き換えたりできます。
例えばattackというメソッドを持つUnitクラスがあって、
その子供にMagicianクラスとNinjaクラスを作ったとしましょう。
Ninjaクラスのattack実行時だけ60%の確立でクリティカルヒットが出る！というように一部処理を書き換えたい場合に便利です。

このへんが簡単だという人はポリモーフィズムと言うものも合わせて勉強するとよりよいでしょう。
難しい人は自分で処理を変えながら自分で動かしてみて下さい。
=end

class NokoNoko
  def initialize
    puts "I'm born!!!"
  end

  def walk
    puts "てくてく"
  end

  def run
    puts "タッタッタッタッ"
  end
end

class PataPata < NokoNoko # NokoNokoクラスを継承してPataPataクラスを作成
  def walk                # 親の処理を一部書き換えるパターン
    super                 # superで親の処理を呼び出すことが出来る
    puts "ぴょんぴょん"
  end

  def run                 # 親の処理を完全に上書きするパターン
    puts "びゅーん"
  end
end

enemy1 = NokoNoko.new
enemy1.walk
enemy1.run
enemy2 = PataPata.new  # PataPataクラスのインスタンス化時にもinitializeが実行される
enemy2.walk
enemy2.run


