import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkManager {
  Future<bool> testHttpPost() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri endpoint = Uri.parse('https://stlf-test2-jehmvj3kyq-uc.a.run.app');
    Map<String, String> body = {'filename': 'EL_ST_Forecast_Report_asif_test8_header.xlsm', 'IsNG': 'n'};
    final bodyEncoded = jsonEncode(body);
    print('Request ===> ${endpoint.toString()}\nBody: $bodyEncoded');
    try {
      final response = await http.post(endpoint, headers: headers, body: bodyEncoded);
      print('Response for <=== ${endpoint.toString()}\n'
          'Status code: ${response.statusCode}\n'
          'Headers: ${response.headers}\n'
          'Body: ${response.body}');
      return Future.value(true);
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }
}
