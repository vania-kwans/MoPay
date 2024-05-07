import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/home/data_tips.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeTips extends StatefulWidget {
  const HomeTips({super.key});

  @override
  State<HomeTips> createState() => _HomeTipsState();
}

class _HomeTipsState extends State<HomeTips> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DataTipsSlider> dataTips =
        Provider.of<DataTipsSliderProvider>(context).data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kenali MoPay Lebih Dekat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Biar Makin Akrab, Yuk Cek Tips Berikut!",
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: dataTips.map((e) => DialogContainer(data: e)).toList()),
        ),
      ],
    );
  }
}

class DialogContainer extends StatelessWidget {
  final DataTipsSlider data;
  const DialogContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TipsDialog(
              subJudul: data.subJudul,
              subGambar: data.subGambar,
              judulKeterangan: data.judulKeterangan,
              keterangan: data.keterangan,
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        height: MediaQuery.of(context).size.height * 0.28,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.red, width: 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage(data.gambar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Text(
                data.judul,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsDialog extends StatefulWidget {
  final String subJudul;
  final List<String> subGambar;
  final List<String> judulKeterangan;
  final List<String> keterangan;

  const TipsDialog(
      {super.key,
      required this.subJudul,
      required this.subGambar,
      required this.judulKeterangan,
      required this.keterangan});

  @override
  State<TipsDialog> createState() => _TipsDialogState();
}

class _TipsDialogState extends State<TipsDialog> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.subJudul,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
                child: CarouselSlider.builder(
                  itemCount: widget.subGambar.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    return Image.network(
                      widget.subGambar[index],
                      fit: BoxFit.contain,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 3000),
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3 + 20,
                child: Column(
                  children: [
                    Text(
                      widget.judulKeterangan[activeIndex],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          widget.keterangan[activeIndex],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSmoothIndicator(
                      effect: WormEffect(
                        dotHeight: 5,
                        dotWidth: 18,
                        spacing: 5,
                        activeDotColor: const Color(0xff850000),
                        dotColor: Colors.grey.withOpacity(0.5),
                      ),
                      activeIndex: activeIndex,
                      count: widget.subGambar.length,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget buildImage(String image, int index) {
//   return
// }
