import 'package:flutter/material.dart';
import 'package:zoomcut/components/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZoomEntry extends StatefulWidget {
  static String id = "zoom_entry_scren";
  @override
  _ZoomEntryState createState() => _ZoomEntryState();
}

class _ZoomEntryState extends State<ZoomEntry> {
  gettime(int hours, int minutes, String zoomurl) {
    var now = new DateTime.now();
    var future = DateTime(now.year, now.month, now.day, hours, minutes);
    int timediff = future.difference(now).inSeconds;
    Duration timeDuration = Duration(seconds: timediff);
    sleep(timeDuration);
    print(future.difference(now).inHours);
    launchurl(zoomurl);
  }

  launchurl(String zoomurl) async {
    if (await canLaunch(zoomurl)) {
      await launch(zoomurl, forceWebView: false, forceSafariVC: false);
    } else {
      throw 'Could not launch $zoomurl';
    }
  }

  String url;
  List hours = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
  ];
  List minutes = [0, 15, 30, 45];
  int i = 12;
  int j = 2;
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              backgroundImage: AssetImage("images/autozoom_logo.png"),
              radius: 50.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.red,
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Hours',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                hours[i].toString(),
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                'hrs',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    i--;
                                    if (i < 0) {
                                      i = 23;
                                    }
                                  });
                                },
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    i++;
                                    if (i > 23) {
                                      i = 0;
                                    }
                                  });
                                },
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.red,
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Minutes',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                minutes[j].toString(),
                                style: TextStyle(fontSize: 50.0),
                              ),
                              Text(
                                'mins',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    j--;
                                    if (j < 0) {
                                      j = 3;
                                    }
                                  });
                                },
                                child: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    j++;
                                    if (j > 3) {
                                      j = 0;
                                    }
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                                backgroundColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            RoundEntry(
              title: "Enter zoom meeting link",
              colour: Colors.red,
              onChanged: (value) {
                setState(() {
                  url = value;
                });
              },
            ),
            RoundButton(
                title: "Join future meeting",
                colour: Colors.red,
                onPressed: () {
                  setState(() {
                    message = "Zoom meeting has been added successfully. The meeting will be joined in the proposed time.";
                    gettime(hours[i], minutes[j] + 1, url);
                  });
                }),
            Center(
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
