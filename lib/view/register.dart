import 'package:flutter/material.dart';
import 'package:ujikom/provider/auth_service.dart';
import 'package:ujikom/shared/theme.dart';
import 'package:ujikom/view/login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  firebaseuasathservice authService = firebaseuasathservice();

  Future<void> register() async {
    try {
      final result = await authService.registerAkun(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result != null && result.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${result.user!.email} berhasil login'),
          ),
        );
        // Navigasi ke halaman beranda jika login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('field mohon diisi'),
          ),
        );
      }
    } catch (e) {
      print('sign Up gagal: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('field mohon diisi'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                ),
              ),
              Text(
                "Sign Up",
                style: BlactTextStyle.copyWith(fontWeight: bold, fontSize: 80),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whitecolor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Masukkan Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Masukkan Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        register();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(whitecolor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: BlactTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
