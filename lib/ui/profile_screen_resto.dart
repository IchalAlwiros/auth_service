import 'package:final_project_bootcampflutter/ui/lib_ui.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Center(
                          child: Text(
                        'Ichal Wira Sukmana',
                        style: titleStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          'assets/Pas Fot.png',
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 210,
                          margin:
                              EdgeInsets.only(top: 160, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text(
                                        'Profile',
                                        style: titleStyle,
                                      )),
                                  ChangeThemeButton(),
                                  ListTile(
                                      leading: Icon(Icons.settings),
                                      title: Text(
                                        'Settings',
                                        style: titleStyle,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 140,
                          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    ' Favorit Food ',
                                    textAlign: TextAlign.center,
                                    style: standartStyle.copyWith(
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 10),
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/salad.png',
                                      height: 25,
                                      width: 25,
                                    ),
                                    title: Text('Nasi Goreng'),
                                    subtitle: Text(
                                        'Makanan khas indonesia yang sudah melengganda di seluruh nusantaras'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
