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

  void transfer(amount) {
    balance = balance - amount;
  }
}
