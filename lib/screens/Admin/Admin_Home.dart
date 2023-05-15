import 'package:unipay/controllers/dbhelper.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHome createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Databases'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  child: Text('Show Student Database'), onPressed: () {}),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Show Transaction Database'),
                onPressed: () {},
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Show Payment Database'),
                onPressed: () {},
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Show Loan Database'),
                onPressed: () {},
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Show Scholarship Database'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
