import 'package:flutter/material.dart';
import 'package:mopay_ewallet/utama/reload.dart';

//POSTER IKLAN PROMOSI -----------------------------------------------------------------------------------------------------------------------
class HomeRecommendation extends StatelessWidget {
  const HomeRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rekomendasi Pilihan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createRecommendationBlock(
                context,
                linkGambar: 'assets/images/slider/slider1.jpeg',
                tema: 'E-Commerce',
                judul:
                    'Belanja Rp100.000 cuman bayar Rp50.000! Discount akhir tahun dari MoPay',
              ),
              createRecommendationBlock(
                context,
                linkGambar: 'assets/images/slider/slider2.jpeg',
                tema: 'GoFat',
                judul: 'Ga Mau ribet Bayar GoFat? Dari MoPay Aja',
              ),
              createRecommendationBlock(
                context,
                linkGambar: 'assets/images/slider/slider3.jpeg',
                tema: 'E-Commerce',
                judul: 'Casback Hingga Rp100.000 NO Ribet MoPay Aja',
              ),
              createRecommendationBlock(
                context,
                linkGambar: 'assets/images/slider/slider4.jpeg',
                tema: 'E-Commerce',
                judul: 'MoPrize sampai 150Juta Ikutin MoPrize hanya di MoPay',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

GestureDetector createRecommendationBlock(
  BuildContext context, {
  required String linkGambar,
  required String tema,
  required String judul,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Reload()));
    },
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 20,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(linkGambar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tema,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "MoPay",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
