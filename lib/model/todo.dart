class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise', isDone: false),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDo(
        id: '03',
        todoText: '3 km Walk',
      ),
      ToDo(
        id: '04',
        todoText: 'Drink 4 ltrs of water',
      ),
      ToDo(
        id: '05',
        todoText: 'Eat healthy meal',
      ),
      ToDo(
        id: '06',
        todoText: 'Jogging',
      ),
    ];
  }
}
