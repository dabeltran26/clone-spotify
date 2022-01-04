import 'package:clone_spotify/models/playlist_model.dart';
import 'package:flutter/material.dart';

class PlayListCard extends StatelessWidget {
  final Item item;
  const PlayListCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: NetworkImage(item.images[0].url),
          ),
        ));
  }
}
