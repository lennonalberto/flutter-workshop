import 'dart:convert';

import 'package:http/http.dart';
import 'package:workshop/model/photos_response.dart';

class PlaceholderApi {
  String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<PhotosResponse>> getPhotos() async {
    final Response response = await get(
      Uri.parse('$baseUrl/photos'),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return List<PhotosResponse>.from(
          json.map((x) => PhotosResponse.fromJson(x)));
    } else {
      throw Exception('Error fetch');
    }
  }
}
