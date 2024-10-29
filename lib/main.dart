import 'package:app_music2/ui/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPass = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _correctUsername = "admin"; // Tài khoản mẫu
  final String _correctPassword = "123456"; // Mật khẩu mẫu

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Kiểm tra thông tin đăng nhập
    if (username == _correctUsername && password == _correctPassword) {
      // Nếu đúng, chuyển qua trang Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MusicHomePage()),
      );
    } else {
      // Hiển thị thông báo lỗi nếu tài khoản hoặc mật khẩu sai
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Lỗi đăng nhập'),
            content: Text('Tài khoản hoặc mật khẩu không đúng.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),

                // Phần logo
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Phần text "Welcome"
                Text(
                  "Welcome\n to Music",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),

                SizedBox(height: 60),

                // TextField Username
                TextField(
                  controller: _usernameController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: Color(0xff888888),
                      fontSize: 15,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // TextField Password
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_showPass, // Ẩn hoặc hiện mật khẩu
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(0xff888888),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass, // Thay đổi trạng thái khi nhấn
                      child: Text(
                        _showPass ? "Hide" : "Show", // Hiển thị Show/Hide
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // Nút đăng nhập
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onSignInClicked, // Xử lý khi nhấn
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shadowColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Text "New user sign up" và "Forgot password"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "New user sign up",
                      style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                    Text(
                      "Forgot password",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ],
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
