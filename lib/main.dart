import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey
            ),
            onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const  TodoHomepage()));
        }, child: const Text('Press for Add Todo')),
      ),
    );
  }
}

class TodoHomepage extends StatefulWidget {
  const TodoHomepage({Key? key}) : super(key: key);

  @override
  State<TodoHomepage> createState() => _TodoHomepageState();
}

class _TodoHomepageState extends State<TodoHomepage> {

  List<String> todoList = [];

  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        focusColor: Colors.blue,
        foregroundColor: Colors.green,
        hoverColor: Colors.green,
        onPressed: (){
          showModalBottomSheet(
              context: (context),
              backgroundColor: Colors.blueGrey,
              barrierColor: Colors.black87,
              isDismissible: true,
              isScrollControlled: true,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),

              builder: (builder){
                return SizedBox(
                  height: 300,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          //margin: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: todoController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'ADD',
                              border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          todoList.add(todoController.text);
                          todoController.clear();
                          setState(() {});
                          Navigator.pop(context);
                        },
                            child: const Text('ADD'))
                      ],
                    ));

          }
          );


      },
      child: const Icon(Icons.add),),

        body: Scrollbar(
          child: ListView.separated(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ListData()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: ListTile(
                          title: Text(todoList[index]),
                          tileColor: Colors.blueGrey.shade300,
                          leading: CircleAvatar(
                            foregroundColor: Colors.red.shade400,
                            child: const Icon(Icons.ac_unit_outlined),
                          ),
                        ),
                      ),

                      /// Adding Spacer for create space between widgets
                      const Spacer(
                        flex: 15,
                      ),
                      Expanded(
                          flex: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green
                            ),
                            onPressed: () {
                              todoList.removeAt(index);
                              setState(() {});
                            },
                            child: const SizedBox(
                                height: 55,
                                child: Icon(Icons.delete_outlined))),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 10,
                thickness: 2,
                color: Colors.blueGrey,
              );
            },
          ),
        ));
  }
}

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('New Screen'),
      ),
    );
  }
}