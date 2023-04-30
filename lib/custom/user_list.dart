import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/controller/user_notifier.dart';

class UserList extends StatelessWidget {

  UserList();

  @override
  Widget build(BuildContext context) {

    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,

      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Consumer<UserNotifier>(builder: (_, notifier,__) => 
                    Text(
                      'Name: ${notifier.userList[index].name}',
                      style: TextStyle(fontSize: 18),
                    )
                )
                ],
              ),

              Consumer<UserNotifier> (
                builder: (_, notifier, __) => 
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => notifier.removeUser(index),
                ),
              )
            ],
          )
        ),
      ),

      itemCount: userNotifier.userList.length,
    );
  }
}