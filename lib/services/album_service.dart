import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

class AlbumService {
  Future<List<AlbumModel>> fetchAlbums() async {
    const url = 'https://itunes.apple.com/lookup?id=909253&entity=album';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = data['results'];
      return results
          .where((album) => album['wrapperType'] == 'collection')
          .map((json) => AlbumModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
