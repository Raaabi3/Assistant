import 'Job.dart';

class JobResponse {
  final String status;
  final String requestId;
  final List<Job> data;

  JobResponse({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'];
    List<Job> jobsList = list != null ? (list as List).map((i) => Job.fromJson(i)).toList() : [];

    return JobResponse(
      status: json['status'] ?? 'unknown',
      requestId: json['request_id'] ?? '',
      data: jobsList,
    );
  }
}
