import 'package:arudu_customer/components/productgroup.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

int toggle = 0;

class _GroupScreenState extends State<GroupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Productgroup;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                  child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Text(
                        args.name,
                      ))),
              AnimatedContainer(
                duration: Duration(milliseconds: 375),
                height: 48.0,
                width: (toggle == 0) ? 48.0 : 280.0,
                curve: Curves.easeOut,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: -10.0,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 375),
                      top: 6.0,
                      right: 7.0,
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: (toggle == 0) ? 0.0 : 1.0,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F3F7),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: AnimatedBuilder(
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                splashRadius: 10.0,
                                icon: Icon(
                                  Icons.clear,
                                  color: dark,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      if (toggle == 0) {
                                        toggle = 1;
                                        _con.forward();
                                      } else {
                                        toggle = 0;
                                        _textEditingController.clear();
                                        _con.reverse();
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            builder: (context, widget) {
                              return Transform.rotate(
                                angle: _con.value * 2.0 * 3.14,
                                child: widget,
                              );
                            },
                            animation: _con,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 375),
                      left: (toggle == 0) ? 20.0 : 37.0,
                      curve: Curves.easeOut,
                      top: 11.0,
                      child: AnimatedOpacity(
                        opacity: (toggle == 0) ? 0.0 : 1.0,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 28.0,
                          width: 200.0,
                          child: TextField(
                            controller: _textEditingController,
                            cursorRadius: Radius.circular(10.0),
                            cursorWidth: 2.0,
                            style: TextStyle(
                              color: Color(0xff5B5B5B),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Color(0xff5B5B5B),
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Suchen...',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: IconButton(
                        splashRadius: 19.0,
                        icon: Icon(
                          Icons.search,
                          color: dark,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              if (toggle == 0) {
                                toggle = 1;
                                _con.forward();
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container());
  }
}
