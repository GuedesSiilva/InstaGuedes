import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            title: const Text(
              'InstaGuedes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
                color: Colors.black,
              )
            ],
          )
        ],
      )
    );
  }
}