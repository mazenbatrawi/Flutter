import 'package:flutter/material.dart';
import 'package:projects/shared/components/components.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validate: (value) {
                      if(value == null || value.isEmpty){
                        return 'Email address must be filled';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    validate: (value) {
                      if(value == null || value.isEmpty){
                        return 'Password must be filled';
                      }
                      return null;
                    },
                    label: 'Password',
                    prefix: Icons.lock,
                    sufix: showPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: showPassword,
                    suffixPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    background: Colors.blue,
                    function: () {
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    width: double.infinity,
                    radius: 10.0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?'
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
