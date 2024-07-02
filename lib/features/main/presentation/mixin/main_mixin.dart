import 'dart:async';

mixin MainMixin {
  late StreamController streamController;
  late Timer timer;

  void initController() {
    streamController = StreamController();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      streamController.add(timer.tick);
    });
  }

  void disposeController() {
    timer.cancel();
    streamController.close();
  }
}
