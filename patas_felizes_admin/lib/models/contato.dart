class Contato {
  final String id;
  final String nome;
  final String email;
  final String mensagem;
  final String data;

  Contato({
    required this.id, 
    required this.nome, 
    required this.email, 
    required this.mensagem, 
    required this.data
  });

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      id: json['id'].toString(),
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      mensagem: json['mensagem'] ?? '',
      data: json['data'] ?? '',
    );
  }
}
