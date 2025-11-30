import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DefuzzChartPage extends StatelessWidget {
  final Map<int, double> output;
  final double crispValue;

  const DefuzzChartPage({
    super.key,
    required this.output,
    required this.crispValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grafik Defuzzifikasi (Centroid)")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Nilai Crisp: ${crispValue.toStringAsFixed(3)}",
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 15),
            Expanded(
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 1,

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true)),
                  ),

                  barGroups: output.entries.map((e) {
                    return BarChartGroupData(
                      x: e.key,
                      barRods: [
                        BarChartRodData(
                          toY: e.value,
                          width: 30,
                          color: Colors.blue,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
