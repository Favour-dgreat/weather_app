import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/Constants/constants.dart';
import 'package:weather_app/models/weather_model.dart';

class MyBottomSheet extends StatelessWidget {
  final List<WeatherData> weatherData;
  const MyBottomSheet({Key? key, required this.weatherData}) : super(key: key);
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: SizedBox(
                width: 180,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Color(0xFF7047EB),
                    backgroundColor: Color(0xFFf0ECFD),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    MediaQuery.of(context).size.height * 0.9),
                            // child: MyBottomSheet(
                            //   weatherData: data,
                            // ),
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
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.chevronUp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "Today",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: kPrimaryCardColor, width: 0.55),
              ),
              height: 120,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '\28',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                'o C',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Image.asset("assets/images/fullsun.png"),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "8 a.m",
                            style: TextStyle(
                              fontSize: 18.0,
                              // color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Next forecast",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                const Spacer(),
                Container(
                  height: 50.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFF8862FC),
                  ),
                  child: const Center(
                    child: const Text(
                      "Five Days",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: kPrimaryCardColor, width: 0.55),
              ),
              height: height / 2.5,
              child: ListView.builder(
                  itemCount: weatherData.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final weather = weatherData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 1),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                parseDate(weather.dtTxt!),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  // color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: Image.asset(
                                  "assets/images/sun.png",
                                  fit: BoxFit.fitWidth,
                                  cacheWidth: 30,
                                  cacheHeight: 30,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      '\28',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'o C',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
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
      ),
    );
  }
}
