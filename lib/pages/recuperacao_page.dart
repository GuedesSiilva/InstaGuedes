import 'package:flutter/material.dart';

import '../utils/usuario_service.dart';

class RecuperacaoPage extends StatefulWidget {
  const RecuperacaoPage({super.key});

  @override
  State<RecuperacaoPage> createState() =>
      _RecuperacaoPageState();
}

class _RecuperacaoPageState extends State<RecuperacaoPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool emailValido(String email) {
    return RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);
  }

  void recuperarSenha() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();

    final cadastrado =
        UsuarioService.usuario?.email.toLowerCase() ==
            email.toLowerCase();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          cadastrado
              ? 'Solicitação de recuperação realizada!'
              : 'Solicitação de recuperação realizada!',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Icon(
                  Icons.lock_reset,
                  size: 70,
                  color: Colors.pink,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Informe seu e-mail para solicitar a recuperação da senha.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Informe seu e-mail.';
                    }

                    if (!emailValido(valor.trim())) {
                      return 'Informe um e-mail válido.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: recuperarSenha,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Recuperar senha',
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Voltar para o login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
