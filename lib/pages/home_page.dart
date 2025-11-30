import 'package:flutter/material.dart';
import 'input_page.dart';
import 'membership_chart_page.dart';
import 'defuzz_chart_page.dart';
import 'firing_chart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Mutu Kopi Fuzzy")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _menuButton(
                context, "Input Data Sampel", const InputPage()),
            _menuButton(
                context, "Grafik Keanggotaan", const MembershipChartPage()),
            _menuButton(
                context, "Grafik Defuzzifikasi", 
                DefuzzChartPage(output: const {}, crispValue: 0)),
            _menuButton(
                context, "Grafik Firing Strength", 
                const FiringChartPage(firing: [])),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String title, Widget page) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
