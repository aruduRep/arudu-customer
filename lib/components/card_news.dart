import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  final String name;
  final String picture;

  const CardNews({Key? key, required this.name, required this.picture})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/news",
              arguments: CardNews(
                name: name,
                picture: picture,
              ));
        },
        hoverElevation: 0,
        elevation: 0,
        focusElevation: 0,
        textColor: Colors.white,
        padding: EdgeInsets.all(0),
        shape: CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: Colors.blue,
            image: DecorationImage(
              image: NetworkImage(picture.toString()),
              fit: BoxFit.cover,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
                child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.4)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35, 5, 35, 10),
                      child: Center(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )))
          ]),
        ));
  }
}
