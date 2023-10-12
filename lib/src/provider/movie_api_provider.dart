import 'dart:convert';

import 'package:demo_app/src/model/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final String _apiKey = '35653c27658f3810a181f33d1f17cbec';

  Future<ItemModel> fetchMovies() async {
    print("entered");
    Uri uri = Uri(
      scheme: 'http',
      host: 'api.themoviedb.org',
      pathSegments: ['3', 'movie', 'popular'],
      queryParameters: {'api_key': _apiKey},
    );
    final response = await client.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
