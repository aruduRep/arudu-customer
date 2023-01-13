import 'package:flutter/material.dart';

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class Productgroup extends StatelessWidget {
  final int id;
  final String name;
  const Productgroup({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft),
        onPressed: (() => Navigator.of(context)
            .pushNamed("/group", arguments: Productgroup(name: name, id: id))),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
