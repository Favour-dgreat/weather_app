import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/Constants/constants.dart';
import 'package:weather_app/Screens/Notifications.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:http/http.dart' as http;
import '../Screens/Body.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<WeatherData> data = [];
  @override
  void initState() {
    getDataFromApi();
    super.initState();
  }

  getDataFromApi() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Lagos,ng&mode=json&appid=3e6012627b366de5eb20fdc41b7d8599');
      var response = await http.get(
        url,
      );
      final Map<String, dynamic> parsed = json.decode(response.body);
      final result = WeatherModel.fromJson(parsed);
      data = result.list!;

      log('gotten  ${data}');
    } catch (e) {
      log('message $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xFF8862FC),
                        onSurface: Colors.grey,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                          ),
                          Text(
                            "Lagos, Nigeria",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 70.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              primary: Colors.white,
                              backgroundColor: const Color(0xFF8862FC),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext bc) {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9),
                                      child: MyBellBottomSheet(
                                        weatherData: data,
                                      ),
                                    );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => ForecastReport()),
                                    // );
                                  });
                            },
                            child: const Icon(
                              FontAwesomeIcons.solidBell,
                              size: 30.0,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFB9BCF2),
                          width: 0.77,
                        )),
                    // shape: const RoundedRectangleBorder(
                    //     side: BorderSide(
                    //       color: Colors.white,
                    //       width: 1.0,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(10))),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: ListTile(
                            iconColor: kCardColor,
                            textColor: kCardColor,
                            leading: Image.asset("assets/images/cloud.png"),
                            title: const Text(
                              'Today',
                              style: const TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                              'Mon, 26 Apr',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                '\28',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 200,
                                    color: kCardColor),
                              ),
                            ),
                            Text(
                              'o C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kCardColor),
                            ),
                          ],
                        ),
                        const Text(
                          "Lagos, Nigeria . 2:00 p.m",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: Container(
                      width: 350,
                      height: 150,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color(0xFF8862FC),
                          onSurface: Colors.grey,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                              ),
                              isScrollControlled: true,
                              builder: (BuildContext bc) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.9),
                                  child: MyBottomSheet(
                                    weatherData: data,
                                  ),
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ForecastReport()),
                                // );
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Forecast report",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.chevronUp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
