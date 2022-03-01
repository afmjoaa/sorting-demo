import 'package:equatable/equatable.dart';
import 'package:sorting/model/swap_indices.dart';

abstract class SortingCubitState extends Equatable {}

class SortingInitialState extends SortingCubitState {
  final List<int> unsortedList;
  final SwapIndices swapIndices;

  SortingInitialState(this.unsortedList, this.swapIndices);

  @override
  List<Object?> get props => [this.unsortedList];

  @override
  String toString() => 'StoryContentInitialState{}';
}

class SortingRebuildState extends SortingCubitState {
  final List<int> unsortedList;
  final SwapIndices swapIndices;

  SortingRebuildState(this.unsortedList, this.swapIndices);

  @override
  List<Object?> get props => [DateTime.now(), this.unsortedList];

  @override
  String toString() => 'ShowStoryContentState{}';
}