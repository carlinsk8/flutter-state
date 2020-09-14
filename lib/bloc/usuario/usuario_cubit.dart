import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/models/usuario.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambairEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(new UsuarioActivo(newUser));
    }
  }

  void agregarProfeccion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfeciones = [
        ...currentState.usuario.profeciones,
        'Profecion ${currentState.usuario.profeciones.length + 1}'
      ];
      final newUser =
          currentState.usuario.copyWith(profeciones: newProfeciones);
      emit(new UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(new UsuarioInitial());
  }
}
