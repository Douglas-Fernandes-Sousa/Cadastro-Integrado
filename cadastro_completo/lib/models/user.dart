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
}
