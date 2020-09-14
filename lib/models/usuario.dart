class Usuario {
  final String nombre;
  final int edad;
  final List<String> profeciones;

  Usuario({this.nombre, this.edad, this.profeciones});

  Usuario copyWith({
    String nombre,
    int edad,
    List<String> profeciones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profeciones: profeciones ?? this.profeciones,
      );
}
