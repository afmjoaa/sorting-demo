import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sorting/cubit/sorting_cubit_state.dart';
import 'package:sorting/model/swap_indices.dart';
import 'package:sorting/utility/bubble_sort.dart';

import '../sorting_controller.dart';

class SortingCubit extends Cubit<SortingCubitState> {
  BubbleSort bubbleSort;
  final SortingController sortingController;
  late StreamSubscription<List<int>> playSubscription;
  SortingCubit(this.bubbleSort, this.sortingController) : super(SortingInitialState(bubbleSort.unsortedList, SwapIndices(-1,-1)));

  void nextPressed() {
    bubbleSort.runForward();
    // print('${bubbleSort.unsortedList} and ${bubbleSort.j} and ${bubbleSort.i}');
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(bubbleSort.j-1, bubbleSort.j)));
  }

  void restartPressed(){
    bubbleSort = BubbleSort(unsortedList: [5, 8, 11, 8, 3, 1, 10], sortingController: sortingController);
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(-1,-1)));
  }

  void previousPressed() {
    if (bubbleSort.reverseStack.length > 1) bubbleSort.runBackward();
    emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(bubbleSort.j-1, bubbleSort.j)));
  }

  void playPressed() {
    var streamList = bubbleSort.playBubbleSort();
    playSubscription = streamList.listen((event) {
        emit(SortingRebuildState(bubbleSort.unsortedList, SwapIndices(bubbleSort.j-1, bubbleSort.j)));
    });
  }

  void pausedPressed() {
    bubbleSort.pauseBubbleSort();
    playSubscription.cancel();
  }

}