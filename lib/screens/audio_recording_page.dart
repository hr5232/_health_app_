import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioRecordingPage extends StatefulWidget {
  @override
  _AudioRecordingPageState createState() => _AudioRecordingPageState();
}

class _AudioRecordingPageState extends State<AudioRecordingPage> {
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _handleMicrophonePermission();
  }

  Future<void> _handleMicrophonePermission() async {
    var status = await Permission.microphone.request();
    if (!status.isGranted) {
      // Handle permission denied
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Microphone Permission'),
          content:
              Text('Please grant microphone permission to use this feature.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void startListening() {
    setState(() {
      _isListening = true;
    });
    // Implement the logic to start recording audio here
  }

  void stopListening() {
    setState(() {
      _isListening = false;
    });
    // Implement the logic to stop recording audio here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recording'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please read the following sentence aloud:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(_isListening ? Icons.stop : Icons.mic),
              label: Text(_isListening ? 'Listening...' : 'Record'),
              onPressed: _isListening ? stopListening : startListening,
            ),
          ],
        ),
      ),
    );
  }
}
