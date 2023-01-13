// ignore_for_file: sort_child_properties_last

import "package:flutter/material.dart";
import "package:arudu_customer/local.dart";
import 'package:arudu_customer/components/card_news.dart';
import 'package:arudu_customer/components/card_offer.dart';
import 'package:arudu_customer/components/card_supplier.dart';
import 'package:arudu_customer/components/productgroup.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import "package:arudu_customer/pages/cartScreen.dart";

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _newsCurrent = 0;
  final CarouselController _newsController = CarouselController();
  ScrollController scrollController = ScrollController();

  final List<Widget> _offers = [
    CardOffer(
        name: "Schwarzwälder Schinken 200g",
        price: 1.99,
        picture: 'assets/product_1.png'),
    CardOffer(
        name: "G&G Goude gerieben 250g",
        price: 1.59,
        picture: 'assets/product_2.png'),
    CardOffer(
        name: "Milka Alpenmilch 100g",
        price: 1.39,
        picture: 'assets/product_3.png'),
    CardOffer(
        name: "Milka Aufstrich 300g",
        price: 3.69,
        picture: 'assets/product_4.png'),
    CardOffer(
        name: "Milka Wundertüte 500g",
        price: 8.99,
        picture: 'assets/product_5.png'),
  ];
  final List<Widget> _news = [
    CardNews(
        name: "Willkommen im Waldsteinlädla, wir sind 24/7 für dich da!",
        picture: "assets/arudu247Box.jpg"),
    CardNews(
        name:
            "Immer frisch und regional! 2 mal wöchentlich frische Obst & Gemüse Lieferung! Nur solange der Vorrat reicht",
        picture: "assets/obst.jpeg"),
    CardNews(
        name:
            "Extra lecker! Basti Rauhs Brot gibt's immer sonntags. Probier's aus!",
        picture: "assets/supplier_3.jpg"),
  ];
  final List<Widget> _productgroups = [
    Productgroup(name: "Obst und Gemüse", id: 1),
    Productgroup(name: "Milchprodukte", id: 2),
    Productgroup(name: "Brot und Brötchen", id: 3),
    Productgroup(name: "Fleisch und Wurst", id: 4),
    Productgroup(name: "Alltagswaren", id: 5)
  ];
  final List<Widget> _suppliers = [
    CardSupplier(
      name: "Metzgerei Lottes",
      description: "Text ohne Ende...",
      picture: "9",
    ),
    CardSupplier(
      name: "Bäckerei Huber",
      description: "Text ohne Ende...",
      picture: "7",
    ),
    CardSupplier(
      name: "Imkerei Stelzer",
      description: "Text ohne Ende...",
      picture: "4",
    ),
    CardSupplier(
      name: "Hühnermobil",
      description: "Text ohne Ende...",
      picture: "6",
    ),
    CardSupplier(
      name: "Forellenzucht Ruckdeschel",
      description: "Text ohne Ende...",
      picture: "2",
    )
  ];

  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  void getDatabase() async {
    final DbHelper dbHelper = DbHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        backgroundColor: primary,
        title: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 10),
              onPressed: () {
                scrollController.animateTo(
                    //go to top of scroll
                    0, //scroll offset to go
                    duration: Duration(milliseconds: 500), //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    );
              },
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              splashRadius: null,
            ),
          ),
          Expanded(
            child: Text(
              " Mein Laden",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/settings");
              },
              icon: Icon(Icons.settings),
              splashRadius: 20,
            ),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: ListView(
            controller: scrollController,
            children: [
              SizedBox(height: 30.0),
//----------------------------------------Aktuelles
              Container(
                height: 200,
                child: CarouselSlider(
                  items: _news,
                  carouselController: _newsController,
                  options: CarouselOptions(
                    height: 380.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _newsCurrent = index;
                      });
                    },
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: _news.length,
                position: _newsCurrent.toDouble(),
                decorator: DotsDecorator(
                  color: secondary,
                  activeColor: primary,
                  size: const Size.square(9.0),
                  activeSize: const Size(25.0, 12.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onTap: (position) =>
                    _newsController.animateToPage(position.toInt()),
              ),
//----------------------------------------Produktgruppen
              Container(
                height: 80,
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _productgroups,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/group",
                        arguments: Productgroup(name: "Alle Artikel", id: -1));
                  },
                  hoverElevation: 0,
                  color: primary.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  elevation: 0,
                  focusElevation: 0,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 220,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "Hier gehts zum gesamten Sortiment",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Icon(Icons.search, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
              //----------------------------------------Angebote
              Container(
                decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Aktuelle Angebote",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: danger,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return light;
                                }),
                              ),
                              child: Text(
                                "",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: dark,
                                    fontWeight: FontWeight.normal),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _offers,
                      ),
                    )
                  ],
                ),
              ),
//----------------------------------------Lieferanten
              Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 20, 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Unsere Regionalen",
                        style: TextStyle(
                            fontSize: 22,
                            color: dark,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 140,
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _suppliers,
                  ),
                ),
              ),
//----------------------------------------Spiele
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/tictactoe");
                  },
                  hoverElevation: 0,
                  color: primary.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  elevation: 0,
                  focusElevation: 0,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 220,
                          margin: EdgeInsets.only(right: 0),
                          alignment: Alignment.center,
                          child: Text(
                            "Lust auf Tic-Tac-Toe?",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                        Icon(Icons.apps, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        tooltip: 'Einkaufskorb',
        backgroundColor: primary,
        child: const Hero(
            tag: "basket",
            child: const Icon(Icons.shopping_basket, color: Colors.white)),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CartScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.5, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
