class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);

  @override
  String toString() {
    return 'Transfer{value: $value, account: $account}';
  }
}
