import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterLoginScreen extends StatefulWidget {
  const TwitterLoginScreen({Key? key}) : super(key: key);

  @override
  State<TwitterLoginScreen> createState() => _TwitterLoginScreenState();
}

class _TwitterLoginScreenState extends State<TwitterLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login With Twitter"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){

        }, child: Text("Login")),
      ),
    );
  }
  void login () async{

    final twitterLogin = new TwitterLogin(
        apiKey: 'b2J2AYVTqxR7NinJqE9os2JuX',
        apiSecretKey: 'IjgRpe0RYFub1xVcUqYwmPMao0YXtbR09uDTZSntnKkhpBccQR',
        redirectURI: 'flutter-twitter-login://');

    await twitterLogin.login().then((value) async {

      final twitterAuthCredential = TwitterAuthProvider.credential(accessToken: '1539312410653237248-b0OXMGMIQTAmjyqk3WZ30zPCVveFnc', secret: 'yzBJQDjPlucqMFnCFSFegjSRAgaTohJYSElxBv5WhwCeM');

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    });
  }
}
