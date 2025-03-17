import 'package:flutter/material.dart';

class StepAndLine extends StatefulWidget {
  bool isCompleted;
  StepAndLine({super.key, required this.isCompleted});

  @override
  State<StepAndLine> createState() => _StepAndLineState();
}

class _StepAndLineState extends State<StepAndLine> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  widget.isCompleted = !widget.isCompleted;
                });
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.brown, width: 1),
                  color: widget.isCompleted ? const Color(0xFF522700) : Colors.white,
                ),
              ),
            ),
            if (widget.isCompleted)
              const Icon(Icons.check_rounded, color: Colors.white, size: 18),
          ],
        ),
      ],
    );
  }
}
