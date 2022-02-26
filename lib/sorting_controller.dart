import 'package:rxdart/rxdart.dart';

enum PlaybackState { pause, play, next, previous, restart }

class SortingController {
  final playbackNotifier = BehaviorSubject<PlaybackState>();

  void pause() {
    playbackNotifier.add(PlaybackState.pause);
  }

  void play() {
    playbackNotifier.add(PlaybackState.play);
  }

  void next() {
    playbackNotifier.add(PlaybackState.next);
  }

  void previous() {
    playbackNotifier.add(PlaybackState.previous);
  }

  void restart() {
    playbackNotifier.add(PlaybackState.restart);
  }

  void dispose() {
    playbackNotifier.close();
  }
}
