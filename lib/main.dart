import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorting/sorting_controller.dart';

import 'bar_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final SortingController _sortingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stacked Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BarChart(sortingController: _sortingController,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_counterclockwise,
                    size: 16,
                  ),
                  onPressed: () => _sortingController.restart(),
                  mini: true,
                ),
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_left_circle,
                    size: 16,
                  ),
                  onPressed: () => _sortingController.previous(),
                  mini: true,
                ),
                FloatingActionButton(
                  child: Icon(
                      _sortingController.currentState == PlaybackState.play
                          ? CupertinoIcons.pause
                          : CupertinoIcons.play_arrow),
                  onPressed: () =>
                      _sortingController.currentState == PlaybackState.play
                          ? _sortingController.pause()
                          : _sortingController.play(),
                ),
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_right_circle,
                    size: 16,
                  ),
                  onPressed: () => _sortingController.next(),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _sortingController = SortingController();
  }
}