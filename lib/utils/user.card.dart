import 'package:flutter/material.dart';
import '../fooderlich_theme.dart';
import '../utils/circle.image.dart';

class UserCard extends StatefulWidget {
  final String userName;
  final String title;
  final ImageProvider? imageProvider;
  bool liked = false;

  UserCard({
    Key? key,
    required this.userName,
    required this.title,
    this.imageProvider,
    required this.liked,
  }) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  // bool liked = false;
  void _likedTap() {
    setState(() {
      widget.liked = !widget.liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleImage(
                  imageProvider: widget.imageProvider,
                  imageRadius: 28,
                ),
                // 2
                const SizedBox(width: 8),
                // 3
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: FooderlichTheme.lightTextTheme.headline2,
                    ),
                    Text(
                      widget.title,
                      style: FooderlichTheme.lightTextTheme.headline3,
                    )
                  ],
                ),
              ],
            ),
            IconButton(
                icon: widget.liked
                    ? const Icon(Icons.favorite_rounded)
                    : const Icon(Icons.favorite_border),
                iconSize: 30,
                color: widget.liked ? Colors.red : Colors.grey[400],
                onPressed: () {
                  _likedTap();
                  final snackBar = SnackBar(
                    content: Text(widget.liked ? 'Liked!' : 'Unliked'),
                    duration: const Duration(milliseconds: 600),
                    elevation: 2.0,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }),
          ],
        ));
  }
}
