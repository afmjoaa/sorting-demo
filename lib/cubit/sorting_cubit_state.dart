import 'package:equatable/equatable.dart';

abstract class SortingCubitState extends Equatable {}

class SortingInitialState extends SortingCubitState {
  final List<int> unsortedList;

  SortingInitialState(this.unsortedList);

  @override
  List<Object?> get props => [this.unsortedList];

  @override
  String toString() => 'StoryContentInitialState{}';
}

class SortingRebuildState extends SortingCubitState {
  final List<int> unsortedList;

  SortingRebuildState(this.unsortedList);

  @override
  List<Object?> get props => [DateTime.now(), this.unsortedList];

  @override
  String toString() => 'ShowStoryContentState{}';
}