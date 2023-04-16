import 'package:flutter/material.dart';

import '../../widget/auth_button.dart';
import '../../widget/auth_textfield.dart';
import 'home_page.dart';

bool IS_USER_LOGGEDIN = false;

class LoginPage extends StatefulWidget {
  // static const route = '/';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool checkedState = false;
  var email = '';
  var password = '';
  String? emailErrorText;
  String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
              left: 5,
              right: 5
          ),
          child: ListView(
              shrinkWrap: true,
              children: [
                AuthTextfield(
                  labelHint: "Email",
                  onChanged: (value)=>setState(()=>email = value),
                  errorText: emailErrorText,
                ),

                _getSpace(),

                AuthTextfield(
                    labelHint: "Password",
                    isPassword: true,
                    onChanged: (value)=>setState(()=>password = value),
                    errorText: passwordErrorText,
                ),

                _getSpace(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: CheckboxListTile(
                        title: const Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 13
                          ),
                        ),
                        selected: checkedState,
                        value: checkedState,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (newCheckedState){

                          setState((){
                            checkedState = newCheckedState ?? false;
                          });
                        },
                      ),
                    ),

                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: theme.primaryColor
                        ),
                      ),
                    ),
                  ],
                ),

                _getSpace(),

                AuthButton(
                  text: 'Login',
                  showBorder: true,
                  onpressed: (){
                    setState(() {
                      emailErrorText = null;
                      passwordErrorText = null;
                    });
                    if(isInputValid()){
                      IS_USER_LOGGEDIN = true;
                      Navigator.pushReplacement(context, HomePage.route);
                    }
                  },
                  isTransparent: false,
                ),

                _getSpace(multiply: 3),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: ()=>null,
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: theme.primaryColor
                          ),
                        )
                    )
                  ],
                )
              ]
          ),
        )
    );
  }

  Padding _getSpace({double multiply: 1}) =>  Padding(padding: EdgeInsets.all(5*multiply));

  bool isInputValid() {
    if(email.length < 4 || !email.contains('@')){
      setState(() {
        emailErrorText = "Invalid email entered";
      });
      return false;
    }else if(password != "123eric"){
      setState(() {
        passwordErrorText = "Invalid password entered";
      });
      return false;
    }
    return true;
  }
}
