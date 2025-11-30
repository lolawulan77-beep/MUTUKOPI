import 'package:flutter/material.dart';
import '../models/sample_input.dart';
import '../controllers/fuzzy_controller.dart';
import 'result_page.dart';
import '../widgets/custom_slider.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double bentuk = 5, ukuran = 5, partikel = 5, warna = 5, fragrance = 5, aroma = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Data Sampel Kopi")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomSlider(label: "Bentuk Biji", value: bentuk, onChanged: (v) => setState(() => bentuk = v)),
            CustomSlider(label: "Ukuran Biji", value: ukuran, onChanged: (v) => setState(() => ukuran = v)),
            CustomSlider(label: "Ukuran Partikel", value: partikel, onChanged: (v) => setState(() => partikel = v)),
            CustomSlider(label: "Warna Partikel", value: warna, onChanged: (v) => setState(() => warna = v)),
            CustomSlider(label: "Fragrance", value: fragrance, onChanged: (v) => setState(() => fragrance = v)),
            CustomSlider(label: "Aroma Seduhan", value: aroma, onChanged: (v) => setState(() => aroma = v)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: () {
                SampleInput input = SampleInput(
                  bentukBiji: bentuk,
                  ukuranBiji: ukuran,
                  ukuranPartikel: partikel,
                  warnaPartikel: warna,
                  fragrance: fragrance,
                  aromaSeduhan: aroma,
                );

                var fuzzy = FuzzyController().prosesFuzzy(input);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      crisp: fuzzy["crisp"],
                      kategori: fuzzy["kategori"],
                      output: fuzzy["output"],
                      firing: fuzzy["firing"],
                    ),
                  ),
                );
              },
              child: const Text("Proses Fuzzy", style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
