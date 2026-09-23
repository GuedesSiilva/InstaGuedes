import 'package:flutter/material.dart';

import '../utils/usuario_service.dart';
import 'editar_perfil_page.dart';
import 'login_page.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  void editarPerfil() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EditarPerfilPage(),
      ),
    );

    setState(() {});
  }

  void sair() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text(
            'Deseja realmente sair da sua conta?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logout realizado com sucesso!'),
                  ),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Sair'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuario = UsuarioService.usuario;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              title: Text(
                '@${usuario?.usuario ?? 'usuario'}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: editarPerfil,
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: sair,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: const AssetImage(
                            'assets/images/perfil.png',
                          ),
                        ),

                        const SizedBox(width: 25),

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

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        usuario?.nome ?? 'Usuário',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        usuario?.biografia ??
                            'Desenvolvedor de Software 💻',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: editarPerfil,
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

            const SliverToBoxAdapter(
              child: Divider(height: 1),
            ),

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
