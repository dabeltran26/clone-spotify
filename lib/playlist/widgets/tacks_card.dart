import 'package:clone_spotify/models/tracks_model.dart';
import 'package:flutter/material.dart';

class TrackCard extends StatelessWidget {
  final Item item;
  const TrackCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(item.track.name),
            subtitle: Text(item.track.artists[0].name),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(item.track.album.images[0].url),
              ),
            )
          ),
        ],
      ),
    );
  }
}
