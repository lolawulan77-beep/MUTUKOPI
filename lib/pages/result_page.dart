import 'package:flutter/material.dart';
import 'membership_chart_page.dart';
import 'defuzz_chart_page.dart';
import 'firing_chart_page.dart';

class ResultPage extends StatelessWidget {
  final double crisp;
  final int kategori;
  final Map<int, double> output;
  final List<double> firing;

  const ResultPage({
    super.key,
    required this.crisp,
    required this.kategori,
    required this.output,
    required this.firing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Perhitungan Fuzzy")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Nilai Crisp: ${crisp.toStringAsFixed(3)}",
                style: const TextStyle(fontSize: 22)),
            Text("Kategori Mutu: $kategori",
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MembershipChartPage()));
              },
              child: const Text("Grafik Keanggotaan"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        DefuzzChartPage(output: output, crispValue: crisp),
                  ),
                );
              },
              child: const Text("Grafik Defuzzifikasi"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FiringChartPage(firing: firing),
                  ),
                );
              },
              child: const Text("Grafik Firing Strength"),
            ),
          ],
        ),
      ),
    );
  }
}
