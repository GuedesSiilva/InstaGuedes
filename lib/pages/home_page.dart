import 'package:flutter/material.dart';
import 'package:instagram_flutter/pages/buscar_page.dart';
import 'package:instagram_flutter/pages/feed_page.dart';
import 'package:instagram_flutter/pages/perfil_page.dart';
import 'package:instagram_flutter/pages/reels_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indiceAtual = 0;

  final List<Widget> telas = const [
    FeedPage(),
    BuscarPage(),
    ReelsPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: indiceAtual,
        children: telas,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search),
            label: 'Buscar',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_collection),
            selectedIcon: Icon(Icons.video_collection),
            label: 'Reels',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
            selectedIndex: indiceAtual,
          onDestinationSelected: (int index) {
            setState(() {
              indiceAtual = index;
            });
          },
      ),
    );
  }
}