import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graigeo_assignment/main.dart';

class HeartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heartlist = Provider.of<ProviderHeart>(context).heatProducts;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: heartlist.map((el) {
          return Text(
            el,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          );
        }).toList(),
      ),
    );
  }
}
