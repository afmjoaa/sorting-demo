import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
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
            BarChart(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_counterclockwise,
                    size: 16,
                  ),
                  onPressed: () {},
                  mini: true,
                ),
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_left_circle,
                    size: 16,
                  ),
                  onPressed: () {},
                  mini: true,
                ),
                FloatingActionButton(
                    child: Icon(CupertinoIcons.play_arrow), onPressed: () {}),
                FloatingActionButton(
                  child: Icon(
                    CupertinoIcons.arrow_right_circle,
                    size: 16,
                  ),
                  onPressed: () {},
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}