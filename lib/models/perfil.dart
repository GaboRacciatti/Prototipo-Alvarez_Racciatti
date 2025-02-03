import 'dart:convert';

List<Perfil> perfilFromJson(String str) => List<Perfil>.from(json.decode(str).map((x) => Perfil.fromJson(x)));

String perfilToJson(List<Perfil> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Perfil {
    String nombre;
    String apellido;
    String email;
    String ubicacion;
    String id;

    Perfil({
        required this.nombre,
        required this.apellido,
        required this.email,
        required this.ubicacion,
        required this.id,
    });

    factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        ubicacion: json["ubicacion"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "ubicacion": ubicacion,
        "id": id,
    };

    String get avatar => "https://ui-avatars.com/api/?name=${nombre}+${apellido}&size=200";
}
