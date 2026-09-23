import 'package:flutter/material.dart';

import '../utils/usuario_service.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() =>
      _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nomeController;
  late final TextEditingController usuarioController;
  late final TextEditingController biografiaController;

  @override
  void initState() {
    super.initState();

    final usuario = UsuarioService.usuario;

    nomeController = TextEditingController(
      text: usuario?.nome ?? '',
    );

    usuarioController = TextEditingController(
      text: usuario?.usuario ?? '',
    );

    biografiaController = TextEditingController(
      text: usuario?.biografia ?? '',
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    usuarioController.dispose();
    biografiaController.dispose();
    super.dispose();
  }

  void salvar() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    UsuarioService.atualizarPerfil(
      nome: nomeController.text.trim(),
      usuario: usuarioController.text.trim(),
      biografia: biografiaController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dados atualizados com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),

            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink,
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Informe seu nome.';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: 'Nome de usuário',
                prefixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Informe seu nome de usuário.';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: biografiaController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Biografia',
                prefixIcon: Icon(Icons.description_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Informe uma biografia.';
                }

                return null;
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Salvar alterações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
