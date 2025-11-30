import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MembershipChartPage extends StatelessWidget {
  const MembershipChartPage({super.key});

  List<FlSpot> trimf(double a, double b, double c) {
    return [
      FlSpot(a, 0),
      FlSpot(b, 1),
      FlSpot(c, 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Grafik Keanggotaan Fuzzy"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tekstur"),
              Tab(text: "Aroma"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _grafikTekstur(),
            _grafikAroma(),
          ],
        ),
      ),
    );
  }

  Widget _grafikTekstur() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 1,
          lineBarsData: [
            _line(trimf(0, 1, 3), Colors.red, "Sgt Kasar"),
            _line(trimf(2, 3.5, 5), Colors.orange, "Kasar"),
            _line(trimf(4, 5.5, 7), Colors.yellow, "Sedang"),
            _line(trimf(6, 7.5, 9), Colors.green, "Halus"),
            _line(trimf(8, 9, 10), Colors.blue, "Sgt Halus"),
          ],
        ),
      ),
    );
  }

  Widget _grafikAroma() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 1,
          lineBarsData: [
            _line(trimf(0, 1, 3), const Color.fromARGB(255, 146, 39, 32), "Buruk"),
            _line(trimf(2, 3.5, 5), Colors.orange, "Kurang"),
            _line(trimf(4, 5.5, 7), Colors.yellow, "Cukup"),
            _line(trimf(6, 7.5, 9), Colors.green, "Baik"),
            _line(trimf(8, 9, 10), Colors.blue, "Sgt Baik"),
          ],
        ),
      ),
    );
  }

  LineChartBarData _line(List<FlSpot> spots, Color color, String label) {
    return LineChartBarData(
      spots: spots,
      isCurved: false,
      barWidth: 3,
      color: color,
      dotData: const FlDotData(show: false),
    );
  }
}
