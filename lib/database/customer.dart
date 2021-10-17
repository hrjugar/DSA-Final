class Customer {
  String username;
  String password;

  Customer({required this.username, required this.password});
}

List<Customer> customers = [
  Customer(username: "admin", password: "admin")
];