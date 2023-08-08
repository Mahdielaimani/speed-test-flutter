import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speedtest/flutter_speedtest.dart';

final downloadSpeedProvider =
    ChangeNotifierProvider<DownloadSpeedNotifier>((ref) {
  return DownloadSpeedNotifier();
});

class DownloadSpeedNotifier extends ChangeNotifier {
  double _downloadSpeed = 0;
  int _testProgress = 0;
  String _buttonText = 'Start';

  double get downloadSpeed => _downloadSpeed;
  int get testProgress => _testProgress;
  String get buttonText => _buttonText;

  //Setup speedtest
  final _speedtest = FlutterSpeedtest(
    baseUrl: 'http://speedtest.jaosing.com:8080',
    pathDownload: '/download',
    pathUpload: '/upload',
    pathResponseTime: '/ping',
  );

  void startTest() async {
    _buttonText = 'Testing...';
    notifyListeners();
  }

  Future<void> getDownSpeed() async {
    await _speedtest.getDataspeedtest(
      downloadOnProgress: ((percent, transferRate) {
        _downloadSpeed = percent;
        notifyListeners();
      }),
      uploadOnProgress: ((p, tr) {}),
      progressResponse: ((r, j) {
        _testProgress = r;
        notifyListeners();
      }),
      onError: ((e) {}),
    );
  }
}
