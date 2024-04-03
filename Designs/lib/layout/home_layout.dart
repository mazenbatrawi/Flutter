import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:projects/modules/done_tasks/done_tasks_screen.dart';
import 'package:projects/modules/new_tasks/new_tasks_screen.dart';
import 'package:projects/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  late Database  database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () {
          if(isBottomSheetShown){
            if(formKey.currentState!.validate()){
              insertToDatabase(
                title: titleController.text,
                date: dateController.text,
                time: timeController.text,
              ).then((value) {
                Navigator.pop(context);
                setState(() {
                  isBottomSheetShown = false;
                });
              });
            }
          }
          else{
            scaffoldKey.currentState!.showBottomSheet((context) => 
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultFormField(
                        controller: titleController,
                        textInputType: TextInputType.text,
                        validate: (value) {
                          if(value != null && value.isEmpty){
                            return 'Title must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Title',
                        prefix: Icons.title,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: timeController,
                        textInputType: TextInputType.none,
                        onTap: () {
                          showTimePicker(
                            context: context, 
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            timeController.text = value!.format(context).toString();
                          });
                        },
                        validate: (value) {
                          if(value != null && value.isEmpty){
                            return 'Time must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Time',
                        prefix: Icons.watch_later_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: dateController,
                        textInputType: TextInputType.none,
                        onTap: () {
                          showDatePicker(
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('21000101'),
                            context: context, 
                            initialDate: DateTime.now(),
                          ).then((value) {
                            if(value != null){
                              dateController.text = DateFormat.yMMMd().format(value);
                            }
                          });
                        },
                        validate: (value) {
                          if(value != null && value.isEmpty){
                            return 'Date must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Date',
                        prefix: Icons.calendar_today,
                      ),
                    ],
                  ),
                ),
              ),
            );
            setState(() {
              isBottomSheetShown = true;
            });
          }
        },
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(
          isBottomSheetShown ? Icons.add : Icons.edit,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'Archieved',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('Database created');
         database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
        ).then((value) {
          print('Table created');
        }).catchError((error) {
          print('Error while creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('Database opened');
      },
    );
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database.transaction((txn) {
      txn.rawInsert(
        'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")'
      ).then((value) {
        print('${value} Inserted successfully');
      }).catchError((error) {
        print('Error while inserting ${error.toString()}');
      });
      return Future(() => null);
    });
  }

}