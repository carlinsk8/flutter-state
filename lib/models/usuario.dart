import 'package:meta/meta.dart';

class Usuario {
  String nombre;
  int edad;
  List<String> profeciones;

  Usuario({@required this.nombre, this.edad, this.profeciones})
      : assert(nombre != null);
}
