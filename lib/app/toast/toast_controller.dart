import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToastMessage {
  const ToastMessage(this.id, this.text);

  final int id;
  final String text;
}

/// One toast at a time, dismissed after 2.6s or by the OK button.
class ToastController extends Notifier<ToastMessage?> {
  Timer? _timer;
  int _seq = 0;

  @override
  ToastMessage? build() {
    ref.onDispose(() => _timer?.cancel());
    return null;
  }

  void show(String text) {
    _timer?.cancel();
    state = ToastMessage(++_seq, text);
    _timer = Timer(const Duration(milliseconds: 2600), hide);
  }

  void hide() {
    _timer?.cancel();
    state = null;
  }
}

final toastProvider = NotifierProvider<ToastController, ToastMessage?>(ToastController.new);
