import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: CustomScrollView(
          slivers: [

            // =========================
            // CABEÇALHO
            // =========================

            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,

              title: const Text(
                'guedes',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              actions: [

                IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  ),
                ),

                IconButton(
                  onPressed: () {},

                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // =========================
            // PERFIL
            // =========================

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [

                    Row(
                      children: [

                        // FOTO
                        const CircleAvatar(
                          radius: 42,

                          backgroundColor: Colors.blue,

                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        const SizedBox(width: 25),

                        // ESTATÍSTICAS
                        Expanded(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,

                            children: const [

                              ProfileInfo(
                                numero: '12',
                                texto: 'Publicações',
                              ),

                              ProfileInfo(
                                numero: '356',
                                texto: 'Seguidores',
                              ),

                              ProfileInfo(
                                numero: '420',
                                texto: 'Seguindo',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // NOME
                    const Align(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        'Guedes Silva',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 3),

                    const Align(
                      alignment: Alignment.centerLeft,

                      child: Text(
                        'Desenvolvedor de Software 💻',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // BOTÃO EDITAR
                    SizedBox(
                      width: double.infinity,

                      child: OutlinedButton(
                        onPressed: () {},

                        child: const Text(
                          'Editar perfil',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // ABAS
            // =========================

            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
              ),
            ),

            // =========================
            // PUBLICAÇÕES
            // =========================

            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {

                  return Container(
                    color: Colors.blue,

                    child: const Center(
                      child: Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  );
                },

                childCount: 12,
              ),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ======================================================
// INFORMAÇÕES DO PERFIL
// ======================================================

class ProfileInfo extends StatelessWidget {

  final String numero;
  final String texto;

  const ProfileInfo({
    super.key,
    required this.numero,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          numero,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          texto,

          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}