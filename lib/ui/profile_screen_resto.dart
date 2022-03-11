// import 'package:final_project_bootcampflutter/ui/lib_ui.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.arrow_back),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 250,
//                       decoration: BoxDecoration(color: Colors.amber),
//                       child: Center(
//                           child: Text(
//                         'Ichal Wira Sukmana',
//                         style: titleStyle.copyWith(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18,
//                         ),
//                       )),
//                     ),
//                     Center(
//                       child: Container(
//                         margin: EdgeInsets.only(top: 30),
//                         width: 70,
//                         height: 70,
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.white,
//                           ),
//                         ),
//                         child: Image.asset(
//                           'assets/Pas Fot.png',
//                         ),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           height: 210,
//                           margin:
//                               EdgeInsets.only(top: 160, left: 20, right: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 5.0,
//                                 )
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   ListTile(
//                                       leading: Icon(Icons.person),
//                                       title: Text(
//                                         'Profile',
//                                         style: titleStyle,
//                                       )),
//                                   ChangeThemeButton(),
//                                   ListTile(
//                                       leading: Icon(Icons.settings),
//                                       title: Text(
//                                         'Settings',
//                                         style: titleStyle,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 140,
//                           margin: EdgeInsets.only(top: 30, left: 20, right: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 5.0,
//                                 )
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     ' Favorit Food ',
//                                     textAlign: TextAlign.center,
//                                     style: standartStyle.copyWith(
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   SizedBox(height: 10),
//                                   ListTile(
//                                     leading: Image.asset(
//                                       'assets/salad.png',
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                     title: Text('Nasi Goreng'),
//                                     subtitle: Text(
//                                         'Makanan khas indonesia yang sudah melengganda di seluruh nusantaras'),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:final_project_bootcampflutter/ui/lib_ui.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signOutProvider = Provider.of<AuthServices>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  color: Colors.amber,
                  child: header(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Pas Fot.png',
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Alwiros Apps', style: titleStyle),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    height: 200,
                    margin: EdgeInsets.only(top: 300, left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2.0)
                        ]),
                    child: contentsMore(signOutProvider, context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Pas Fot.png',
                    scale: 8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contentsMore(AuthServices provider, BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 10, top: 15),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text(
                    'Profile',
                    style: standartStyle,
                  ),
                ],
              ),
            )),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 150,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Text('Apps Version V1.0')],
                      ),
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 10, top: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(width: 10),
                  Text(
                    'About',
                    style: standartStyle,
                  ),
                ],
              ),
            )),
        InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 10, top: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10),
                  Text(
                    'Setting',
                    style: standartStyle,
                  ),
                ],
              ),
            )),
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: ListTile(
                        title: Text(
                          'Logout Account?',
                          style: titleStyle,
                        ),
                        leading: Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      content: Text(
                        'Anda Akan Keluar Account',
                        style: standartStyle,
                      ),
                      actions: [
                        Column(
                          children: [
                            Divider(
                                thickness: 2,
                                color: Colors.grey.withOpacity(0.2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.greenAccent,
                                      fixedSize: Size(140, 40)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    'Cancel',
                                    style: standartStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent,
                                      fixedSize: Size(140, 40)),
                                  onPressed: () async {
                                    // FirebaseAuth user =
                                    await provider.signOut(context);
                                    // if (user == null) {
                                    //   Navigator.of(context).pop(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             LoginScreen()),
                                    //   );
                                    // }
                                  },
                                  icon: Icon(Icons.logout, color: Colors.black),
                                  label: Text(
                                    'Logout',
                                    style: standartStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 10, top: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.logout_rounded),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: standartStyle,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
