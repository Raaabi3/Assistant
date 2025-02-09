import 'package:http/http.dart' as http;
import 'Apilinks.dart';

class JobService {
  Future<http.Response> fetchJobs(
      String query, int page, int numPages, String country, String datePosted) async {
    final uri = Uri.parse(Apilinks.baseUrl).replace(queryParameters: {
      'query': query,
      'page': page.toString(),
      'num_pages': numPages.toString(),
      'country': country,
      'date_posted': datePosted,
    });

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': Apilinks.apiHost,
      'x-rapidapi-key': Apilinks.apiKey,
    });

    return response; 
  }
}
