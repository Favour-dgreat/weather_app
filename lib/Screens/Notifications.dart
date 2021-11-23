import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/Constants/constants.dart';
import 'package:weather_app/Screens/Body.dart';
import 'package:weather_app/Welcome/WelcomeScreen.dart';
import 'package:weather_app/models/weather_model.dart';

class MyBellBottomSheet extends StatelessWidget {
  final List<WeatherData> weatherData;

  const MyBellBottomSheet({Key? key, required this.weatherData})
      : super(key: key);

  String parseDate(String date) {
    String text = '';
    final convertedDate = DateTime.parse(date);
    final month = convertedDate.month;
    if (month == 11) {
      text = 'November ';
    } else {
      text = convertedDate.month.toString();
    }
    text = text + " ${convertedDate.day}";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Container(
      height: height / 1.2,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: 140,
              height: 3, // Thickness
              color: Color(0xFF9D9D9D),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 190,
            height: 60,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Color(0xFF7047EB),
                backgroundColor: Color(0xFFf0ECFD),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                          maxHeight: MediaQuery.of(context).size.height * 0.9),
                    );
                  },
                );
                // SizedBox(height: 40),
                Container(
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset("assets/images/brightsun.png"),
                        ],
                      );
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Your Notifications",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("New"),
              ],
            ),
          ),
          Container(
            height: 105,
            color: Color(0xFFE3E5FB),
            child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final weather = weatherData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/brightsun.png",
                              width: 30,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "10 minutes ago",
                                  // parseDate(weather.dtTxt!),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xFF737272),
                                    // color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Its a sunny day in your location",
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Color(0xFFE3E3E3),
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 10,
                ),
                Text("Earlier"),
              ],
            ),
          ),
          Container(
            height: height / 2.5,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final weather = weatherData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/brightsun.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "10 minutes ago",
                                  // parseDate(weather.dtTxt!),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xFF737272),
                                    // color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Its a sunny day in your location",
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Color(0xFFE3E3E3),
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
