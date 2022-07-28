// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String nome;
  final String? id;
  final String email;
  final String avatarUrl;

  const User({
    this.id,
    required this.nome,
    required this.avatarUrl,
    required this.email,
  });

  User copyWith({
    String? nome,
    String? id,
    String? email,
    String? avatarUrl,
  }) {
    return User(
      nome: nome ?? this.nome,
      id: id ?? this.id,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
