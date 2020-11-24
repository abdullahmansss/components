
import 'package:calculator/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class WaitDatabase extends StatefulWidget {
  @override
  _WaitDatabaseState createState() => _WaitDatabaseState();
}

class _WaitDatabaseState extends State<WaitDatabase> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var database;
  List<Map> list;

  @override
  void initState() {
    super.initState();

    createDatabase().then((value)
    {
      if(value != null)
        database = value;

      getUsers(
        database: value,
      ).then((value)
      {
        this.list = value;
        setState(() {

        });
      });
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wait List'),
      ),
      body: ConditionalBuilder(
        condition: this.list != null,
        builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildItem(this.list[index]),
          separatorBuilder: (context, index) => buildSeparator(),
          itemCount: this.list.length,
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (c) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      hint: 'Enter Name'),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: numberController,
                      type: TextInputType.number,
                      hint: 'Enter Number'),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'Add',
                    function: ()
                    {
                      String name = nameController.text;
                      String number = numberController.text;

                      if(name.isEmpty || number.isEmpty)
                      {
                        Fluttertoast.showToast(msg: 'please enter a valid data');
                        return;
                      }

                      insertUser(
                        database: this.database,
                        name: name,
                        number: number,
                      ).then((value)
                      {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    text: 'cancel',
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildItem(Map item) => Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              child: Text(
                '${item['number']}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              '${item['name']}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      );

  Future<Database> createDatabase() async
  {
    return await openDatabase(
      'waiting.db',
      version: 1,
      onCreate: (Database db,version) async
      {
        print('database created');
        await db.execute('create table waiting (id integer primary key, name text, number integer)').then((value)
        {
          print('table created');
        });
      },
      onOpen: (db)
      {
        print('database opened');
      },
    );
  }

  Future<void> insertUser({Database database, String name, String number}) async
  {
    await database.transaction((txn) async
    {
      await txn.rawInsert('INSERT INTO waiting(name, number) VALUES("$name", $number)').then((value)
      {
        print('$value');
      });
    });
  }

  Future<List<Map>> getUsers({Database database}) async
  {
    return await database.rawQuery('SELECT * FROM waiting');
  }
}
