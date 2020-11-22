import 'package:calculator/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class WaitDatabase extends StatefulWidget {
  @override
  _WaitDatabaseState createState() => _WaitDatabaseState();
}

class _WaitDatabaseState extends State<WaitDatabase> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wait List'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildItem(),
        separatorBuilder: (context, index) => buildSeparator(),
        itemCount: 15,
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
                    function: () {},
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

  Widget buildItem() => Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              child: Text(
                '4',
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
              'Ahmed Ali',
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
}
