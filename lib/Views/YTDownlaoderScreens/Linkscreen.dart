import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/YtController.dart';

class Linkscreen extends StatefulWidget {
  const Linkscreen({super.key});

  @override
  State<Linkscreen> createState() => _LinkscreenState();
}

class _LinkscreenState extends State<Linkscreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _isFetching = false; // To show loading while fetching the link
  bool _isDownloading = false; // To show loading while downloading the file

  @override
  Widget build(BuildContext context) {
    final ytController = Provider.of<Ytcontroller>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('YouTube MP3 Downloader')),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              color: Colors.red,
              height: 400,
            ),
          ),
          Positioned(
            top: -20,
            left: -120,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: Colors.red
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 20,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: Colors.red[400]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/ytmp3_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // URL Input Field
                TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintText: "Paste your URL here",
                  ),
                ),
                const SizedBox(height: 20),
          
                // Fetch Download Link Button
                ElevatedButton(
                  onPressed: _isFetching || _isDownloading
                      ? null // Disable button while fetching or downloading
                      : () async {
                          setState(() => _isFetching = true);
                          final url = _urlController.text.trim();
                          if (url.isNotEmpty) {
                            try {
                              await ytController.fetchlink(url);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Download link fetched successfully!')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error fetching link: $e')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter a valid URL')),
                            );
                          }
                          setState(() => _isFetching = false);
                        },
                  child: _isFetching
                      ? const CircularProgressIndicator() // Show loading indicator
                      : const Text("Fetch Download Link"),
                ),
                const SizedBox(height: 20),
          
                // Download MP3 Button (only shown if downloadUrl is available)
                if (ytController.downloadUrl != null)
                  ElevatedButton(
                    onPressed: _isFetching || _isDownloading
                        ? null // Disable button while fetching or downloading
                        : () async {
                            setState(() => _isDownloading = true);
                            try {
                              await ytController.downloadAudio();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Download complete!')),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Error downloading file: $e')),
                              );
                            }
                            setState(() => _isDownloading = false);
                          },
                    child: _isDownloading
                        ? const CircularProgressIndicator() // Show loading indicator
                        : const Text("Download MP3"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
