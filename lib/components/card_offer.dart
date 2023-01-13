import 'package:flutter/material.dart';

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class CardOffer extends StatefulWidget {
  final double price;
  final String name;
  final String picture;

  const CardOffer(
      {Key? key,
      required this.name,
      required this.price,
      required this.picture})
      : super(key: key);

  @override
  State<CardOffer> createState() => _CardOfferState();
}

class _CardOfferState extends State<CardOffer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double value = 1.0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          height: 140,
          width: 105,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: dark.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          alignment: Alignment.topLeft,
          child: Column(children: [
            Image(
              height: 60,
              image: AssetImage(widget.picture.toString()),
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                widget.name,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12, color: dark, fontWeight: FontWeight.normal),
              ),
            ),
            Text(
              widget.price.toString(),
              style: TextStyle(
                  fontSize: 20, color: danger, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        Positioned(
            top: 27, //change  according to your use case position
            right: 6, // change  according to your use case position
            child: Container(
              color: danger, // added onl// add label image here
              width: 25,
              height: 16,
              child: Center(
                  widthFactor: 2.5,
                  child: Text(
                    "%",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  )),
            ))
      ]),
    );
  }
}
