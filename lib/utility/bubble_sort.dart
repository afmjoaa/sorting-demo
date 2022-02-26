import 'package:sorting/model/swap_indices.dart';

class BubbleSort {
  late List<int> unsortedList;

  BubbleSort({required this.unsortedList});

  List<int> bubbleSort(){
    int listLength = unsortedList.length;
    bool swapped = true;
    int i = 0;
    while(swapped) {
      swapped = false;
      for(int j = 0; j < listLength - i - 1; j ++){
        if(unsortedList[j] > unsortedList[j+1]){
          swapped = true;
          swapListItem(unsortedList, SwapIndices(j, j+1));
        }
      }
      i +=1;
    }
    return unsortedList;
  }

  swapListItem(List<int> lst, SwapIndices swapIndices){
    var temp;
    temp=lst[swapIndices.firstIndex];
    lst[swapIndices.firstIndex]=lst[swapIndices.secondIndex];
    lst[swapIndices.secondIndex]=temp;
  }
}