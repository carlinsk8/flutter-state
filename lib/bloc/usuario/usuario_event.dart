part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;

  ActivarUsuario(this.usuario);
}

class CambiarEdad extends UsuarioEvent {
  final int edad;
  CambiarEdad(this.edad);
}

class AgregarProfeccion extends UsuarioEvent {
  final String profecion;
  AgregarProfeccion(this.profecion);
}

class BorrarUsuario extends UsuarioEvent {}
