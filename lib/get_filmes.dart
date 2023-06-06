import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model_filmes.dart';



 void main() {
  getFilmes();
}  

Future<List<Filmes>> getFilmes() async{
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json' )); 

  if(response.statusCode == 200){
    print("Pagina Carregada com sucesso");
    //print(response.body);
    final json = jsonDecode(response.body);

  return List<Filmes>.from(json.map((element){
    return Filmes.fromJson(element);
  }));
  }
  else{
    return Future.error("Um erro ocorreu");
  }  
}

/* 
Future<void> getFilmes() async{

  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json'
  ));
  if(response.statusCode == 200){
    print("Pagina Carregada com sucesso");
    print(response.body);
  }
  if(response.statusCode == 404){
    print("Pagina com error");
  }
  if(response.statusCode == 500){
    print("erro interno no servidor");
  }
  }
 */  