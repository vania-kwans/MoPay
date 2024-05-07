// import 'package:flutter/material.dart';
// import 'package:mopay_ewallet/data/data_tips.dart';
// import 'package:mopay_ewallet/pages/home/home_tips.dart';
// import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomeTest extends StatefulWidget {
//   const HomeTest({super.key});

//   @override
//   State<HomeTest> createState() => _HomeTestState();
// }

// class _HomeTestState extends State<HomeTest> {
//   int activeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     List<DataTipsSlider> dataTips =
//         Provider.of<DataTipsSliderProvider>(context).data;

//     return GestureDetector(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Dialog(
//               insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 height: 500,
//                 // height: MediaQuery.of(context).size.height * 0.5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Column(
//                     // mainAxisSize: MainAxisSize.min,
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Kenali MoPay Lebih Dekat",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Biar Makin Akrab, Yuk Cek Tips Berikut!",
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         // width: MediaQuery.of(context).size.width,
//                         children: [
//                           CarouselSlider.builder(
//                             itemCount: dataTips.length,
//                             itemBuilder: (context, index, pageViewIndex) {
//                               return buildImage(dataTips[index].gambar, index);
//                             },
//                             options: CarouselOptions(
//                               height: 200,
//                               autoPlay: true,
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               autoPlayAnimationDuration:
//                                   const Duration(milliseconds: 2000),
//                               autoPlayInterval: const Duration(seconds: 2),
//                               enlargeCenterPage: true,
//                               aspectRatio: 2.0,
//                               enableInfiniteScroll: false,
//                               onPageChanged: (index, reason) {
//                                 setState(() {
//                                   activeIndex = 2;
//                                 });
//                               },
//                             ),
//                           ),
//                           Text('Lalalalala $activeIndex'),
//                           const SizedBox(height: 12),
//                           AnimatedSmoothIndicator(
//                             effect: const WormEffect(
//                               dotHeight: 7,
//                               dotWidth: 15,
//                               spacing: 10,
//                               activeDotColor: Color(0xff850000),
//                             ),
//                             activeIndex: activeIndex,
//                             count: dataTips.length,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//         // Dialog(
//         //   insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
//         //   shape: RoundedRectangleBorder(
//         //     borderRadius: BorderRadius.circular(10),
//         //   ),
//         //   child: Container(
//         //     width: MediaQuery.of(context).size.width * 0.9,
//         //     height: 500,
//         //     // height: MediaQuery.of(context).size.height * 0.5,
//         //     decoration: BoxDecoration(
//         //       color: Colors.white,
//         //       borderRadius: BorderRadius.circular(10),
//         //     ),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(25.0),
//         //       child: Column(
//         //         children: [
//         //           Container(
//         //             alignment: Alignment.center,
//         //             width: MediaQuery.of(context).size.width,
//         //             height: 50,
//         //             child: const Column(
//         //               crossAxisAlignment: CrossAxisAlignment.start,
//         //               children: [
//         //                 Text(
//         //                   "Kenali MoPay Lebih Dekat",
//         //                   style: TextStyle(
//         //                     fontSize: 20,
//         //                     fontWeight: FontWeight.bold,
//         //                   ),
//         //                 ),
//         //                 Text(
//         //                   "Biar Makin Akrab, Yuk Cek Tips Berikut!",
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //           const SizedBox(height: 20),
//         //           Column(
//         //             children: [
//         //               CarouselSlider.builder(
//         //                 itemCount: dataTips.length,
//         //                 itemBuilder: (context, index, realIndex) {
//         //                   return buildImage(dataTips[index].gambar, index);
//         //                 },
//         //                 options: CarouselOptions(
//         //                   height: 200,
//         //                   autoPlay: true,
//         //                   autoPlayCurve: Curves.fastOutSlowIn,
//         //                   autoPlayAnimationDuration:
//         //                       const Duration(milliseconds: 2000),
//         //                   autoPlayInterval: const Duration(seconds: 2),
//         //                   enlargeCenterPage: true,
//         //                   aspectRatio: 2.0,
//         //                   enableInfiniteScroll: false,
//         //                   onPageChanged: (index, reason) {
//         //                     setState(() {
//         //                       activeIndex = index;
//         //                     });
//         //                   },
//         //                 ),
//         //               ),
//         //               Text('Lalalalala $activeIndex'),
//         //               const SizedBox(height: 12),
//         //               AnimatedSmoothIndicator(
//         //                 effect: const WormEffect(
//         //                   dotHeight: 7,
//         //                   dotWidth: 15,
//         //                   spacing: 10,
//         //                   activeDotColor: Color(0xff850000),
//         //                 ),
//         //                 activeIndex: activeIndex,
//         //                 count: dataTips.length,
//         //               ),
//         //             ],
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   ),
//         // );
//       },
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.20,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               color: Colors.grey[200],
//               image: const DecorationImage(
//                 image: NetworkImage(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJn4Dm6YeToAREwex3_hrZ3fh6gDeb6qnyzfwTNr6yCz6psBZxzHvwn3lLOL3zbZevbpw&usqp=CAU'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Cara Top Up MoPay Cash",
//             style: TextStyle(color: Colors.grey, fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget buildImage(String gambar, int index) {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 5),
//     child: Image.network(
//       gambar,
//       fit: BoxFit.cover,
//     ),
//   );
// }
