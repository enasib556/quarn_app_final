import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoLessonScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoLessonScreen({super.key, required this.videoUrl, required this.title});

  @override
  State<VideoLessonScreen> createState() => _VideoLessonScreenState();
}

class _VideoLessonScreenState extends State<VideoLessonScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    }).catchError((error) {
      print("Error initializing video player: $error");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: isFullScreen
            ? null
            : AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'مشاهدة الفيديو',
            style: GoogleFonts.elMessiri(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF522700),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            if (!isFullScreen)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 24),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.elMessiri(fontSize: 17.5, fontWeight: FontWeight.bold, color: const Color(0xFFA85000)),
                    ),
                  ),
                ),
              ),
            Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onTap: toggleFullScreen,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("خطأ في تحميل الفيديو", style: TextStyle(color: Colors.white));
                  } else {
                    return const CircularProgressIndicator(color: Color(0xFFA85000));
                  }
                },
              ),
            ),
            SizedBox(height: 30,),
            if (!isFullScreen)
              Padding(
                padding: const EdgeInsets.symmetric(vertical:24,horizontal: 16),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying ? _controller.pause() : _controller.play();
                          });
                        },
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.orange, // لون المسار الرئيسي
                            inactiveTrackColor: Colors.grey, // لون المسار الخلفي
                            thumbColor: Colors.orange, // لون الدائرة
                            overlayColor: Colors.orange.withOpacity(0.2),
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                          ),
                          child: Slider(
                            value: _controller.value.position.inSeconds.toDouble(),
                            max: _controller.value.duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                _controller.seekTo(Duration(seconds: value.toInt()));
                              });
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.seekTo(Duration(seconds: _controller.value.duration.inSeconds));
                            _controller.pause();
                          });
                        },
                        icon: const Icon(Icons.skip_next, color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: toggleFullScreen,
                        icon: const Icon(Icons.fullscreen, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
