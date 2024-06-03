import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sakib/model/prayer_time_api_model.dart';

late final PrayerTimeApiModel time;
const String url =
    'http://api.aladhan.com/v1/timingsByCity?city=Dhaka&country=Bangladesh&method=8';

Future getPTData() async {
  http.Response response = await http.get(Uri.parse(url));

  final data = jsonDecode(response.body);

  time = PrayerTimeApiModel.fromJson(data);

  return time;
}
