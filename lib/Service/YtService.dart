import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Apilinks.dart';

class Ytservice {
  Future<String> getLink(String link) async {
    final uri = Uri.parse('https://youtube-mp310.p.rapidapi.com/download/mp3').replace(queryParameters: {
      'url': link,
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': Apilinks.YtapiHost,
      'x-rapidapi-key': Apilinks.apiKey,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['downloadUrl']; // Extract the download URL
    } else {
      throw Exception('Failed to fetch download link');
    }
  }
}