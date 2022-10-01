import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cat.dart';
import 'package:flutter_application_1/pages/home_detail.dart';
import 'package:flutter_application_1/widgets/home_widgets/cat_item.dart';

class CatList extends StatelessWidget {
  const CatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatModel.items.length,
      itemBuilder: (context, index) {
        final cat = CatModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(cat: cat))),
            child: CatItem(cat: cat));
      },
    );
  }
}
