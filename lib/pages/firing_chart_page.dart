import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FiringChartPage extends StatelessWidget {
  final List<double> firing;

  const FiringChartPage({super.key, required this.firing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grafik Firing Strength Rule")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BarChart(
          BarChartData(
            minY: 0,
            maxY: 1,

            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),

            barGroups: List.generate(firing.length, (i) {
              return BarChartGroupData(
                x: i + 1,
                barRods: [
                  BarChartRodData(
                    toY: firing[i],
                    color: Colors.green,
                    width: 12,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
