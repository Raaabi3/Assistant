class Ytresponse {
  final String downloadUrl;

  Ytresponse({required this.downloadUrl});

  factory Ytresponse.fromJson(Map<String, dynamic> json) {
    return Ytresponse(
      downloadUrl: json['downloadUrl'] ?? 'unknown',
    );
  }
}