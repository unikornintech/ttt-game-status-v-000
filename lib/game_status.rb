# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
def won?(board)

  WIN_COMBINATIONS.detect do |win_combination|
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]
    
    board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
  end
end

def full?(board)
  board.none? { | position | position == " " }
end

def draw?(board)
  board.none? { |position | position == " " } && !won?(board)
end

def over?(board)
 draw?(board) || won?(board)
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end