import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io' show Platform; // Add this import
import '../Service/YtService.dart';

// Conditional imports
import 'web_download_helper.dart' if (dart.library.io) 'web_download_helper_stub.dart';

class Ytcontroller with ChangeNotifier {
  final Ytservice _ytService = Ytservice();
  String? _downloadUrl;
  String? get downloadUrl => _downloadUrl;

  // Fetch the download link
  Future<void> fetchlink(String link) async {
    try {
      _downloadUrl = await _ytService.getLink(link);
      notifyListeners(); // Notify listeners that the link has been fetched
    } catch (e) {
      print('Error fetching link: $e');
      _downloadUrl = null;
      notifyListeners();
    }
  }

  // Download the audio file
  Future<void> downloadAudio() async {
    if (_downloadUrl == null) {
      print('Download URL is null');
      return;
    }

    if (kIsWeb) {
      // Use web-specific download logic
      await downloadAudioWeb(_downloadUrl!);
    } else {
      // Request permissions and download for mobile/desktop
      await requestPermissions();
      await downloadAudioMobile(_downloadUrl!);
    }
  }

  // Request storage permissions
  Future<void> requestPermissions() async {
    if (Platform.isAndroid || Platform.isIOS) {
      // Request permissions only on Android and iOS
      try {
        final status = await Permission.storage.request();
        if (status.isGranted) {
          print('Storage permission granted');
        } else {
          print('Storage permission denied');
        }
      } catch (e) {
        print('Error requesting storage permission: $e');
      }
    } else {
      // Skip permission request on desktop platforms
      print('Skipping permission request on desktop platform');
    }
  }

  // Download for mobile/desktop platforms
  Future<void> downloadAudioMobile(String downloadUrl) async {
    final dio = Dio();
    try {
      // Let the user choose the save location
      final savePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Audio File',
        fileName: 'audio.mp3',
      );

      if (savePath == null) {
        print('User canceled the save dialog');
        return;
      }

      // Download the file to the chosen location
      await dio.download(
        downloadUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print('Download progress: ${(received / total * 100).toStringAsFixed(0)}%');
          }
        },
      );

      print('File downloaded to: $savePath');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  // Download for web platform
  Future<void> downloadAudioWeb(String downloadUrl) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        downloadUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // Trigger a file download in the browser
      downloadFileWeb(response.data, 'audio.mp3');
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}