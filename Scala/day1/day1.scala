// Write a game that will take a tic-tac-toe board with X, O, and blank
// characters and detect the winner or whether there is a tie or no winner
// yet. Use classes where appropriate.

object Board{
    val board = Array.fill(3, 3)(' ')
    var counter = 0
    def checkForWinner(player: Char): Boolean = {
        // Who needs for-loops amirite??
        val a = board.zipWithIndex map {case(el, i) => board.forall(_(i) == player)} exists(e => e == true)
        return board.exists(_.forall(_ == player)) || a
    }

    def makeMove(player: Char, move: Array[Int]): Boolean = {
        if(board(move(0))(move(1)) == ' '){
            board(move(0))(move(1)) = player
        } else {
            return false
        }
        counter += 1
        return checkForWinner(player)
    }
    
    def printBoard(): Unit = {
        print(board.map(_.mkString).mkString("\n"))
        println()
    }
}

// Bonus problem: Let two players play tic-tac-toe.
while (true){
    val player1 = 'X'
    val player2 = 'O'
    var a = scala.io.StdIn.readLine("Player 1 make a move (Y, X): ")
    if(Board.makeMove(player1, a.split(" ").map(_.toInt))){
        println("Player one has won!")
        System.exit(0)
    }
    a = scala.io.StdIn.readLine("Player 2 make a move (Y, X): ")
    if(Board.makeMove(player2, a.split(" ").map(_.toInt))){
        println("Player two has won!")
        System.exit(0)
    }
    if(Board.counter == 9){
        println("Its a tie!")
        System.exit(0)
    }
    Board.printBoard()
}