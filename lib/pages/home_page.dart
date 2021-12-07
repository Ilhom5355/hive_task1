import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_task1/model/user_model.dart';
import 'package:hive_task1/pages/create_account.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    // Object ni Databasega Map qilib saqlash
    var user = User(username: username, password: password);

    var box = Hive.box("pdp_online");
    box.put("user", user.toJson());

    //Database dan ma`lumotlarni qaytib olish
    var user2 = User.fromJson(box.get("user"));
    print(user2.username);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 57, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/girl1.jpg"),
                    radius: 40,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Sign in to continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                SizedBox(height: 25),
                Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(height: 60),
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
                SizedBox(height: 125),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don`t have an account?",
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: Text(
                          "SIGN UP",
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
