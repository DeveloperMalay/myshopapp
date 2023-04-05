import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.category, required this.selected});
  final String category;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: Text(
        category,
        style: TextStyle(color: selected ? Colors.white : Colors.black,fontWeight: FontWeight.bold),
      ),
    );
  }
}
