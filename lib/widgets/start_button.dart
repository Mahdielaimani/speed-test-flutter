import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../providers/download_speed_provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
    required this.internetSpeed,
  }) : super(key: key);

  final DownloadSpeedNotifier internetSpeed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        internetSpeed.getDownSpeed();
        internetSpeed.startTest();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset('assets/anime.json'),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  colors: [Colors.grey, Colors.black], radius: 0.75),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  internetSpeed.buttonText,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
