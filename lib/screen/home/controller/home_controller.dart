import 'dart:math';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxList gridList = ['', '', '', '', '', '', '', '', ''].obs;
  RxList indexList = [].obs;
  RxInt player = 0.obs;
  RxString winner = "".obs;

  void reset() {
    gridList.value = List<String>.filled(9, "", growable: false);
    player.value = 0;
    winner.value = '';
  }

  void checkWinner() async {
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      String first = gridList[winningPos[0]];
      String second = gridList[winningPos[1]];
      String third = gridList[winningPos[2]];

      if (first == second && second == third && first.isNotEmpty) {
        winner.value = first;
        return;
      }
    }
    if (!gridList.contains("")) {
      winner.value = "Draw";
    }
  }

  void botMove() {
    indexList.clear();

    for (int i = 0; i < gridList.length; i++) {
      if (gridList[i] == "") {
        indexList.add(i);
      }
    }
    if (indexList.isNotEmpty) {
      int randomIndex = Random().nextInt(indexList.length);
      gridList[indexList[randomIndex]] = "O";
    }

  }

  void checkBotMove() {
    print("Ai is Play ");
    //012
    if (gridList[1].contains("X") &&
        gridList[2].contains("X") &&
        gridList[0] == "") {
      gridList[0] = "O";

    } else if (gridList[0].contains("X") &&
        gridList[2].contains("X") &&
        gridList[1] == "") {
      gridList[1] = "O";
    } else if (gridList[0].contains("X") &&
        gridList[1].contains("X") &&
        gridList[2] == "") {
      gridList[2] = "O";
    }
    //345
    else if (gridList[4].contains("X") &&
        gridList[5].contains("X") &&
        gridList[3] == "") {
      gridList[3] = "O";
    } else if (gridList[3].contains("X") &&
        gridList[5].contains("X") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[3].contains("X") &&
        gridList[4].contains("X") &&
        gridList[5] == "") {
      gridList[5] = "O";
    }
    //678
    else if (gridList[7].contains("X") &&
        gridList[8].contains("X") &&
        gridList[6] == "") {
      gridList[6] = "O";
    } else if (gridList[6].contains("X") &&
        gridList[8].contains("X") &&
        gridList[7] == "") {
      gridList[7] = "O";
    } else if (gridList[6].contains("X") &&
        gridList[7].contains("X") &&
        gridList[8] == "") {
      gridList[8] = "O";
    }
    //036
    else if (gridList[3].contains("X") &&
        gridList[6].contains("X") &&
        gridList[0] == "") {
      gridList[0] = "O";
    } else if (gridList[0].contains("X") &&
        gridList[6].contains("X") &&
        gridList[3] == "") {
      gridList[3] = "O";
    } else if (gridList[0].contains("X") &&
        gridList[3].contains("X") &&
        gridList[6] == "") {
      gridList[6] = "O";
    }
    //147
    else if (gridList[4].contains("X") &&
        gridList[7].contains("X") &&
        gridList[1] == "") {
      gridList[1] = "O";
    } else if (gridList[1].contains("X") &&
        gridList[7].contains("X") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[1].contains("X") &&
        gridList[4].contains("X") &&
        gridList[7] == "") {
      gridList[7] = "O";
    }
    //258
    else if (gridList[5].contains("X") &&
        gridList[8].contains("X") &&
        gridList[2] == "") {
      gridList[2] = "O";
    } else if (gridList[2].contains("X") &&
        gridList[8].contains("X") &&
        gridList[5] == "") {
      gridList[5] = "O";
    } else if (gridList[2].contains("X") &&
        gridList[5].contains("X") &&
        gridList[8] == "") {
      gridList[8] = "O";
    } //048
    else if (gridList[4].contains("X") &&
        gridList[8].contains("X") &&
        gridList[0] == "") {
      gridList[0] = "O";
    } else if (gridList[0].contains("X") &&
        gridList[8].contains("X") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[0].contains("X") &&
        gridList[4].contains("X") &&
        gridList[8] == "") {
      gridList[8] = "O";
    }
    //246
    else if (gridList[4].contains("X") &&
        gridList[6].contains("X") &&
        gridList[2] == "") {
      gridList[2] = "O";
    } else if (gridList[2].contains("X") &&
        gridList[6].contains("X") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[2].contains("X") &&
        gridList[4].contains("X") &&
        gridList[6] == "") {
      gridList[6] = "O";
    } else {
      botMove();
    }
  }

  void checkBotWin() {
    print("Ai is Play ");
    //012
    if (gridList[1].contains("O") &&
        gridList[2].contains("O") &&
        gridList[0] == "") {
      gridList[0] = "O";
      
    } else if (gridList[0].contains("O") &&
        gridList[2].contains("O") &&
        gridList[1] == "") {
      gridList[1] = "O";
    } else if (gridList[0].contains("O") &&
        gridList[1].contains("O") &&
        gridList[2] == "") {
      gridList[2] = "O";
    }
    //345
    else if (gridList[4].contains("O") &&
        gridList[5].contains("O") &&
        gridList[3] == "") {
      gridList[3] = "O";
    } else if (gridList[3].contains("O") &&
        gridList[5].contains("O") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[3].contains("O") &&
        gridList[4].contains("O") &&
        gridList[5] == "") {
      gridList[5] = "O";
    }
    //678
    else if (gridList[7].contains("O") &&
        gridList[8].contains("O") &&
        gridList[6] == "") {
      gridList[6] = "O";
    } else if (gridList[6].contains("O") &&
        gridList[8].contains("O") &&
        gridList[7] == "") {
      gridList[7] = "O";
    } else if (gridList[6].contains("O") &&
        gridList[7].contains("O") &&
        gridList[8] == "") {
      gridList[8] = "O";
    }
    //036
    else if (gridList[3].contains("O") &&
        gridList[6].contains("O") &&
        gridList[0] == "") {
      gridList[0] = "O";
    } else if (gridList[0].contains("O") &&
        gridList[6].contains("O") &&
        gridList[3] == "") {
      gridList[3] = "O";
    } else if (gridList[0].contains("O") &&
        gridList[3].contains("O") &&
        gridList[6] == "") {
      gridList[6] = "O";
    }
    //147
    else if (gridList[4].contains("O") &&
        gridList[7].contains("O") &&
        gridList[1] == "") {
      gridList[1] = "O";
    } else if (gridList[1].contains("O") &&
        gridList[7].contains("O") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[1].contains("O") &&
        gridList[4].contains("O") &&
        gridList[7] == "") {
      gridList[7] = "O";
    }
    //258
    else if (gridList[5].contains("O") &&
        gridList[8].contains("O") &&
        gridList[2] == "") {
      gridList[2] = "O";
    } else if (gridList[2].contains("O") &&
        gridList[8].contains("O") &&
        gridList[5] == "") {
      gridList[5] = "O";
    } else if (gridList[2].contains("O") &&
        gridList[5].contains("O") &&
        gridList[8] == "") {
      gridList[8] = "O";
    } //048
    else if (gridList[4].contains("O") &&
        gridList[8].contains("O") &&
        gridList[0] == "") {
      gridList[0] = "O";
    } else if (gridList[0].contains("O") &&
        gridList[8].contains("O") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[0].contains("O") &&
        gridList[4].contains("O") &&
        gridList[8] == "") {
      gridList[8] = "O";
    }
    //246
    else if (gridList[4].contains("O") &&
        gridList[6].contains("O") &&
        gridList[2] == "") {
      gridList[2] = "O";
    } else if (gridList[2].contains("O") &&
        gridList[6].contains("O") &&
        gridList[4] == "") {
      gridList[4] = "O";
    } else if (gridList[2].contains("O") &&
        gridList[4].contains("O") &&
        gridList[6] == "") {
      gridList[6] = "O";
    } else {
      checkBotMove();
    }
    checkWinner();
  }
}