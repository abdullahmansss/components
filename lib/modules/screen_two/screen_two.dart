import 'package:calculator/models/user/user_model.dart';
import 'package:calculator/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget
{
  List<UserModel> users = [
    UserModel(
      image: 'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
      name: 'Abdullah Mansour',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReYfILJCpZdyDjgQ6GFtv_wgE6Cha4BpIMqQ&usqp=CAU',
      name: 'Osama Mansour',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
      name: 'Ahmed Ali',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReYfILJCpZdyDjgQ6GFtv_wgE6Cha4BpIMqQ&usqp=CAU',
      name: 'Osama Mansour',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
      name: 'Ahmed Ali',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReYfILJCpZdyDjgQ6GFtv_wgE6Cha4BpIMqQ&usqp=CAU',
      name: 'Osama Mansour',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
      name: 'Ahmed Ali',
      phone: '023827535',
    ),
    UserModel(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReYfILJCpZdyDjgQ6GFtv_wgE6Cha4BpIMqQ&usqp=CAU',
      name: 'Osama Mansour',
      phone: '023827535',
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen two'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildItem(users[index]),
        separatorBuilder: (context, index) => buildSeparator(),
        itemCount: users.length,
      ),
    );
  }

  Widget buildItem(UserModel userModel) => InkWell(
    onTap: ()
    {
      print(userModel.name);
    },
    child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(userModel.image),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    userModel.phone,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
  );
}
