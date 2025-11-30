import 'dart:math';
import '../models/sample_input.dart';

class FuzzyController {
  double trimf(double x, double a, double b, double c) {
    if (x <= a || x >= c) return 0;
    if (x == b) return 1;
    if (x > a && x < b) return (x - a) / (b - a);
    return (c - x) / (c - b);
  }

  Map<String, double> fuzzifikasiTekstur(double x) {
    return {
      "sangat_kasar": trimf(x, 0, 1, 3),
      "kasar": trimf(x, 2, 3.5, 5),
      "sedang": trimf(x, 4, 5.5, 7),
      "halus": trimf(x, 6, 7.5, 9),
      "sangat_halus": trimf(x, 8, 9, 10),
    };
  }

  Map<String, double> fuzzifikasiAroma(double x) {
    return {
      "buruk": trimf(x, 0, 1, 3),
      "kurang": trimf(x, 2, 3.5, 5),
      "cukup": trimf(x, 4, 5.5, 7),
      "baik": trimf(x, 6, 7.5, 9),
      "sangat_baik": trimf(x, 8, 9, 10),
    };
  }

  int ruleOutput(String tekstur, String aroma) {
    const rules = {
      "sangat_kasar": {
        "buruk": 1,
        "kurang": 1,
        "cukup": 2,
        "baik": 2,
        "sangat_baik": 3
      },
      "kasar": {
        "buruk": 1,
        "kurang": 2,
        "cukup": 2,
        "baik": 3,
        "sangat_baik": 3
      },
      "sedang": {
        "buruk": 2,
        "kurang": 2,
        "cukup": 3,
        "baik": 3,
        "sangat_baik": 4
      },
      "halus": {
        "buruk": 3,
        "kurang": 3,
        "cukup": 3,
        "baik": 4,
        "sangat_baik": 5
      },
      "sangat_halus": {
        "buruk": 3,
        "kurang": 4,
        "cukup": 4,
        "baik": 5,
        "sangat_baik": 5
      }
    };

    return rules[tekstur]![aroma]!;
  }

  Map<String, dynamic> prosesFuzzy(SampleInput data) {
    double tekstur = (data.bentukBiji + data.ukuranPartikel) / 2;
    double aroma = (data.fragrance + data.aromaSeduhan) / 2;

    var t = fuzzifikasiTekstur(tekstur);
    var a = fuzzifikasiAroma(aroma);

    Map<int, double> out = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    List<double> firing = [];

    for (var tk in t.keys) {
      for (var ar in a.keys) {
        double alpha = min(t[tk]!, a[ar]!);
        firing.add(alpha);
        int mutu = ruleOutput(tk, ar);
        out[mutu] = max(out[mutu]!, alpha);
      }
    }

    double crisp = defuzzifikasi(out);

    return {
      "output": out,
      "firing": firing,
      "crisp": crisp,
      "kategori": kategoriMutu(crisp),
    };
  }

  double defuzzifikasi(Map<int, double> out) {
    double sum = 0, sumArea = 0;

    out.forEach((key, value) {
      sum += key * value;
      sumArea += value;
    });

    return sumArea == 0 ? 0 : sum / sumArea;
  }

  int kategoriMutu(double nilai) {
    if (nilai >= 4.5) return 5;
    if (nilai >= 3.5) return 4;
    if (nilai >= 2.5) return 3;
    if (nilai >= 1.5) return 2;
    return 1;
  }
}
