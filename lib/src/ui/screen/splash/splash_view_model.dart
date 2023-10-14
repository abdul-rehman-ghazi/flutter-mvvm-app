import 'dart:async';

import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  late final Timer _timer;

  Future<void> onViewModelReady() async {
    // can check for force update here
    _timer = Timer(const Duration(seconds: 2), () {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
