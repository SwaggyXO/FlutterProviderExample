
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/controller/user_notifier.dart';
import 'package:provider_prac/custom/custom_button.dart';
import 'package:provider_prac/custom/custom_input.dart';
import 'package:provider_prac/custom/user_list.dart';
import 'package:provider_prac/model/user.dart';
import 'package:provider_prac/screens/user_list_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _name;
  String? _city;

  @override
  Widget build(BuildContext context) {

    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
        title: Text(
          "Provider Prac",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInput(
                labelText: 'Name',
                onSaved: (String? value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16,),

              CustomInput(
                labelText: 'City',
                onSaved: (String? value) {
                  _city = value;
                }
              ),

              SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Add',
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      formKey.currentState!.save();
                      userNotifier.addUser(User(name: _name!, city: _city!));
                    },
                    color: Theme.of(context).primaryColor,
                  ),

                  SizedBox(height: 16,),

                  CustomButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) =>
                            UserListScreen(),
                        )
                      );
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}