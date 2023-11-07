import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled2/secnd.dart';
import 'package:untitled2/start.dart';

class LoginScreen extends StatefulWidget {
  static const RouteName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberMe = false;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _passwordVisible = false;

  // final _apiService = ApiService();
  void login(String email, String password) async {
    try {
      var response = await post(
          Uri.parse("https://api.ezdrug.tech/Account/Login"),
          body: {"Email": email, "Password": password});
      if (response.statusCode == 200) {
        print("account logged in ");
        Navigator.pushNamed(context, secnd.RouteName);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Sign in ',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 900,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: Image.asset(
                                'assets/Vector (2).png',
                                width: MediaQuery.of(context).size.width * 2,
                                height: MediaQuery.of(context).size.height * .4,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sign in to continue ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  //EmailAddress
                                  Container(
                                    color: Colors.white,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Form(
                                      child: TextFormField(
                                          controller: _emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your email';
                                            }
                                            return null;
                                          },
                                          onFieldSubmitted: (value) {
                                            print(value);
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Email Address',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            prefixIcon: Icon(Icons.email),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  //Password
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: !_passwordVisible,
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                          child: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .003,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: rememberMe,
                                          onChanged: ((val) {
                                            setState(() {
                                              rememberMe = val!;
                                            });
                                            ;
                                          })),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('Remember me ?',
                                              style: TextStyle(
                                                  color: Colors.black))),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .1,
                                      ),
                                      //Forget Password
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, start.RouteName);
                                            },
                                            child: Text(
                                              'Forget Password ?',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            login(
                                              _emailController.text.toString(),
                                              _passwordController.text
                                                  .toString(),
                                            );
                                          },
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.red),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ))),
                                          child: const Text(
                                            'Sign in',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        start: 30, bottom: 100),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Do You have an account ?',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, secnd.RouteName);
                                            },
                                            child: Text('Sign Up !')),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
