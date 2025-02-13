// web_download_helper.dart
import 'dart:html' as html; // Import the dart:html library for web APIs

void downloadFileWeb(List<int> bytes, String fileName) {
  final blob = html.Blob([bytes], 'audio/mpeg');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..click();
  html.Url.revokeObjectUrl(url);
}