import 'dart:io';

import 'package:autisa/Users%20Screen/teyecontactskill.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:autisa/Users%20Screen/eyecontactskill.dart';

import '../ip.dart';

class tsocialskills extends StatefulWidget {
  final String email;
  const tsocialskills({Key? key,required this.email}) : super(key: key);

  @override
  State<tsocialskills> createState() => _tsocialskillsState();
}

class _tsocialskillsState extends State<tsocialskills> {
  late VideoPlayerController _controller;
  bool _isLoading = true;
  bool _isPlaying = false; // Track play/pause state

  @override
  void initState() {
    super.initState();
    _fetchVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _fetchVideo() async {
    try {
      final response = await http.post(
        Uri.parse('$ip/fvdi1.php'),
        body: {'username': '1'}, // Assuming '1' is the username
      );
      if (response.statusCode == 200) {
        final videoBytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final tempVideoFile = File('${tempDir.path}/video_${widget.email}.mp4');
        await tempVideoFile.writeAsBytes(videoBytes);

        _controller = VideoPlayerController.file(tempVideoFile);
        await _controller.initialize(); // Initialize the controller
        _controller.addListener(() {
          setState(() {});
        });
        _controller.setLooping(false); // Disable looping

        // Start playing the video
        _controller.play();

        setState(() {
          _isLoading = false;
          _isPlaying = true;
        });
      } else {
        print('Failed to load video');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
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
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'சமூக திறன்',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Center(
                    child: Text(
                      'உங்கள் பிள்ளைக்கு சமூகப் பெயர்ச்சியும் சமூக விதிகளும் எளிதில் இருக்காது என்றும் அது உங்களுக்கு அல்லது பிறர்களுக்கு எளிதாக இருக்கலாம் என்றும் உறுதியாகச் சொன்னது. அதனால், பிள்ளைக்கு சமூக நிலைகளில் சிறந்தபடியாக உதவ, வீடியோ உள்ளது.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next screen here if needed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => teyecontactskill(email: widget.email)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD3D7F8), // Same color as "Enter Full Screen" button
                        foregroundColor: Colors.black,
                      ),
                      child: Text('அடுத்தது'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
