import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sorting/cubit/sorting_cubit_state.dart';
import 'package:sorting/model/swap_indices.dart';
import 'package:sorting/sorting_controller.dart';
import 'package:sorting/utility/bubble_sort.dart';
import 'package:stacked_chart/stacked_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_chart_data.dart';
import 'cubit/sorting_cubit.dart';

class BarChart extends StatefulWidget {
  final SortingController sortingController;

  const BarChart({Key? key, required this.sortingController}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<IndexStatus> indexStatusList = [];
  late StreamSubscription<PlaybackState> _playbackSubscription;
  late SortingCubit _sortingCubit;

  @override
  void initState() {
    super.initState();
    BubbleSort bubbleSort = BubbleSort(unsortedList: [5, 8, 11, 8, 3, 1, 10], sortingController: widget.sortingController);
    _sortingControllerStateChange();
    _sortingCubit = SortingCubit(bubbleSort, widget.sortingController);
  }

  @override
  void dispose() {
    _playbackSubscription.cancel();
    _sortingCubit.close();
    super.dispose();
  }

  void _sortingControllerStateChange() {
    _playbackSubscription =
        widget.sortingController.playbackNotifier.listen((state) {
          switch (state) {
            case PlaybackState.play:
              _sortingCubit.playPressed();
              break;
            case PlaybackState.pause:
              _sortingCubit.pausedPressed();
              break;
            case PlaybackState.next:
              _sortingCubit.nextPressed();
              break;
            case PlaybackState.previous:
              _sortingCubit.previousPressed();
              break;
            case PlaybackState.restart:
              _sortingCubit.restartPressed();
              break;
          }
        });
  }

  List<IndexStatus> createIndexStatusFromArray(List<int> unsortedList, SwapIndices swapIndices) {
    final List<IndexStatus> newIndexStatusList = [];
    unsortedList.asMap().forEach(
      (index, value) {
        newIndexStatusList.add(
          IndexStatus(
              value: value,
              index: index,
              isChanged: (index == swapIndices.firstIndex || index == swapIndices.secondIndex) ? true : false,
          ),
        );
      },
    );
    return newIndexStatusList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingCubit, SortingCubitState>(
      bloc: _sortingCubit,
      builder: (BuildContext context, SortingCubitState state) {
        if (state is SortingInitialState){
          return _chartBody(createIndexStatusFromArray(state.unsortedList, state.swapIndices), context);
        } else if (state is SortingRebuildState) {
          return _chartBody(createIndexStatusFromArray(state.unsortedList, state.swapIndices), context);
        } else {
          return Container();
        }
      },
    );
  }

  StackedChart _chartBody(List<IndexStatus> data, BuildContext context) {
    return StackedChart(
      data: data,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      size: Size(MediaQuery.of(context).size.width - 30, 150),
      showLabel: true,
      enableShadow: false,
    );
  }
}