import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchTxtCtrl;

  SearchScreen({
    @required this.searchTxtCtrl
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.searchTxtCtrl.text),
    );
  }
}
