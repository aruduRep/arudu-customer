// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 70,
                child: Center(
                    child: Text(
                  "Mein Einkaufszettel",
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
          heroTag: "basket",
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Einkaufskorb',
          isExtended: true,
          backgroundColor: danger,
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          )),
    );
  }
}
