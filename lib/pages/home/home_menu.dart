import 'package:flutter/material.dart';
import 'package:mopay_ewallet/utama/reload.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

//FITUR TAMBAHAN LAINNYA --------------------------------------------------------------------------------------------------------------------
class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Services',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createMenuButton(
                context,
                iconName: 'Kesehatan',
                icon: const Icon(Icons.health_and_safety),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'Credit Card',
                icon: const Icon(Icons.credit_card_outlined),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'Education',
                icon: const Icon(Icons.school),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'PLN',
                icon: const Icon(Icons.electric_bolt),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createMenuButton(
                context,
                iconName: 'Air PDAM',
                icon: const Icon(Icons.water_drop_outlined),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'PBB Tax',
                icon: const Icon(Icons.my_library_books),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'Credit & Packages',
                icon: const Icon(Icons.smartphone),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
              createMenuButton(
                context,
                iconName: 'Lainnya',
                icon: const Icon(Icons.more_horiz),
                iconColor: Colors.green.shade900,
                bgColor: Colors.green.shade100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column createMenuButton(BuildContext context,
      {required String iconName,
      required Icon icon,
      required Color iconColor,
      required Color bgColor}) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Reload()),
            );
          },
          icon: icon,
          color: iconColor,
          style: IconButton.styleFrom(
            backgroundColor: bgColor,
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.12,
              MediaQuery.of(context).size.width * 0.12,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Text(
              iconName,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
