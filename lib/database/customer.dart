class Customer {
  String username;
  String password;

  Customer({required this.username, required this.password});
}

List<Customer> customers = [
  Customer(username: "riacordero", password: "c1"),
  Customer(username: "hernanjugar", password: "c2"),
  Customer(username: "janelleuy", password: "c3")
];