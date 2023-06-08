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

    //final cliente = http.Client();
    //cliente.get(Uri.parse(url));
    //cliente.close();

    /*final String token = "";

    final responsePost = await http.post(
        Uri.parse(url),
        body: "Texto que va en el post",
        encoding: Encoding.getByName("utf-8"),
        headers: {
          "Authentication" : token
        }
    );

    final headers = response.headers;
    final responseLength = response.contentLength;*/

    

    if(response.statusCode != 200){
      throw http.ClientException("Error en los datos");
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response){
    return Item.fromJson(jsonDecode(response));
  }

}