import 'dart:io';
import 'package:autisa/Users%20Screen/eating.dart';
import 'package:autisa/Users%20Screen/pointingskill.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../ip.dart';

class dressing extends StatefulWidget {
  final String email;
  const dressing({Key? key,required this.email}) : super(key: key);

  @override
  State<dressing> createState() => _dressingState();
}

class _dressingState extends State<dressing> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  int confidenceLevel = 0;
  int practiceFrequency = 0;
  int childProficiency = 0;
  int methodApplication = 0;

  @override
  void initState() {
    super.initState();
    _fetchVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _fetchVideo() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/fvdv11.php'),
        body: {'email': widget.email},
      );
      if (response.statusCode == 200) {
        final videoBytes = response.bodyBytes;

        // Create a temporary file to store the video bytes
        final tempDir = await getTemporaryDirectory();
        final tempVideoFile = File('${tempDir.path}/dressing_video.mp4');
        await tempVideoFile.writeAsBytes(videoBytes);

        // Initialize the video player controller with the temporary file
        _controller = VideoPlayerController.file(tempVideoFile);
        await _controller.initialize();
        _controller.addListener(() {
          setState(() {});
        });
        _controller.setLooping(false);
        _controller.play();

        setState(() {
          _isLoading = false;
        });
      } else {
        print('Failed to load video');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> sendDataToBackend() async {
    String url = '$ip/dressing.php'; // Replace with your backend URL

    // Create a map containing slider values and email
    Map<String, dynamic> data = {
      'v1': confidenceLevel,
      'v2': practiceFrequency,
      'v3': childProficiency,
      'v4': methodApplication,
      'email': widget.email,
    };

    // Encode the data as JSON
    String jsonData = json.encode(data);

    try {
      // Make POST request
      var response = await http.post(
        Uri.parse(url),
        body: jsonData,
        headers: {'Content-Type': 'application/json'},
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse response JSON
        var responseData = json.decode(response.body);
        print(responseData);
        // Handle response here if needed
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error here if needed
      }
    } catch (e) {
      print('Exception occurred: $e');
      // Handle exception here if needed
    }
  }
  void _enterFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'DRESSING',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 200, // Adjust the height as needed
                width: double.infinity,
                color: Colors.grey, // Placeholder color
                child: _isLoading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    _ControlsOverlay(
                      controller: _controller,
                      onFullScreenPressed: _enterFullScreen,
                    ),
                    // Video progress indicator at the bottom of the video
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.blue,
                          backgroundColor: Colors.white,
                          bufferedColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              buildSlider(
                'How confident are you to teach this skill to your child at present?',
                confidenceLevel,
                    (value) {
                  setState(() {
                    confidenceLevel = value.round();
                  });
                },
              ),
              buildSlider(
                'How many times have you practiced coaching this skill with your child?',
                practiceFrequency,
                    (value) {
                  setState(() {
                    practiceFrequency = value.round();
                  });
                },
              ),
              buildSlider(
                'How proficient is your child with this skill at present?',
                childProficiency,
                    (value) {
                  setState(() {
                    childProficiency = value.round();
                  });
                },
              ),
              buildSlider(
                'How confident are you to apply this method of training for your child in other domains?',
                methodApplication,
                    (value) {
                  setState(() {
                    methodApplication = value.round();
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Send data to backend when the button is pressed
                    sendDataToBackend();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => eating(email: widget.email,)),
                    );
                    // Add functionality for the next button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD3D7F8), // Change button color
                    foregroundColor: Colors.black, // Change text color
                  ),
                  child: Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlider(String title, int value, Function(double) onChanged) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            textAlign: TextAlign.center, // Center-align text
            style: TextStyle(fontSize: 15), // Set text size to 15
          ),
        ),
        SizedBox(height: 5), // Add space of 5 between text and value text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add left and right padding
          child: Center(
            child: SizedBox(
              height: 20, // Adjust height to provide space
              child: Text(
                '$value',
                style: TextStyle(
                  color: Color(0xFF9187C7), // Value text color
                  fontSize: 15, // Set value text size to 15
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add left and right padding
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2.0, // Adjust slider height here
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
            ),
            child: Slider(
              value: value.toDouble(),
              onChanged: onChanged,
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: Color(0xFF9187C7), // Change progress bar color
              inactiveColor: Color(0xFFF0F0F0), // Change seekbar mask color
            ),
          ),
        ),
      ],
    );
  }
}
class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({
    required this.controller,
    required this.onFullScreenPressed,
  });

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;
  final VoidCallback onFullScreenPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomCenter, // Align the progress indicator to the bottom
          child: VideoProgressIndicator(controller, allowScrubbing: true),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.fullscreen),
            onPressed: onFullScreenPressed,
          ),
        ),
      ],
    );
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({Key? key, required this.controller})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isPlaying = !_isPlaying;
          });
          if (_isPlaying) {
            widget.controller.play();
          } else {
            widget.controller.pause();
          }
        },
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ),
            ),
            // Show pause/play button
            if (!_isPlaying)
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.play_arrow, size: 50),
                  onPressed: () {
                    setState(() {
                      _isPlaying = true;
                    });
                    widget.controller.play();
                  },
                ),
              ),
            // Show progress indicator
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(
                widget.controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.blue,
                  backgroundColor: Colors.white,
                  bufferedColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

