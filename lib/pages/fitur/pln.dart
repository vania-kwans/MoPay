import 'package:flutter/material.dart';
import 'package:mopay_ewallet/pages/fitur/tagihan_listrik.dart';
import 'package:mopay_ewallet/pages/fitur/token_listrik.dart';

class Pln extends StatefulWidget {
  const Pln({super.key});

  @override
  State<Pln> createState() => _PlnState();
}

class _PlnState extends State<Pln> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLN'),
      ),
      body: Container(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TokenListrik(),
                      ));
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        Icons.electric_bolt,
                        color: Colors.red,
                      ),
                    )),
                SizedBox(width: 20),
                Text("Token Listrik"),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        Divider(
          indent: 50,
          // endIndent: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TagihanListrik(),
                      ));
                    },
                    icon: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        Icons.electric_bolt,
                        color: Colors.red,
                      ),
                    )),
                SizedBox(width: 20),
                Text("Tagihan Listrik"),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        Divider(
          indent: 50,
          // endIndent: 50,
        ),
      ])),
    );
  }
}
