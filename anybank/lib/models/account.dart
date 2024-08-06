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

class Account {
  final int id;
  final String name;
  final String cpf;
  double balance;

  Account({
    required this.id,
    required this.name,
    required this.cpf,
    required this.balance,
  });

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
