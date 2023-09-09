import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:realm/app_bar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  static const name = "Heat Map";
  static const color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: buildPageAppBar(name, color, context),
      body: Column(
        children: [
          HeatMap(
            startDate: DateTime(2023, 7, 2),
            endDate: DateTime(2023, 7, 30),
            size: 20,
            // fontSize: 16,
            showColorTip: false,
            scrollable: true,
            datasets: {
              DateTime(2023, 7, 2): 23,
              DateTime(2023, 7, 17): 7,
              DateTime(2023, 7, 28): 10,
              DateTime(2023, 7, 9): 13,
              DateTime(2023, 7, 13): 6,
            },
            colorsets: {
              1: Colors.green.shade500,
            },
          ),
          const SizedBox(height: 20),
          HeatMapCalendar(
            flexible: true, //auto adjust according to display size.
            margin: const EdgeInsets.all(3), //margin between small boxes.
            fontSize: 12, //data size.
            monthFontSize: 18,
            weekTextColor: Colors.green,
            showColorTip: false,
            datasets: {
              DateTime(2023, 7, 3): 5,
              DateTime(2023, 7, 13): 14,
              DateTime(2023, 7, 23): 11,
              DateTime(2023, 7, 5): 2,
              DateTime(2023, 7, 15): 7,
              DateTime(2023, 7, 12): 4,
              DateTime(2023, 7, 8): 13,
              DateTime(2023, 7, 29): 20,
            },
            colorsets: const {
              1: Colors.green,
            },
          ),
        ],
      ),
    );
  }
}
