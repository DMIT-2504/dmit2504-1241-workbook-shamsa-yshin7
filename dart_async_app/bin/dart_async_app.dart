import 'dart:convert';
import 'dart:io';

import 'package:dart_async_app/dart_async_app.dart' as dart_async_app;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  // getDogData();
  // getDogBreeds();

  while(true) {
    print('Enter a word or type "exit" to quit');
    String? word = stdin.readLineSync();

    if(word == null) {
      print('Please enter a correct word');
      continue;
    }
    
    if(word == 'exit') {
      print('Quitting');
      break;
    }

    var baseURL = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
    var wordEndpoint = baseURL+word;

    var res = await getJson(wordEndpoint);

    // print(res);
  }
}

void getDogData() async {
  var dogData = await getJson('https://dog.ceo/api/breeds/image/random');
}

void getDogBreeds() async {
  var dogData = await getJson('https://dog.ceo/api/breeds/list/all');
  print(dogData['message']);
}

Future<dynamic> getJson(String endPoint) async {
  var url = Uri.parse(endPoint);
  var response = await http.get(url);
  print(response);
  var decodedJson = jsonDecode(response.body);
  return decodedJson;
}
