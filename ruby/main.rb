class LookThatWay
  # rps: rock_paper_scissors
  # ltw: look_that_way 
  
  def dashed_line
    puts "---------------------------------------------"
  end
  
  def get_move_message(str)
    dashed_line
    if str == "rps" then
      puts "じゃんけん"
      puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    elsif str == "ltw" then
      puts "あっち向いてホイ"
      puts "0(上) 1(下) 2(左) 3(右)"
    end
  end
  
  def get_move(str)
    isLoop = true
    while isLoop
      get_move_message(str)
      @player_move = gets.chomp.to_i
      if @player_move >= 0 && @player_move <= 3 then
        isLoop = false
      end
    end
  end
  
  def get_cpu_move(str)
    isLoop = true
    while isLoop
      if(str == "rps") then
        @cpu_move = rand(3)
      else
        @cpu_move = rand(4)
      end
      if !(@player_move == @cpu_move) || str == "ltw" then
        isLoop = false
      end
    end
  end
  
  def judge(str)
    case str
    when "rps"
      if @player_move == 3 then
        @active = false
      elsif @cpu_move == 3 then
        @active = true
      elsif @cpu_move - @player_move == 1 || @cpu_move - @player_move == -2 then
        @active = true
      else
        @active = false
      end
    when "ltw"
      if @player_move == @cpu_move then
        @isLoopToLTW = false
      else
      end
    end
  end
  
  def move_to_game(str, move)
    case str
    when "rps"
      case move
      when 0
        return "グー"
      when 1
        return "チョキ"
      when 2
        return "パー"
      when 3
        return "戦わない"
      end
    when "ltw"
      case move
      when 0
        return "上"
      when 1
        return "下"
      when 2
        return "左"
      when 3
        return "右"
      end
    end
  end
  
  def result_message(str)
    dashed_line
    puts "あなた:#{move_to_game(str, @player_move)}"
    puts "相手  :#{move_to_game(str, @cpu_move)}"
    case str
    when "rps"
      if @active then
        puts "あなたが攻撃側です"
      else
        puts "あなたが防御側です"
      end
    when "ltw"
      if !@isLoopToLTW then
        if @active then
          puts "あなたの勝利です!!"
        else
          puts "あなたの敗北です..."
        end
      else
        puts "もう一回"
      end
    end
  end
  
  def rock_paper_scissors
    game = "rps"
    get_move(game)
    get_cpu_move(game)
    judge(game)
    result_message(game)
  end
  
  def look_that_way
    game = "ltw"
    get_move(game)
    get_cpu_move(game)
    judge(game)
    result_message(game)
  end
  
  def start
    @isLoopToLTW = true
    while @isLoopToLTW
      rock_paper_scissors
      look_that_way
    end
  end
end

game = LookThatWay.new()
game.start
