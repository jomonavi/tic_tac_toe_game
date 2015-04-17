def wins?(array)
  #this is my method to check if a player has one the game
  #the 1st line uses iteration to check the rows
  #the other lines check vertical & horizontal lines by comparing array elements
  array.each { |a_array| return true if ((a_array[0] == a_array[1] && a_array[1] == a_array[2]) && a_array[2] != nil) }
  return true if (array[0][0] == array[1][0] && array[1][0] == array[2][0]) && array[2][0] != nil
  return true if (array[0][1] == array[1][1] && array[1][0] == array[2][1]) && array[2][1] != nil
  return true if (array[0][2] == array[1][2] && array[1][2] == array[2][2]) && array[2][2] != nil
  return true if (array[0][0] == array[1][1] && array[1][1] == array[2][2]) && array[2][2] != nil
  return true if (array[0][2] == array[1][1] && array[1][1] == array[2][0]) && array[2][0] != nil

  return false

end

def full?(array)
  #this method checks if the array is full to end the game
  #it uses iteration and the any method to seee if there's a nil or empty space
  #on the board
  array.each do |row|
    row.any? { |elem| return false if elem == nil }
  end

  return true
end

def board_pic(array)
  #this method displays the board by using string interpolation to make a picture
  #of the board
  puts "
  #{array[0][0]} | #{array[0][1]} | #{array[0][2]}
  ---------
  #{array[1][0]} | #{array[1][1]} | #{array[1][2]}
  ---------
  #{array[2][0]} | #{array[2][1]} | #{array[2][2]}
  "

  nil
end


def p1_row
  #this method returns player1's row selection
  puts "Player1 please select a row"
  row1 = gets.chomp

  return row1.to_i

end

def p1_column
  #this method returns player1's column selection
  puts "Player1 please select a column"
  column1 = gets.chomp

  return column1.to_i

end

def p2_row
  #this method returns player2's row selection
  puts "Player2 please select a row"
  row2 = gets.chomp

  return row2.to_i

end

def p2_column
  #this method returns player2's column selection
  puts "Player2 please select a column"
  column2 = gets.chomp

  return column2.to_i

end


def tic_tac_toe
  puts "Hi, you are playing tic-tac-toe!"
  puts "The rules are as follows:"
  puts "There is a 3x3 grid of empty spaces, and there are 2 players"
  puts "Players alternate turns; The 1st player is 'X' & the 2nd player is 'O'"
  puts "To win, you must have 3 'X' or 3 'O' in a row,"
  puts "whether horizontally, vertically, or diagonally"
  puts "You must play until a player wins, or the grid fills up"
  puts "Below are cells showing the coordinates for the board"
  puts "
  row 0 & column 0 | row 0 & column 1 | row 0 & column 2
  ------------------------------------------------------
  row 1 & column 0 | row 1 & column 1 | row 1 & column 2
  ------------------------------------------------------
  row 2 & column 0 | row 2 & column 1 |row 2 & column 2
  "
  puts "To select top left corner named 'row 0 & column 0', for example,"
  puts "You would enter 0 for row, and 0 for column when prompted"
  puts " "

  #the tic-tac-toe board is represented as an array with 3 arrays, each of which
  #contain 3 nils
  board = [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  #i use a loop that will ensure that the game will continue till the board is full
  until full?(board)
    board_pic(board)
    row1 = p1_row
    column1 = p1_column

    board[row1][column1] = "X"

    if wins?(board)
      board_pic(board)
      return "Player1 Wins"
    end
    if full?(board)
      board_pic(board)
      return "The Board is full"
    end

    board_pic(board)

    row2 = p2_row
    column2 = p2_column

    board[row2][column2] = "O"

    if wins?(board)
      board_pic(board)
      return "Player2 Wins"
    end
    if full?(board)
      board_pic(board)
      return "The Board is full"
    end


  end


end


puts tic_tac_toe
