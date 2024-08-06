import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Account account;
  setUp(
    () {
      account = Account(id: 123, name: 'Maria', balance: 100, cpf: '123.123.123-09');
    },
  );
  group('Account Tranfer Tests', () {
    test('Deve atualizar corretamente o valor do saldo , quando a transferencia for válida', () {
      account.transfer(100);
      expect(account.balance, 0);
    });
    test('Deve lancar um InvalidAmmountException quando passar um valor invalido', () {
      expect(() => account.transfer(0), throwsA(isA<InvalidAmmountException>()));
      expect(() => account.transfer(-10), throwsA(isA<InvalidAmmountException>()));
    });
    test('Deve lançar InsuficientAmmountException quando o valor de transferencia for maior que o saldo disponivel',
        () {
      expect(() => account.transfer(110), throwsA(isA<InsuficientAmmountException>()));
    });
    test('Deve lançar NullAmmountException quando o valor de uma tranferencia for nulo', () {
      expect(() => account.transfer(null), throwsA(isA<NullAmmountException>()));
    });
  });
}
