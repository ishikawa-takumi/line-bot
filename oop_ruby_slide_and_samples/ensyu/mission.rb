=begin 【解説】
簡単なRPG風プログラム
=end

class Unit
  def initialize
    @hp = 10
    @attacki_power = 0
  end

    
  def attack
    sleep(1)
    puts "#{@name}の攻撃！"
    return calc_attack_val
  end

  def calc_attack_val
    if @attack_selection == 1 then
      @damage_val = rand(1..3)
    elsif @attack_selection == 2 then
      @damage_val = @hissatsu_damage
    end

    if is_critical? then
      puts "<Critical hits>"
      return 2*@damage_val
    end

    return @damage_val
  end

  def is_critical?
    rand(1..10) == 1
  end

  def damage(attack)
    @hp = @hp - attack
    puts "#{@name}は#{attack}のダメージを受けた！"
    if @hp < 0
      death_scream
    end
  end

  def death?
    @hp < 0
  end

  def death_scream
    puts "#{@name}「やーらーれーたー」"
  end
end

class Enemy < Unit
  def initialize
    super
    puts "「かかってこい！」"
    @name = "敵"
    @hissatsu_damage
  end

  def attack
    puts "「うおりゃー！」"
    puts "     　∧_∧　ババババ
    （ ・ω・)=つ≡つ
    （っ ≡つ=つ
    `/　　)
    (ノΠＵ"
    select_attack_rand
    super
  end

  def death_scream
    puts "#{@name}「oh」"
  end

  def select_attack_rand
    if is_hissatsu then
      @attack_selection = 2
    else
      @attack_selection = 1
    end
  end

  def is_hissatsu
    rand(1..5) == 1
  end
end

class Hero < Unit
  def initialize
    super
    puts "「いくぞ！」"
    @hissatsu_damage = 5
  end

  def setName
    puts "Input your name."
    @name = STDIN.gets.chomp
  end

  def attack
    puts "「くらえ！」"
    puts "
　　 _, ,_　 パーン
　（　‘д‘）
　　⊂彡☆))Д´）"
    select_attack
    super
  end

  def death_scream
    puts "#{@name}「ah」"
  end

  def select_attack
    while TRUE do
      puts "select 1:Noraml 2:Hissat"
      @attack_selection = STDIN.gets.chomp.to_i

      if is_select_input(@attack_selection) then
        break
      else
        puts "it is bad selection"
      end
    end
  end

  def is_select_input(selection)
    selection == 1 || selection == 2
  end
end

hero = Hero.new
enemy = Enemy.new
hero.setName

until hero.death? || enemy.death?
  enemy.damage(hero.attack)
  hero.damage(enemy.attack) unless enemy.death?
end


