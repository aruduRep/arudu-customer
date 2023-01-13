import 'package:flutter/material.dart';

void main() => runApp(Muehle());

class Muehle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MuehlePage(),
    );
  }
}

class MuehlePage extends StatefulWidget {
  @override
  _MuehlePageState createState() => _MuehlePageState();
}

class _MuehlePageState extends State<MuehlePage> {
  // Variables for the game
  late List<String> board;
  late String currentPlayer;
  late String message;

  @override
  void initState() {
    super.initState();
    board = List.filled(24, '');
    currentPlayer = 'X';
    message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mühle'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width /
                    3, // one third of the screen width
                childAspectRatio: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 24,
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
          ElevatedButton(
            child: Text('New Game'),
            onPressed: () {
              setState(() {
                board = List.filled(24, '');
                currentPlayer = 'X';
                message = '';
              });
            },
          )
        ],
      ),
    );
  }

  // Check if the game is won
  void checkForWin() {
    // check rows
    if (board[0] == currentPlayer &&
        board[1] == currentPlayer &&
        board[2] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    } else if (board[3] == currentPlayer &&
        board[4] == currentPlayer &&
        board[5] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    } else if (board[6] == currentPlayer &&
        board[7] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    }
    // check diagonals
    else if (board[0] == currentPlayer &&
        board[4] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    } else if (board[2] == currentPlayer &&
        board[4] == currentPlayer &&
        board[6] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    }
    // check columns
    else if (board[0] == currentPlayer &&
        board[3] == currentPlayer &&
        board[6] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    } else if (board[1] == currentPlayer &&
        board[4] == currentPlayer &&
        board[7] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    } else if (board[2] == currentPlayer &&
        board[5] == currentPlayer &&
        board[8] == currentPlayer) {
      message = 'Player $currentPlayer wins!';
    }
    if (message != '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Winner'),
              content: Text('Player $currentPlayer wins!'),
              actions: <Widget>[
                TextButton(
                  child: Text('New Game'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      board = List.filled(24, '');
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

  // Switch the current player
  void switchPlayer() {
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }
}
