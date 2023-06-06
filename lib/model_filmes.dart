class Filmes{
  String nome;
  String imagem;

Filmes({
  required this.nome,
  required this.imagem,
});

Filmes.fromJson(Map<String, dynamic> json)
  : nome = json["nome"].toString(),
    imagem = json["imagem"].toString();
}

//convertendo dados em objetos
//fromJson construdor nomeado e de redirecionamento recebe um map chamado json