class Student {
  String name;
  String id;
  String book;
  DateTime dueDate;
  bool submitted;

  Student({
    required this.name,
    required this.id,
    required this.book,
    required this.dueDate,
    this.submitted = false,
  });
}