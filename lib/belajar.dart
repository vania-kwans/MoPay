import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Belajar extends StatefulWidget {
  const Belajar({super.key});

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Sliver List'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
            child: Container(
              color: Colors.blue[100],
              height: 100,
              child: const Text(
                "I am a Pinned Header",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverAnimatedPaintExtent(
            duration: const Duration(milliseconds: 150),
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.pink[100],
                      height: 40,
                      alignment: Alignment.center,
                      child: Text("$index",
                          style: const TextStyle(fontSize: 30.0)),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
          // SliverStack(
          //   insetOnOverlap: true,
          //   children: <Widget>[
          //     SliverPositioned.fill(
          //       child: Container(color: Colors.yellow),
          //     ),
          //     SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.all(15.0),
          //             child: Container(
          //               color:
          //                   index % 2 == 0 ? Colors.green : Colors.greenAccent,
          //               height: 40,
          //               alignment: Alignment.center,
          //               child: Text(
          //                 "Item $index",
          //                 style: const TextStyle(fontSize: 30),
          //               ),
          //             ),
          //           );
          //         },
          //         childCount: 10,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
