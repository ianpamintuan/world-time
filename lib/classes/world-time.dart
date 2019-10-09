import 'package:http/http.dart';
import 'dart:convert';
import 'package:date_format/date_format.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String city;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.city});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$city');
      Map data = json.decode(response.body);

      String time = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(time);
      now = now.add(Duration(hours: int.parse(offset)));

      this.isDaytime = now.hour > 6 && now.hour < 18;
      this.time = formatDate(now, [hh, ':', nn, ' ', am]);
    } catch (e) {
      time = 'Error occurred. Time cannot be fetched.';
    }
  }
}
