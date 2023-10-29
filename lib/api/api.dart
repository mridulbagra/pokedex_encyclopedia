import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map> fetch(url) async{
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json ;
}