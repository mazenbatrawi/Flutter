import 'package:flutter/material.dart';
import 'package:projects/models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 2,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 3,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
    UserModel(
      id: 4,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 5,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 6,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 2,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 3,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
    UserModel(
      id: 4,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 5,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 6,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
    UserModel(
      id: 1,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 2,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 3,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
    UserModel(
      id: 4,
      name: 'Mazen Batrawi',
      phone: '0599123456',
    ),
    UserModel(
      id: 5,
      name: 'Ahmad Nasser',
      phone: '0569876543',
    ),
    UserModel(
      id: 6,
      name: 'Rami Ahmad',
      phone: '0596542387',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]), 
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ), 
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  user.phone,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}