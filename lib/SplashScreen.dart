import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sky_pulse/MyHomePage.dart';
import 'package:sky_pulse/PermissionScreen.dart';
import 'package:weather/weather.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xff6671e5), Color(0xff4852d9)])),
        ),
        Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('icons/cloud-sun.png'),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          color: Colors.white,
                        ))),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja do monitorowania \n czystości powietrza',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ))),
              ],
            )),
        Positioned(
            left: 0,
            bottom: 35,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text("Przywiewam dane...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                        color: Colors.white,
                      ))),
            ))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  void executeOnceAfterBuild() async {
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        forceAndroidLocationManager: true,
        timeLimit: Duration(seconds: 5))
        .then((value) => { loadLocationData(value)})
        .onError((error, stackTrace) => {
          Geolocator.getLastKnownPosition(forceAndroidLocationManager: true)
      .then((value) => {loadLocationData(value)})
    });
  }

  loadLocationData(Position? value) async {
    
    var lat = 52.2297; 
    var lon = 21.0122;

    if (value != null) {
      lat = value.latitude;
      lon = value.longitude;
    }
    
    log("${lat}x$lon");

    WeatherFactory wf = WeatherFactory("b9b26b0a2dc98163b8412c022f815653",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    log(w.toJson().toString());

    var keyword = 'geo:$lat;$lon';
    String endpoint = 'https://api.waqi.info/feed/';
    var key = '2130cefcb71430d9beddbee37cff2bbc2fcb2abc';
    String url = '$endpoint$keyword/?token=$key';

    http.Response response = await http.get(Uri.parse(url));
    log(response.body.toString());

    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = AirQuality(jsonBody);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(weather: w, air: aq
            )
        )
    );
  }
}

class AirQuality {
  bool isGood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int aqi = 0;
  int pm25 = 0;
  int pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody) {
    aqi = int.tryParse(jsonBody['data']?['aqi']?.toString() ?? '-1') ?? -1;
    pm25 = int.tryParse(jsonBody['data']?['iaqi']?['pm25']?['v']?.toString() ?? '-1') ?? -1;
    pm10 = int.tryParse(jsonBody['data']?['iaqi']?['pm10']?['v']?.toString() ?? '-1') ?? -1;
    station = jsonBody['data']?['city']?['name']?.toString() ?? 'Nieznana lokalizacja';
    setupLevel(aqi);
  }

  void setupLevel(int aqi) {
    if (aqi <= 100 && aqi >= 0) {
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrza i wyjdź na spacer";
      isGood = true;
    } else if (aqi <= 150 && aqi > 100) {
      quality = "Nie za dobra";
      advice = "Jeśli tylko możesz zostań w domu, załatwiaj sprawy online";
      isBad = true;
    } else if (aqi > 150) {
      quality = "Bardzo zła!";
      advice = "Zdecydowanie zostań w domu i załatwiaj sprawy online!";
      isBad = true;
    } else {
      quality = "Brak danych";
      advice = "Nie udało się pobrać danych jakości powietrza";
    }
  }
}