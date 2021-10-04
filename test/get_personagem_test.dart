import 'package:app_desafio/controllers/personagem/personagem_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = PersonagemController();

  test("Deve retornar a lista de personagens", () async {
    final list = await controller.getPersonagens();
    expect(list?.isNotEmpty, equals(true));
  });
}
