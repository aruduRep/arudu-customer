import 'package:flutter/material.dart';

const primary = Color(0xff6a994e);
const secondary = Color(0xffa7c957);
const dark = Color.fromARGB(255, 58, 58, 58);
const light = Color(0xfff2e8cf);
const danger = Color(0xffbc4749);

class CardSupplier extends StatelessWidget {
  final String description;
  final String name;
  final String picture;

  const CardSupplier(
      {Key? key,
      required this.name,
      required this.description,
      required this.picture})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {},
            color: primary,
            textColor: Colors.white,
            child: getIcon(),
            padding: EdgeInsets.all(15),
            shape: CircleBorder(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: dark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon getIcon() {
    double size = 40;
    switch (picture) {
      case "1":
        return Icon(
          Icons.local_drink,
          size: size,
        );
      case "2":
        return Icon(
          Icons.set_meal,
          size: size,
        );
      case "3":
        return Icon(
          Icons.kebab_dining,
          size: size,
        );
      case "4":
        return Icon(
          Icons.emoji_nature,
          size: size,
        );
      case "5":
        return Icon(
          Icons.spa,
          size: size,
        );
      case "6":
        return Icon(
          Icons.egg,
          size: size,
        );
      case "7":
        return Icon(
          Icons.bakery_dining,
          size: size,
        );
      case "8":
        return Icon(
          Icons.agriculture,
          size: size,
        );
      case "9":
        return Icon(
          Icons.savings,
          size: size,
        );
      default:
        return Icon(
          Icons.agriculture,
          size: size,
        );
    }
  }
}
