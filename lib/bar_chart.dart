import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting/utility/bubble_sort.dart';
import 'package:stacked_chart/stacked_chart.dart';

import 'bar_chart_data.dart';

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  BubbleSort bubbleSort = BubbleSort(unsortedList: [5, 8, 11, 8, 3, 1, 10]);
  List<IndexStatus> indexStatusList = [];

  @override
  void initState() {
    createIndexStatusFromArray();
    super.initState();
  }

  void createIndexStatusFromArray() {
    indexStatusList.clear();
    final List<IndexStatus> newIndexStatusList = [];
    bubbleSort.bubbleSort();
    bubbleSort.unsortedList.asMap().forEach(
      (index, value) {
        newIndexStatusList.add(
          IndexStatus(
              value: value,
              index: index,
              isChanged: value > 10 ? true : false,
              onPressed: createIndexStatusFromArray
          ),
        );
      },
    );
    setState(
      () {
        indexStatusList = newIndexStatusList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedChart(
      data: indexStatusList,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      size: Size(MediaQuery.of(context).size.width - 30, 150),
      showLabel: true,
      enableShadow: false,
    );
  }
}