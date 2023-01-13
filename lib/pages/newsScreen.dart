import 'package:arudu_customer/components/card_news.dart';
import 'package:flutter/material.dart';

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  double rateOne = 0;
  double rateTwo = 0;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CardNews;

    return Scaffold(
        appBar: AppBar(
          title: Text("Neues"),
        ),
        body: NotificationListener(
          onNotification: (v) {
            if (v is ScrollUpdateNotification) {
              //only if scroll update notification is triggered
              setState(() {
                rateOne -= (v.scrollDelta)! / 4;
                rateTwo -= (v.scrollDelta)! / 1.5;
              });
            }
            return true;
          },
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: rateOne,
                child: Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: Image.network(args.picture.toString(),
                      alignment: Alignment.center, fit: BoxFit.cover),
                ),
              ),
              ListView(
                children: [
                  Container(
                    height: 300,
                    color: Colors.transparent,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Text(
                      args.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: dark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Ab heute neu im Sortiment sind die Spezialitäten aus Wundenbach. Mit unseren Ambitionen immer die besten Produkte bieten zu können wollen wir auch hier punkten können. Neu im Sortiment sind: frische Eiernudeln, traditioneller Hausmacher-Weißwurstsenft und die regionalen Tomatensoßen. Ab heute neu im Sortiment sind die Spezialitäten aus Wundenbach. Mit unseren Ambitionen immer die besten Produkte bieten zu können wollen wir auch hier punkten können. Neu im Sortiment sind: frische Eiernudeln, traditioneller Hausmacher-Weißwurstsenft und die regionalen Tomatensoßen. Ab heute neu im Sortiment sind die Spezialitäten aus Wundenbach. Mit unseren Ambitionen immer die besten Produkte bieten zu können wollen wir auch hier punkten können. Neu im Sortiment sind: frische Eiernudeln, traditioneller Hausmacher-Weißwurstsenft und die regionalen Tomatensoßen.",

                      textAlign: TextAlign.center,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: dark,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    required this.top,
    required this.asset,
  });

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -45,
      top: top,
      child: Container(
        height: 550,
        width: 900,
        child: Image.asset("assets/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
