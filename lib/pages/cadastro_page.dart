import 'package:flutter/material.dart';

import '../utils/usuario_service.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  bool esconderSenha = true;
  bool esconderConfirmacao = true;

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    usuarioController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  bool emailValido(String email) {
    return RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);
  }

  void cadastrar() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final sucesso = UsuarioService.cadastrar(
      nome: nomeController.text.trim(),
      email: emailController.text.trim(),
      usuario: usuarioController.text.trim(),
      senha: senhaController.text,
    );

    if (!sucesso) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Já existe um usuário cadastrado nesta execução.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro realizado com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Crie sua conta no InstaGuedes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Informe seu nome.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

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

                const SizedBox(height: 15),

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

                const SizedBox(height: 15),

                TextFormField(
                  controller: senhaController,
                  obscureText: esconderSenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          esconderSenha = !esconderSenha;
                        });
                      },
                      icon: Icon(
                        esconderSenha
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Informe uma senha.';
                    }

                    if (valor.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: confirmarSenhaController,
                  obscureText: esconderConfirmacao,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          esconderConfirmacao =
                              !esconderConfirmacao;
                        });
                      },
                      icon: Icon(
                        esconderConfirmacao
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Confirme sua senha.';
                    }

                    if (valor != senhaController.text) {
                      return 'As senhas não são iguais.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: cadastrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Já tenho uma conta',
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
