import 'package:http/http.dart' as http;
import 'dart:convert';

var url = 'https://eosmrtnice.ba/wp-json/wp/v2/osmrtnica?per_page=50';
Future<List> fetchWpPosts() async {
  final response =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
//test
