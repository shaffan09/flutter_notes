import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  NoteCard({
    Key? key,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.color,
    required this.onTap,
    required this.onLongPress,
    required this.onTapDown,
    required this.isPinned,
  }) : super(key: key);

  final String title;
  final String body;
  final DateTime dateTime;
  final Color color;
  final bool isPinned;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  void Function(TapDownDetails details) onTapDown;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: InkWell(
        onTapDown: onTapDown, // this sets the tap positions
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.yMMMMd('en_us').format(dateTime),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
                      fontSize: 13,
                    ),
                  ),
                  if (isPinned)
                    const RotationTransition(
                      turns: AlwaysStoppedAnimation(45 / 360),
                      child: FaIcon(
                        FontAwesomeIcons.thumbtack,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  body.length < 60 ? body : '${body.substring(0, 60)}...',
                  style: const TextStyle(
                    fontSize: 16,
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
