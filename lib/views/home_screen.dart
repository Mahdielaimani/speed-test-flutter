import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../providers/download_speed_provider.dart';
import '../widgets/start_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final internetSpeed = ref.watch(downloadSpeedProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showAxisLine: false,
                ticksPosition: ElementsPosition.outside,
                labelsPosition: ElementsPosition.outside,
                radiusFactor: 0.9,
                canRotateLabels: true,
                showLastLabel: true,
                majorTickStyle: MajorTickStyle(
                  color: Theme.of(context).primaryColor,
                  length: 0.1,
                  lengthUnit: GaugeSizeUnit.factor,
                ),
                minorTickStyle: MinorTickStyle(
                  color: Theme.of(context).primaryColor,
                  length: 0.04,
                  lengthUnit: GaugeSizeUnit.factor,
                ),
                labelFormat: '{value} Mb/s',
                minorTicksPerInterval: 5,
                interval: 10,
                axisLabelStyle:
                    GaugeTextStyle(color: Theme.of(context).primaryColor),
                useRangeColorForAxis: true,
                pointers: <GaugePointer>[
                  NeedlePointer(
                    enableAnimation: true,
                    value: internetSpeed.downloadSpeed,
                    tailStyle: const TailStyle(length: 0.2, width: 5),
                    needleEndWidth: 5,
                    needleLength: 0.7,
                    needleColor: const Color.fromARGB(255, 92, 105, 109),
                    knobStyle: const KnobStyle(
                        color: Color(0xFF289AB1), borderColor: Colors.blue),
                  )
                ],
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 100,
                      startWidth: 0.2,
                      gradient: const SweepGradient(
                          colors: <Color>[Color(0xFF289AB1), Color(0xFF43E695)],
                          stops: <double>[0.25, 0.75]),
                      color: const Color(0xFF289AB1),
                      rangeOffset: 0.08,
                      endWidth: 0.2,
                      sizeUnit: GaugeSizeUnit.factor)
                ],
              ),
            ],
          ),
          Positioned(
            bottom: screenHeight * 0.15,
            child: StartButton(internetSpeed: internetSpeed),
          ),
          Positioned(
            bottom: screenHeight * 0.8,
            left: screenWidth * 0.05,
            child: Row(
              children: [
                const Text(
                  'Progress:',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF289AB1),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '${internetSpeed.testProgress > 100 ? 100 : internetSpeed.testProgress}%',
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFF43E695),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
