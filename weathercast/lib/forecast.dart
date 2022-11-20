/*
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImNjNmNhNmU5ZTQ2YjhhMjdlODdjZTRkZGIyNzViZmNlZDBkYzYyNjU3NjUxYzc3MjVhMGQzNjIzYTczODMwYTVkNTY2Nzc2OWJlYmQ0OWRkIn0.eyJhdWQiOiIyIiwianRpIjoiY2M2Y2E2ZTllNDZiOGEyN2U4N2NlNGRkYjI3NWJmY2VkMGRjNjI2NTc2NTFjNzcyNWEwZDM2MjNhNzM4MzBhNWQ1NjY3NzY5YmViZDQ5ZGQiLCJpYXQiOjE2Njg5MzM3OTUsIm5iZiI6MTY2ODkzMzc5NSwiZXhwIjoxNzAwNDY5Nzk1LCJzdWIiOiIyMjg2Iiwic2NvcGVzIjpbXX0.mtf5dzetrv_SMGW_oGnds3YqMixcYphWl7yK4OL-I2zMawlg8xJgA2TJVTjKvUqGb7sI5NXIhD3g39_rBqwF5iJICQTMwKoSkdhTuXIKAnIT-O93H03Oltk7EwswNpFnopF0dn8ReH0XSxCuFfkwl7orjWO_A4cRrr6-AAxk7FuzfBRdT7b9mBJkenaoF6_RYq4B3fZNr13QiGEa-SClfOeMu4_-QNLymXR1hEvNnMNlcgLSjXXCcSPZayYjeu7quMIsDeMaX7ub8cQy-TNVkGH07jHHwpgmIS-SRs1AQQPPvIwXtuJyAn0Feq_1hpqdpox_kz-SwPMdXSS752e7LcagHiH514uIFnkcN4w25bo7AT-p8zCIOzr_o5aa2gC4Wc58fdQmnAh0x3IwfojRwmnw3pTJV7CmoaI-uJgdwULJ9ZwxYEjYJa07DheWqaPjEMzW6ZHgaC4GkrkccY7sPY9OccXiZhPRf3fycGDg5nDwpCmuTyc5-KuZkz1FX_9SFYXB9Z2OUnEtSeBkaelsSmsoOLONOmLml5i0-IAcZdfOHdxQTXz77jldu4fSfUkpVZcEGZyIdPu1C1jqHlWaWXiDz-666O9fzCENx6u14gtIkMnQvmggcYILnIJyn07jssxqgA-ouJuK9-IVexjhKVUPuGi9tBsT-RJ7_FUZqno
*/
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async { //forecast เป็นฟังก์ชั่น//
const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImNjNmNhNmU5ZTQ2YjhhMjdlODdjZTRkZGIyNzViZmNlZDBkYzYyNjU3NjUxYzc3MjVhMGQzNjIzYTczODMwYTVkNTY2Nzc2OWJlYmQ0OWRkIn0.eyJhdWQiOiIyIiwianRpIjoiY2M2Y2E2ZTllNDZiOGEyN2U4N2NlNGRkYjI3NWJmY2VkMGRjNjI2NTc2NTFjNzcyNWEwZDM2MjNhNzM4MzBhNWQ1NjY3NzY5YmViZDQ5ZGQiLCJpYXQiOjE2Njg5MzM3OTUsIm5iZiI6MTY2ODkzMzc5NSwiZXhwIjoxNzAwNDY5Nzk1LCJzdWIiOiIyMjg2Iiwic2NvcGVzIjpbXX0.mtf5dzetrv_SMGW_oGnds3YqMixcYphWl7yK4OL-I2zMawlg8xJgA2TJVTjKvUqGb7sI5NXIhD3g39_rBqwF5iJICQTMwKoSkdhTuXIKAnIT-O93H03Oltk7EwswNpFnopF0dn8ReH0XSxCuFfkwl7orjWO_A4cRrr6-AAxk7FuzfBRdT7b9mBJkenaoF6_RYq4B3fZNr13QiGEa-SClfOeMu4_-QNLymXR1hEvNnMNlcgLSjXXCcSPZayYjeu7quMIsDeMaX7ub8cQy-TNVkGH07jHHwpgmIS-SRs1AQQPPvIwXtuJyAn0Feq_1hpqdpox_kz-SwPMdXSS752e7LcagHiH514uIFnkcN4w25bo7AT-p8zCIOzr_o5aa2gC4Wc58fdQmnAh0x3IwfojRwmnw3pTJV7CmoaI-uJgdwULJ9ZwxYEjYJa07DheWqaPjEMzW6ZHgaC4GkrkccY7sPY9OccXiZhPRf3fycGDg5nDwpCmuTyc5-KuZkz1FX_9SFYXB9Z2OUnEtSeBkaelsSmsoOLONOmLml5i0-IAcZdfOHdxQTXz77jldu4fSfUkpVZcEGZyIdPu1C1jqHlWaWXiDz-666O9fzCENx6u14gtIkMnQvmggcYILnIJyn07jssxqgA-ouJuK9-IVexjhKVUPuGi9tBsT-RJ7_FUZqno';
try {
  Position location = await getCurrentLocation();
  http.Response response = await http.get(
  Uri.parse('$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'), 
  headers: {
    'accept': 'application/json',
    'authorization': 'Bearer $token',
  }
);
if(response.statusCode == 200) {
  var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts'][0]['data'];
  Placemark address = (await placemarkFromCoordinates(location.latitude, location.longitude)).first;
  return Weather(
  address: '${address.subLocality}\n${address.administrativeArea}',
  temperature: result['tc'],
  cond: result['cond'],
);
} else {
  return Future.error(response.statusCode);
}
} catch (e) {
  return Future.error(e);
}

} 