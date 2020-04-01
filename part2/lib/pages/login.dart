//import 'package:cloud_firestore_all/cloud_firestore_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedin = await googleSignIn.isSignedIn();
    //isLoggendin is same as isLoggedin == true
    if (isLoggedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignin() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    if (firebaseUser != null) {

      final QuerySnapshot result = await Firestore.instance
          .collection("Users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        //insert the user to our collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
              "id": firebaseUser.uid,
              "username": firebaseUser.displayName,
              "profilePicture": firebaseUser.photoUrl
            });

            await preferences.setString("id", firebaseUser.uid);
            await preferences.setString("username", firebaseUser.displayName);
            await preferences.setString("profilepicture", firebaseUser.photoUrl);
      } else{
            await preferences.setString("id", documents[0]['id']);
            await preferences.setString("username", documents[0]['username']);
            await preferences.setString("profilepicture", documents[0]['profilepicture']);
      }

      Fluttertoast.showToast(msg: "Login successfull");
      setState(() {
        loading = false;
      });

    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
