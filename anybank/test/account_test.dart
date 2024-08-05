import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Account account;
  setUp(
    () {
      account = Account(id: 123, name: 'Maria', balance: 100, cpf: '123.123.123-09');
    },
  );
  group('Testes de Transferencias', () {
    test('Testa uma transferencia com sucesso', () {
      account.transfer(100);
      expect(account.balance, 0);
    });
    test('Testa uma transferencia com valor negativo', () {
      account.transfer(-100);
      expect(account.balance, 100);
    });
    test('Transfere qualquer coisa que nao seja numeros', () {});
    test('Testa uma transferencia com valor maior que o disponivel', () {
      account.transfer(110);
      expect(account.balance, 100);
    });
    test('Testa uma transferencia com valor zero', () {
      account.transfer(0);
      expect(account.balance, 100);
    });
    test('Testa uma transferencia com valor null', () {
      account.transfer(null);
      expect(account.balance, 100);
    });
  });
}
