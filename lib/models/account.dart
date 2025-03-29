class Account {
  final int? id;
  final String accountAlias;
  final String accountName;
  final String accountPass;

  const Account({
    required this.accountAlias,
    required this.accountName,
    required this.accountPass,
    this.id,
  });
}
