import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Login Screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Column(children: <Widget>[Text("hallo")])
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
