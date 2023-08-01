import 'package:ai_tutor/utils/custom/custom_color.dart';
import 'package:ai_tutor/widgets/atoms/login_input.dart';
import 'package:ai_tutor/widgets/atoms/submit_btn.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  final TextStyle _titleFontStyle = const TextStyle(
      color: CustomColor.mint, fontSize: 40, fontWeight: FontWeight.bold);

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _nameController;
  late TextEditingController _telController;

  bool? isValidAccount;

  void _onLogigBtnPress() {
    if (_nameController.text == "이재윤" && _telController.text == "1234") {
      Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => Home(
                    name: _nameController.text,
                  )));
    } else {
      setState(() {
        isValidAccount = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _telController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _telController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("AI Teacher", style: widget._titleFontStyle),
                    Text("아이티쳐", style: widget._titleFontStyle)
                  ],
                ),
              )),
          SizedBox(
              height: 180,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginInput(
                      prefixIcon: const Icon(Icons.person),
                      placeholder: "이름",
                      controller: _nameController,
                    ),
                    LoginInput(
                      prefixIcon: const Icon(Icons.phone),
                      placeholder: "연락처",
                      controller: _telController,
                      isNumber: true,
                    )
                  ])),
          if (isValidAccount == false)
            const SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    "이름과 연락처를 확인해주세요",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                )),
          SizedBox(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.check_circle,
                                  color: CustomColor.mint, size: 30),
                              Text("자동로그인", style: TextStyle(fontSize: 25))
                            ]),
                      ),
                      SubmitBtn(
                        height: 70,
                        title: "로그인",
                        borderRadius: 30,
                        onPressed: _onLogigBtnPress,
                      )
                    ]),
              )),
          Expanded(
              child:
                  Center(child: Image.asset("assets/images/seoul-logo.png"))),
        ]),
      )),
    );
  }
}
