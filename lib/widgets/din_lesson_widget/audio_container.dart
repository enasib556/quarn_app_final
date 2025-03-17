import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/lesson.dart';

class AudioContainer extends StatefulWidget {
  final Audio audio;
  const AudioContainer({super.key, required this.audio});

  @override
  State<AudioContainer> createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  bool isPaused = false; // متغير جديد لحالة الإيقاف المؤقت
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.setSourceUrl(widget.audio.url).then((_) async {
      var duration = await player.getDuration();
      if (duration != null) {
        setState(() {
          _duration = duration;
        });
      }
    });

    player.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    player.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    player.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
        isPaused = false; // إعادة ضبط حالة الإيقاف المؤقت
        _position = Duration.zero;
      });
    });
  }

  Future<void> _playAudio() async {
    if (isPaused) {
      // استكمال التشغيل من حيث توقف
      await player.resume();
    } else {
      await player.stop(); // إيقاف أي صوت شغال قبل تشغيل الجديد
      await player.play(UrlSource(widget.audio.url));
    }

    setState(() {
      isPlaying = true;
      isPaused = false;
    });
  }

  Future<void> _pauseAudio() async {
    await player.pause();
    setState(() {
      isPlaying = false;
      isPaused = true;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isPlaying
              ? Border.all(color: const Color(0xFFA85000), width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.audio.title,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFA85000),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.audio.description ?? 'لا يوجد وصف',
              style: GoogleFonts.elMessiri(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: Text(
                _formatDuration(_position),
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFFA85000),
                inactiveTrackColor: Colors.grey.shade400,
                thumbColor: const Color(0xFFA85000),
                trackHeight: 4,
              ),
              child: Slider(
                value: _position.inSeconds.toDouble(),
                min: 0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (value) async {
                  final newPosition = Duration(seconds: value.toInt());
                  await player.seek(newPosition);
                  setState(() {
                    _position = newPosition;
                  });
                },
              ),
            ),

            Center(
              child: Text(
                _formatDuration(_duration),
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            Center(
              child: IconButton(
                onPressed: isPlaying ? _pauseAudio : _playAudio,
                icon: Icon(
                  isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  color: const Color(0xFFA85000),
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
