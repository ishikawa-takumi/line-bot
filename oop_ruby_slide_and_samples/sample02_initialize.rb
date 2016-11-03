=begin 【解説】
インスタンスをnewで生成することをインスタンス化という。
コンストラクタはインスタンス化するタイミングで実行される。
つまりインスタンスとして実物を作る際に始めに絶対に動作させることが出来る。
主にはそのインスタンスの「最低限必要な初期の情報」などを揃えるために使う。
=end

class JackInTheBox
  def initialize(name)                  # Rubyのコンストラクタはinitializeという名前で決まっている
    puts "プレゼントが届いたよ！" # インスタンス化されたタイミングで画面にメッセージを表示
    #@name = "びっくり箱くん"      # 名前を設定
    @name = name
  end

  def open
    puts "べろべろばぁ〜！"
    puts "ボクの名前は#{@name}だよ！びっくりした？"
  end
end

box = JackInTheBox.new("ishikawa") # newでインスタンス化したタイミングでinitializeが実行される
box.open

