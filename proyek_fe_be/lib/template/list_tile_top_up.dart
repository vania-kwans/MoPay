import 'package:flutter/material.dart';

class ListTileLeadingPic extends StatelessWidget {
  const ListTileLeadingPic(
      {super.key, required this.leadingPic, required this.methodName});

  final String leadingPic;
  final String methodName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 1, // Blur radius
            offset: const Offset(0, 1), // Offset position
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 12,
        ),
        leading: Image.network(
          leadingPic,
          height: 50,
          width: 50,
        ),
        title: Text(
          methodName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}

class ListTileLeadingIcon extends StatelessWidget {
  const ListTileLeadingIcon(
      {super.key, required this.leadingIcon, required this.methodName});

  final Widget leadingIcon;
  final String methodName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 1, // Blur radius
            offset: const Offset(0, 1), // Offset position
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 12,
        ),
        leading: leadingIcon,
        title: Text(
          methodName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
