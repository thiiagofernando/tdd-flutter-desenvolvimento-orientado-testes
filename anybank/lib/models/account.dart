class NullAmmountException implements Exception {
  @override
  String toString() => 'O Valor não pode ser nulo';
}

class InsuficientAmmountException implements Exception {
  @override
  String toString() => 'Saldo Insuficiente para realizar a transferencia';
}

class InvalidAmmountException implements Exception {
  @override
  String toString() => 'O valor da transferencia deve ser maior que zero';
}

enum AcctounType {
  checkings,
  savings,
  investiment,
}

class Account {
  final int id;
  final String name;
  final String cpf;
  double balance;
  AcctounType acctounType;

  Account({
    required this.id,
    required this.name,
    required this.cpf,
    required this.balance,
    this.acctounType = AcctounType.checkings,
  });

  void applayInterest() {
    double interest;
    switch (acctounType) {
      case AcctounType.checkings:
        interest = 0.01;
        break;
      case AcctounType.savings:
        interest = 0.03;
        break;
      case AcctounType.investiment:
        interest = 0.07;
        break;
      default:
        interest = 0.01;
    }
    balance += balance * interest;
  }

  void transfer(double? ammout) {
    if (ammout == null) {
      throw NullAmmountException();
    }
    if (ammout > balance) {
      throw InsuficientAmmountException();
    }

    if (ammout <= 0) {
      throw InvalidAmmountException();
    }

    balance = balance - ammout;
  }
}
