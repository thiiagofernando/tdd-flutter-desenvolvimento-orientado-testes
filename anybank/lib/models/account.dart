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
    if (ammout != null) {
      if (ammout <= balance && ammout > 0) {
        balance = balance - ammout;
      }
    }
  }
}
