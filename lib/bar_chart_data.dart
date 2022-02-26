import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked_chart/stacked_chart.dart';

class IndexStatus extends ChartData<LabelData, int>
    implements Comparable<IndexStatus> {
  final int value;
  final int index;
  final bool isChanged;
  final Map<String, int> bookings;
  final VoidCallback? onPressed;

  IndexStatus({
        required this.value,
        required this.index,
        required this.isChanged,
        this.bookings = const {},
        this.onPressed
      }) : super(
          labelWithValue: convertSortingStatusToMapOfLabelDataInt(value, isChanged),
          barLabel: value.toString(),
          onPressed: onPressed,
          //barBackGroundColor: Colors.transparent
        );

  static Map<LabelData, int> convertSortingStatusToMapOfLabelDataInt(int value, bool isChanged) {
    final Map<LabelData, int> convertedData = {
      LabelData('unchanged_value'): isChanged ? 0 : value,
      LabelData('changed_value'): isChanged ? value : 0,
    };
    return convertedData;
  }

  @override
  int compareTo(IndexStatus other) => value.compareTo(other.value);
}