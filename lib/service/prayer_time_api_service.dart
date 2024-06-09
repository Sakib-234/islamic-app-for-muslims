import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sakib/model/prayer_time_api_model.dart';

Future<PrayerTimeApiModel?> getPTData() async {
  String url =
      'http://api.aladhan.com/v1/timingsByCity?city=Dhaka&country=Bangladesh&method=8';
  try {
    http.Response response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    PrayerTimeApiModel time = PrayerTimeApiModel.fromJson(data);
    return time;
  } catch (e) {
    print('Error cathed: $e');
    return null;
  }
}
