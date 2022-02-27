import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:sorting/cubit/sorting_cubit_state.dart';
import 'package:sorting/utility/bubble_sort.dart';

class SortingCubit extends Cubit<SortingCubitState> {
  BubbleSort bubbleSort;
  SortingCubit(this.bubbleSort) : super(SortingInitialState(bubbleSort.unsortedList));

  void nextPressed() {
    var value = bubbleSort.bubbleSort(false);
    value.forEach((element) {
      emit(SortingRebuildState(element));
    });
  }

  void restartPressed(){
    bubbleSort = BubbleSort(unsortedList: [5, 8, 11, 8, 3, 1, 10]);
    emit(SortingRebuildState(bubbleSort.unsortedList));
  }

  void previousPressed() {
    if (bubbleSort.swapIndicesStack.length > 0) bubbleSort.runBackward();
    emit(SortingRebuildState(bubbleSort.unsortedList));
  }

  void playPressed() {
    var iterableList = bubbleSort.bubbleSort(true);
    iterableList.forEach((element) {
      emit(SortingRebuildState(element));
      sleep(Duration(seconds: 2));
    });
  }

  void pausedPressed() {
    bubbleSort.isInterrupted = true;
    emit(SortingRebuildState(bubbleSort.unsortedList));
  }
}