=begin 【解説】
簡単なRPG風プログラム
=end

class Unit
  def initialize
    @hp = 10
  end

  def attack
    puts "#{@name}の攻撃！"
    rand(1..3)
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
  end

  def attack
    puts "「うおりゃー！」"
    super
  end
end

class Hero < Unit
  def initialize
    super
    puts "「いくぞ！」"
    @name = "勇者"
  end

  def attack
    puts "「くらえ！」"
    super
  end
end

hero = Hero.new
enemy = Enemy.new

until hero.death? || enemy.death?
  enemy.damage(hero.attack)
  hero.damage(enemy.attack) unless enemy.death?
end


