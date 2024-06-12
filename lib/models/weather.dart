class Weather {
  final String cidade;
  final double temperatura;
  final String descricao;
  final int humidade;
  final double velocidadeVento;

  Weather({
    required this.cidade,
    required this.temperatura,
    required this.descricao,
    required this.humidade,
    required this.velocidadeVento,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cidade: json['name'],
      temperatura: json['main']['temp'].toDouble(),
      descricao: json['weather'][0]['description'],
      humidade: json['main']['humidity'],
      velocidadeVento: json['wind']['speed'].toDouble(),
    );
  }
}
