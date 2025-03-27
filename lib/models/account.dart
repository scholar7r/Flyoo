class Account {
  final int? id;
  final String alias;
  final String name;
  final String digest;

  const Account({
    this.id,
    required this.alias,
    required this.name,
    required this.digest,
  });
}
