import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Account account;
  setUp(
    () {
      account = Account(id: 123, name: 'Maria', balance: 100, cpf: '123.123.123-09');
    },
  );
  group('Account interest rates', () {
    test('Deve se aplicar um juros de 1% quando tipo de conta for conta corrente', () {
      account.applayInterest();
      expect(account.balance, 101);
    });
    test('Deve se aplicar um juros de 3% quando tipo de conta for conta poupança', () {
      final Account accountSave =
          Account(id: 123, name: 'Maria', balance: 100, cpf: '123.123.123-09', acctounType: AcctounType.savings);
      accountSave.applayInterest();
      expect(accountSave.balance, 103);
    });
    test('Deve se aplicar um juros de 7% quando tipo de conta for conta investimento', () {
      final Account accountInvestiment =
          Account(id: 123, name: 'Maria', balance: 100, cpf: '123.123.123-09', acctounType: AcctounType.investiment);
      accountInvestiment.applayInterest();
      expect(accountInvestiment.balance, 107);
    });
  });

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
