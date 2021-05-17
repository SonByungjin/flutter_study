import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router_project/main.dart';
import 'package:router_project/screens/SecondPage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: pwController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PASSWORD',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 200,
                child: ElevatedButton(
                  child: Text('LOGIN'),
                  onPressed: () {
                    Provider.of<ProviderText>(context, listen: false).changeText(idController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondPage(idController.text, pwController.text);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
