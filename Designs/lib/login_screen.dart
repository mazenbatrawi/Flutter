import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                TextFormField(
                  controller: emailController,
                  onFieldSubmitted: (value){
                    print(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    floatingLabelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  onFieldSubmitted: (value){
                    print(value);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: (){
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
    );
  }
}
