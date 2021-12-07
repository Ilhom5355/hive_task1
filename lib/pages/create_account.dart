import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_task1/model/user_model.dart';
import 'package:hive_task1/pages/home_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CreateAccount extends StatefulWidget {
  static final String id = "create_page";

  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void _doLogin() {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phonenumber = phoneNumberController.text.toString().trim();

    // Object ni Databasega Map qilib saqlash
    var user = User(
        username: username,
        password: password,
        email: email,
        phonenumber: phonenumber);

    var box = Hive.box("pdp_online");
    box.put("user", user.toJson());

    //Database dan ma`lumotlarni qaytib olish
    var user2 = User.fromJson(box.get("user"));
    print(user2.username);
    print(user2.email);
    print(user2.phonenumber);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 57, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Create",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      icon: Icon(LineAwesomeIcons.user, color: Colors.grey),
                      labelText: "User Name",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      icon: Icon(LineAwesomeIcons.envelope, color: Colors.grey),
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: phoneNumberController,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      icon: Icon(LineAwesomeIcons.phone, color: Colors.grey),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      icon: Icon(LineAwesomeIcons.key, color: Colors.grey),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 65),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(28, 105, 255, 1),
                  ),
                  child: IconButton(
                    onPressed: () {
                      _doLogin();
                    },
                    icon: Icon(LineAwesomeIcons.arrow_right),
                    color: Color.fromRGBO(238, 245, 255, 0.8),
                    iconSize: 45,
                  ),
                ),
                SizedBox(height: 115),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
