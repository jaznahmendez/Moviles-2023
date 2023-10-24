import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final Map<String, dynamic> song;

  const SongCard({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${song["name"]}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              'Artist: ${song["artist"]}',
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              'Album: ${song["album"]}',
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              'Year: ${song["year"]}',
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
