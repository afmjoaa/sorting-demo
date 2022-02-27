import 'package:rxdart/rxdart.dart';

enum PlaybackState { pause, play, next, previous, restart }

class SortingController {
  final playbackNotifier = BehaviorSubject<PlaybackState>();
  PlaybackState currentState = PlaybackState.pause;

  void pause() {
    currentState = PlaybackState.pause;
    playbackNotifier.add(PlaybackState.pause);
  }

  void play() {
    currentState = PlaybackState.play;
    playbackNotifier.add(PlaybackState.play);
  }

  void next() {
    currentState = PlaybackState.next;
    playbackNotifier.add(PlaybackState.next);
  }

  void previous() {
    currentState = PlaybackState.previous;
    playbackNotifier.add(PlaybackState.previous);
  }

  void restart() {
    currentState = PlaybackState.restart;
    playbackNotifier.add(PlaybackState.restart);
  }

  void dispose() {
    playbackNotifier.close();
  }
}
