import 'package:coherent_chaos/Assets/custom_colors.dart';
import 'package:coherent_chaos/Business/handleApiCalls.dart';
import 'package:coherent_chaos/Controllers/game_cell.dart';
import 'package:coherent_chaos/Model/game.dart';
import 'package:coherent_chaos/Presentations/start_page.dart';
import 'package:flutter/material.dart';

CustomColors colors = new CustomColors();
HandleAPIs handleAPIs = new HandleAPIs();

GameCell c1 =
    GameCell(cellColor: colors.c1Color, borderColor: colors.c1BorderColor);
GameCell c2 =
    GameCell(cellColor: colors.c2Color, borderColor: colors.c2BorderColor);
GameCell ce =
    GameCell(cellColor: colors.ceColor, borderColor: colors.ceBorderColor);

class GamePage extends StatelessWidget {
  static String tag = 'game-page';
  final Game game;

  GamePage({Key key, @required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StartPage(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: colors.bodyColor,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: getGamePage(context),
          ),
        ),
      ),
    );
  }

  List<Widget> getGamePage(BuildContext context) {
    List<Widget> gamePage = getBoardRows(context);
    gamePage.add(Positioned(
      top: MediaQuery.of(context).size.height * 0.06,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Text('Game ID: ' + game.gameId,
          style: Theme.of(context).textTheme.title),
    ));

    return gamePage;
  }

  List<Widget> getBoardRows(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    List<List<GameCell>> gameCells = new List();
    List<Widget> boardRows = new List();
    final double rowDist = 29.5;

    if (game != null) {
      for (var row in game.board) {
        List<GameCell> newRow = new List<GameCell>();
        for (var col in row) {
          if (col == 1) {
            newRow.add(c1);
          } else if (col == 2) {
            newRow.add(c2);
          } else {
            newRow.add(ce);
          }
        }
        gameCells.add(newRow);
      }
    }

    for (int i = 0; i < gameCells.length; i++) {
      boardRows.add(
        Positioned(
          top: (screenHeight - rowDist * gameCells.length) / 2.0 + rowDist * i,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: gameCells[i],
          ),
        ),
      );
    }
    return boardRows;
  }
}
