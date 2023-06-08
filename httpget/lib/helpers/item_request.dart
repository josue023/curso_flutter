import 'dart:convert';
import 'package:httpget/helpers/base_request.dart';
import '../models/items.dart';
import 'package:http/http.dart' as http;

class RequestItem implements HTTPResquest<Item>{
  final String url;
  const RequestItem({required this.url});

  @override
  Future<Item> execute() async{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode != 200){
      throw http.ClientException("Error en los datos");
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response){
    return Item.fromJson(jsonDecode(response));
  }

}