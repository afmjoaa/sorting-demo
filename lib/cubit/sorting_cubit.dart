import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:sorting/cubit/sorting_cubit_state.dart';
import 'package:sorting/model/swap_indices.dart';
import 'package:sorting/utility/bubble_sort.dart';

class SortingCubit extends Cubit<SortingCubitState> {
  BubbleSort bubbleSort;
  SortingCubit(this.bubbleSort) : super(SortingInitialState(bubbleSort.unsortedList, SwapIndices(-1,-1)));

  void nextPressed() {
    bubbleSort.runForward();
    print('${bubbleSort.unsortedList} and ${bubbleSort.j} and ${bubbleSort.i}');
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(bubbleSort.j-1, bubbleSort.j)));
  }

  void restartPressed(){
    bubbleSort = BubbleSort(unsortedList: [5, 8, 11, 8, 3, 1, 10]);
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(-1,-1)));
  }

  void previousPressed() {
    if (bubbleSort.reverseStack.length > 1) bubbleSort.runBackward();
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(bubbleSort.j-1, bubbleSort.j)));
  }

  void playPressed() {
    // var iterableList = bubbleSort.bubbleSort(true);
    // iterableList.forEach((element) {
    //   emit(SortingRebuildState(element));
    //   sleep(Duration(seconds: 2));
    // });
  }

  void pausedPressed() {
    // bubbleSort.isInterrupted = true;
    // emit(SortingRebuildState(bubbleSort.unsortedList));
  }
}