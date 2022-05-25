import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:internsforyou/setup/browse/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'Kj9eT8bzLnfOk4tTjRPFrnrRoOdUONFb5Es4c8vY';
  final keyClientKey = 'TInUGQ88j0d7hUrpuDoxj8kOdOwceBtSwEglmmgr';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MaterialApp(
    home: Sign_in_Home(),
  ));
}

class Sign_in_Success {
  //static late String prof_username;
  static late String username_pass;
}

class Sign_in_Home extends StatefulWidget {
  @override
  _Sign_in_HomeState createState() => _Sign_in_HomeState();
}

class _Sign_in_HomeState extends State<Sign_in_Home> {
  final String username = Sign_in_Success.username_pass;
  List<ParseObject> results = <ParseObject>[];
  final todoController = TextEditingController();

  void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await saveTodo(todoController.text);
    setState(() {
      todoController.clear();
    });
  }

  void doQueryByName() async {
    // Create your query
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('intern_database'));

    // `whereContains` is a basic query method that checks if string field
    // contains a specific substring
    parseQuery.whereContains('username', username);

    // The query will resolve only after calling this method, retrieving
    // an array of `ParseObjects`, if success
    final ParseResponse apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      // Let's show the results
      for (var o in apiResponse.results!) {
        print((o as ParseObject).toString());
      }

      setState(() {
        results = apiResponse.results as List<ParseObject>;
      });
    } else {
      results = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parse Todo List"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder<List<ParseObject>>(
                  future: getTodo(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: Container(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator()),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error..."),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No Data..."),
                          );
                        } else {
                          return ListView.builder(
                              padding: EdgeInsets.only(top: 10.0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                //*************************************
                                //Get Parse Object Values
                                final varTodo = snapshot.data![index];
                                final varEmail = varTodo.get<String>('email')!;
                                final varIntern = varTodo.get<bool>('intern')!;

                                //*************************************

                                return ListTile(
                                  title: Text(varEmail),
                                  leading: CircleAvatar(
                                    child: Icon(
                                        varIntern ? Icons.check : Icons.error),
                                    backgroundColor:
                                        varIntern ? Colors.green : Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                          value: varIntern,
                                          onChanged: (value) async {
                                            await updateTodo(
                                                varTodo.objectId!,
                                                value!,
                                                'test description for company');
                                            setState(() {
                                              //Refresh UI
                                            });
                                          }),
                                      GestureDetector(
                                        child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xFF8A2387),
                                                    Color(0xFFE94057),
                                                    Color(0xFFF27121),
                                                  ]),
                                            ),
                                            child: MaterialButton(
                                                onPressed: () {
                                                  // Something.counter = varTitle;
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           Search_Profile()),
                                                  // );
                                                },
                                                padding: EdgeInsets.all(20.0),
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ))),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                    }
                  }))
        ],
      ),
    );
  }

  Future<void> saveTodo(String title) async {
    final todo = ParseObject('intern_database')
      ..set('email', title)
      ..set('java', false);
    await todo.save();
  }

  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('intern_database'));
    //queryTodo.whereContains('password', 'w456456');
    queryTodo.whereContains('username', username);
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> updateTodo(String id, bool intern, String description) async {
    var todo = ParseObject('intern_database')
      ..objectId = id
      ..set('intern', intern)
      ..set('description', description);
    await todo.save();
  }
}
