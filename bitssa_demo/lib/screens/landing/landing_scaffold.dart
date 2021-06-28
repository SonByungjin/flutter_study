import 'package:flutter/material.dart';

class LandingScaffold extends StatefulWidget {
  @override
  _LandingScaffoldState createState() => _LandingScaffoldState();
}

class _LandingScaffoldState extends State<LandingScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'MISS U',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('1'),
              ),
              Center(
                child: Text('2'),
              ),
              Center(
                child: Text('3'),
              ),
              Center(
                child: Text('4'),
              ),
              Center(
                child: Text('5'),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.green.shade400,
              indicatorColor: Colors.transparent,
              tabs: [
                Icon(Icons.favorite),
                Icon(Icons.star),
                Icon(Icons.home_filled),
                Icon(Icons.wb_sunny),
                Icon(Icons.filter_vintage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
