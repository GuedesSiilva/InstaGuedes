import 'package:flutter/material.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        body: PageView.builder(
          scrollDirection: Axis.vertical,

          itemCount: 5,

          itemBuilder: (context, index) {

            return Stack(
              fit: StackFit.expand,

              children: [

                // =========================
                // FUNDO DO REELS
                // =========================

                Container(
                  color: Colors.blue,
                  
                  child: const Center(
                    child: Icon(
                      Icons.flutter_dash,
                      color: Colors.white,
                      size: 120,
                    ),
                  ),
                ),

                // =========================
                // NOME DO USUÁRIO
                // =========================

                Positioned(
                  left: 15,
                  bottom: 70,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Row(
                        children: [

                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,

                            child: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),

                          SizedBox(width: 8),

                          Text(
                            'flutter.dev',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'Aprendendo Flutter 🚀',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // =========================
                // BOTÕES LATERAIS
                // =========================

                Positioned(
                  right: 12,
                  bottom: 70,

                  child: Column(
                    children: [

                      IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),

                      const Text(
                        '1,2 mil',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      const Text(
                        '245',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      const SizedBox(height: 12),

                      IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}