import 'package:sorting/model/reverse_model.dart';
import 'package:sorting/model/swap_indices.dart';

class BubbleSort {
  late List<int> unsortedList;
  late List<int> previousUnsortedList;
  List<ReverseModel> reverseStack = [];
  bool isInterrupted = false;
  int i = 0;
  int j = 0;

  BubbleSort({required this.unsortedList}): previousUnsortedList = [...unsortedList];

  Iterable<List<int>> bubbleSort(bool isPlaying) sync* {
    int listLength = unsortedList.length;
    bool swapped = true;
    if (isPlaying) isInterrupted = false;
    while (swapped) {
      swapped = false;
      for (j = 0; j < listLength - i - 1; j ++) {
        if (unsortedList[j] > unsortedList[j + 1]) {
          swapped = true;
          swapListItem(unsortedList, SwapIndices(j, j + 1));
          yield unsortedList;
          if (isInterrupted || !isPlaying) break;
        }
      }
      i += 1;
    }
    yield unsortedList;
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
        i = listLength - 1;
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

    reverseStack.add(
      ReverseModel(
          i,
          j,
          null,
          [...unsortedList]));
    return unsortedList;
  }

  runBackward() {
    reverseStack.removeLast();
    unsortedList = [...reverseStack.last.unsortedArray];
    i = reverseStack.last.i;
    j = reverseStack.last.j!;
    print('$i and $j and ${unsortedList}');
    return unsortedList;
  }

  bool areListsEqual(var list1, var list2) {
    // check if elements are equal
    for(int i=0;i<list1.length;i++) {
      if(list1[i]!=list2[i]) {
        return false;
      }
    }
    return true;
  }
}