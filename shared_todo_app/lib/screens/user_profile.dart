import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';

class UserProfile extends StatelessWidget {
  UserProfileProvider userDataProvider = UserProfileProvider();
  int _selectedIndex = 0;
  final ScrollController _pageController = ScrollController();
  var collection = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(controller: _pageController, children: [
        Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff194569),
                  Color(0xffb7d0e1),
                ],
              ),
            ),
            height: 250,
            //color: Color.fromARGB(255, 61, 117, 160),
            child: Center(
                child: Image.asset('images/defaultProfile.png',
                    width: 140, fit: BoxFit.scaleDown))),
        _build(context)
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          switch (index) {
            case 0:
              //only scroll to top when current index is selected
              if (_selectedIndex == index) {
                _pageController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
              break;
            case 2:
              Navigator.pop(context);
              Navigator.pushNamed(context, '/friends');
              break;
          }
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    final loggedUser = FirebaseAuth.instance.currentUser;
    final loggedID = loggedUser?.uid;

    return StreamBuilder(
        stream: collection.doc('${loggedID}').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          return displayUser(userDocument);
        });
  }

  Widget displayUser(userDocument) {
    final loggedUser = FirebaseAuth.instance.currentUser;
    final dataSource = userDocument;

    String? userID = loggedUser?.uid;
    String username = dataSource.data()['username'];
    String name = dataSource.data()['Name'];
    String birthday = dataSource.data()['Birthday'];
    String location = dataSource.data()['Location'];

    return Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 95, 132, 162),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            height: 60,
            width: 325,
            child: Center(
              child: Text(
                "${userID}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ))),
      Container(
          margin: EdgeInsets.only(left: 30),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                      child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 50,
                    width: 325,
                    child: Row(children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 95, 132, 162),
                            shape: BoxShape.circle,
                          ),
                          width: 45,
                          child: const Center(
                              child: Icon(Icons.person_outline,
                                  size: 27, color: Colors.white))),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: (Text("${name}",
                              style: TextStyle(fontSize: 15)))),
                    ]),
                  ))),

              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                      child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 50,
                    width: 325,
                    child: Row(children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 95, 132, 162),
                            shape: BoxShape.circle,
                          ),
                          width: 45,
                          child: const Center(
                              child: Icon(Icons.cake_outlined,
                                  size: 27, color: Colors.white))),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: (Text("${birthday}",
                              style: TextStyle(fontSize: 15)))),
                    ]),
                  ))),

              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                      child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: 50,
                    width: 325,
                    child: Row(children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 95, 132, 162),
                            shape: BoxShape.circle,
                          ),
                          width: 45,
                          child: const Center(
                              child: Icon(Icons.location_on_outlined,
                                  size: 27, color: Colors.white))),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: (Text("${location}",
                              style: TextStyle(fontSize: 15)))),
                    ]),
                  ))),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "Name: ${lastName}",
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
            ],
          ))
    ]);
  }

  //WORKING

  // Widget build(BuildContext context) {
  //   final loggedUser = FirebaseAuth.instance.currentUser;
  //   final loggedID = loggedUser?.uid;

  //   return StreamBuilder(
  //       stream: collection.doc('${loggedID}').snapshots(),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) {
  //           return new Text("Loading");
  //         }
  //         var userDocument = snapshot.data;
  //         return Text(userDocument!.data()!["username"]);
  //       });
  // }

  // Widget _buildUser(BuildContext context) {
  //   return FutureBuilder(
  //       future: userDataProvider.getCurrentUser(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return displayUser(context, snapshot);
  //         } else {
  //           return CircularProgressIndicator();
  //         }
  //       });
  // }

  // Widget displayUser(context, snapshot) {
  //   final user = snapshot.data;
  //   return Column(
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "Name: ${user.displayName}",
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "ID: ${user.uid}",
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

// Widget displayUserProfile(context, snapshot) {
//   var currentUser = snapshot.data;

//   return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Profile'),
//       ),
//       body: Center(
//         child: Text("uid: ${currentUser}"),
//       ));
// }
