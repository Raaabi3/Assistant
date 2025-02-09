import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/JobResponse.dart';
import '../Service/JobService.dart';

class JobController with ChangeNotifier {
  final JobService _jobService = JobService();
  JobResponse? _jobResponse;
  bool _isLoading = false;

  JobResponse? get jobResponse => _jobResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchJobs(String query, int page, int numPages, String country, String datePosted) async {
    _isLoading = true;
    notifyListeners();

    try {
      http.Response response = await _jobService.fetchJobs(query, page, numPages, country, datePosted);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _jobResponse = JobResponse.fromJson(jsonData);
      } else {
        _jobResponse = null;
      }
    } catch (e) {
      print("Error fetching jobs: $e");
      _jobResponse = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
