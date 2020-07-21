def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(board,index, player)
    board[index] = player
    board
  end 
  
  def valid_move?(board, index)
      def position_taken?(array, index)
        if array[index] == " " || array[index] == "" || array[index] == nil
           false
        else
           true
        end
      end
    
      def on_board?(num)
        if num.between?(0, 8) == true
           true
        else
           false
        end
      end
    
      if (position_taken?(board, index)) == false && (on_board?(index) == true)
         true
      else
         false
      end 
  end
  
  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board,index)
        player = current_player(board)
        move(board, index, player)
        display_board(board)
    else
      turn(board)
    end  
  end
  
  def turn_count(board)
    turns = 0 
    board.each do |element|
      if element == "X" || element == "O"
        turns += 1 
      end 
    end  
      turns
  end 
  
  def current_player(board)
    if turn_count(board) % 2 == 0 
      "X"
    else
      "O"
    end  
  end
  
  # Helper Method
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end
  
  # Define your WIN_COMBINATIONS constant
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    def won?(board)
      WIN_COMBINATIONS.each do |element|
        win_index1 = element[0]
        win_index2 = element[1]
        win_index3 = element[2]
      
      position1 = board[win_index1]
      position2 = board[win_index2]
      position3 = board[win_index3]
      # binding.pry
      if position1 == "X" && position2 == "X" && position3 == "X"
        return element
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return element
      end  
    end
    false
  end
  
  def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end  
  
  def draw?(board)
    if full?(board) == true && won?(board) == false 
       true
    else
      false
    end
  end  
  
  def over?(board)
    if won?(board) || draw?(board)
      true
    else
      false
    end  
  end 
  
  def winner (board)
    win_array = []
    win_array = won?(board)
    if win_array == false
      return nil
    else
      if board[win_array[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play(board)
    while over?(board) == false 
      turn(board)
    end
  
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
    