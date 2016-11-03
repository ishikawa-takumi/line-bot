=begin 【解説】
JackInTheBox：クラス（設計図） ※Jack in the box = びっくり箱
open：JackInTheBoxが持つメソッド
box ：JackInTheBoxのインスタンス（実際に動くもの）
=end

class JackInTheBox          # JackInTheBoxクラスを定義（仕様を宣言）、つまりこれが設計図となる
  def open                  # JackInTheBoxはopenという振る舞いが可能という仕様にする
    puts "べろべろばぁ〜！" # JackInTheBoxに対してopenの動作を呼び出すとべろべろばぁ〜！と言う
  end
end

box = JackInTheBox.new      # びっくり箱の設計図
box.open

