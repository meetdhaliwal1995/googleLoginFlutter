import 'dart:convert';
import 'dart:developer';

import 'package:dynamic_search/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  Future<CountryResponse> getCountry(String name) async {
    try {
      Uri.https("api.nationalize.io/")
      final url = Uri.parse('https://api.nationalize.io/?name=$name');
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      final result = CountryResponse.fromJson(json);
      return result;
    } catch (e) {
      log('Error: ', error: e);
      rethrow;
    }
  }
}
