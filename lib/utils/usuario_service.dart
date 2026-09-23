import 'usuarios.dart';

class UsuarioService {
  static Usuario? usuario;

  static bool cadastrar({
    required String nome,
    required String email,
    required String usuario,
    required String senha,
  }) {
    if (UsuarioService.usuario != null) {
      return false;
    }

    UsuarioService.usuario = Usuario(
      nome: nome,
      email: email,
      usuario: usuario,
      senha: senha,
    );

    return true;
  }

  static bool login({
    required String identificador,
    required String senha,
  }) {
    if (usuario == null) {
      return false;
    }

    final identificadorInformado =
        identificador.trim().toLowerCase();

    final emailCorreto =
        usuario!.email.toLowerCase() == identificadorInformado;

    final usuarioCorreto =
        usuario!.usuario.toLowerCase() == identificadorInformado;

    final senhaCorreta =
        usuario!.senha == senha;

    return (emailCorreto || usuarioCorreto) && senhaCorreta;
  }

  static void atualizarPerfil({
    required String nome,
    required String usuario,
    required String biografia,
  }) {
    final usuarioAtual = UsuarioService.usuario;

    if (usuarioAtual == null) {
      return;
    }

    usuarioAtual.nome = nome;
    usuarioAtual.usuario = usuario;
    usuarioAtual.biografia = biografia;
  }

  static void logout() {
    UsuarioService.usuario = null;
  }
}
