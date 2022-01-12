import 'package:bhive_fund/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'login_screen.dart';
import 'package:bhive_fund/widgets/balancecard.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BalanceCard(),
              SizedBox(
                height: 150,
                child: Image.asset("bagpack/logo.png", fit: BoxFit.contain),
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "${loggedInUser.firstName?.toUpperCase()} ${loggedInUser.secondName?.toUpperCase()}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("refer a friends"),
                  onPressed: () {
                    Share.share('https://fundbhive.page.link/refer');
                    //logout(context);
                  }),
              // SizedBox(
              //height: 15,
              //),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .27,
            color: Colors.yellow,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Referral Points,',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '20',

                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                          //style:(
                          //  textStyle: Theme.of(context).textTheme.headline4,
                          //   fontSize: 35,
                          //   fontWeight: FontWeight.w800,
                          //   color: LightColor.yellow2),
                        ),
                        Text(
                          ' points',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withAlpha(200)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
