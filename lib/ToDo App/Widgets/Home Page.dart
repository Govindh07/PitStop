import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [
    'Buy groceries',
    'Attend meeting at 10 AM',
    'Walk the dog',
    'Read a book',
    'Pay electricity bill',
  ];

  List<String> get todos => _todos;

  void addTodo(String task) {
    _todos.add(task);
    notifyListeners();
  }

  void removeTodo(String task) {
    _todos.remove(task);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TodoProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,home: Home()),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
            ),
          ),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new task',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final text = _todoController.text.trim();
                    if (text.isNotEmpty) {
                      todoProvider.addTodo(text);
                      _todoController.clear();
                    }
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'All ToDos',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 40),
              ),
            ),

            Expanded(
              child: todoProvider.todos.isEmpty
                  ? Center(child: Text("No tasks yet!"))
                  : ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  final task = todoProvider.todos[index];
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                task,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => todoProvider.removeTodo(task),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
