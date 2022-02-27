import 'package:sorting/model/swap_indices.dart';

class BubbleSort {
  late List<int> unsortedList;
  List<SwapIndices> swapIndicesStack = [];
  bool isInterrupted = false;

  BubbleSort({required this.unsortedList});

  Iterable<List<int>> bubbleSort(bool isPlaying) sync* {
    int listLength = unsortedList.length;
    bool swapped = true;
    int i = 0;
    if (isPlaying) isInterrupted = false;
    while (swapped) {
      swapped = false;
      for (int j = 0; j < listLength - i - 1; j ++) {
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
    swapIndicesStack.add(swapIndices);
  }

  runBackward() {
    swapListItem(unsortedList, swapIndicesStack.last);
    swapIndicesStack.removeLast();
  }
}