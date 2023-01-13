import 'package:arudu_customer/components/card_offer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  // X and O values for the board
  late List<String> board;
  late String currentPlayer;
  late String message;

  @override
  void initState() {
    super.initState();
    board = List.filled(9, '');
    currentPlayer = 'X';
    message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (board[index] == '') {
                        board[index] = currentPlayer;
                        checkForWin();
                        switchPlayer();
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(message),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    child: Text('New Game'),
                    onPressed: () {
                      setState(() {
                        board = List.filled(9, '');
                        currentPlayer = 'X';
                        message = '';
                      });
                    },
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                      primary: primary,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  // Check if the game is won
  void checkForWin() {
    bool over = false;
    if (board[0] == currentPlayer &&
        board[1] == currentPlayer &&
        board[2] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[3] == currentPlayer &&
        board[4] == currentPlayer &&
        board[5] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[6] == currentPlayer &&
        board[7] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[0] == currentPlayer &&
        board[3] == currentPlayer &&
        board[6] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[1] == currentPlayer &&
        board[4] == currentPlayer &&
        board[7] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[2] == currentPlayer &&
        board[5] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[0] == currentPlayer &&
        board[4] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (board[2] == currentPlayer &&
        board[4] == currentPlayer &&
        board[6] == currentPlayer) {
      message = 'Spieler $currentPlayer gewinnt!';
      over = true;
    } else if (!board.contains('')) {
      message = 'Unentschieden';
      over = true;
    }
    if (over) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Spiel vorbei'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: Text('Neues Spiel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      board = List.filled(9, '');
                      currentPlayer = 'X';
                      message = '';
                    });
                  },
                )
              ],
            );
          });
    }
  }

// Switch to the next player
  void switchPlayer() {
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }
}
