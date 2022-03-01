import 'package:sorting/model/reverse_model.dart';
import 'package:sorting/model/swap_indices.dart';

import '../sorting_controller.dart';

class BubbleSort {
  late List<int> unsortedList;
  late List<int> previousUnsortedList;
  final SortingController sortingController;
  List<ReverseModel> reverseStack = [];
  bool isInterrupted = false;
  int i = 0;
  int j = 0;

  BubbleSort({required this.unsortedList, required this.sortingController}): previousUnsortedList = [...unsortedList];

  Stream<List<int>> playBubbleSort() async* {
    List<int> sortedList = [...unsortedList];
    sortedList.sort();
    isInterrupted = false;

    while (!isInterrupted) {
      if (areListsEqual(unsortedList, sortedList)){
        sortingController.pause();
        break;
      }
      yield await returnCurrentListWithDelay();
    }
  }

  void pauseBubbleSort() {
    isInterrupted = true;
    print('pause');
  }

  Future<List<int>> returnCurrentListWithDelay() {
    return Future.delayed(Duration(seconds: 1), (){
      runForward();
      return unsortedList;
    });
  }

  swapListItem(List<int> lst, SwapIndices swapIndices) {
    var temp;
    temp = lst[swapIndices.firstIndex];
    lst[swapIndices.firstIndex] = lst[swapIndices.secondIndex];
    lst[swapIndices.secondIndex] = temp;
  }

  runForward() {
    int listLength = unsortedList.length;
    while (i < listLength) {
      while (j < listLength - i - 1) {
        if (unsortedList[j] > unsortedList[j + 1]) {
          swapListItem(unsortedList, SwapIndices(j, j + 1));
        }
        j += 1;
        reverseStack.add(
          ReverseModel(
              i,
              j,
              null,
              [...unsortedList]),
        );
        return unsortedList;
      }
      i += 1;
      j = 0;
      if (areListsEqual(unsortedList, previousUnsortedList)) {
        i = listLength;
        reverseStack.add(
            ReverseModel(
                i,
                j,
                null,
                [...unsortedList],
                ));
        return unsortedList;
      }
      previousUnsortedList = [...unsortedList];
    }

    return unsortedList;
  }

  runBackward() {
    reverseStack.removeLast();
    unsortedList = [...reverseStack.last.unsortedArray];
    i = reverseStack.last.i;
    j = reverseStack.last.j!;
    // print('$i and $j and ${unsortedList}');
    return unsortedList;
  }

  bool areListsEqual(var list1, var list2) {
    for(int i=0;i<list1.length;i++) {
      if(list1[i]!=list2[i]) {
        return false;
      }
    }
    return true;
  }
}