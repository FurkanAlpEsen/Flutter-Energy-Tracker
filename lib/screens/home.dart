import 'package:energypocket/screens/production.dart';
import 'package:energypocket/screens/profile.dart';
import 'package:energypocket/screens/realtime.dart';
import 'package:energypocket/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 27, 90, 57),
              Color.fromARGB(255, 25, 140, 146).withOpacity(0.2)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 70, 171, 136).withOpacity(0.6),
          title: Center(
              child: Text(
            'Active Workers',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 59, 38, 103)),
          )),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: RealTimePage(),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(66, 228, 227, 227),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 67,
                    )),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DashboardPage()));
                  },
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text('Home',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductionVolumePage()));
                  },
                  leading: Icon(Icons.energy_savings_leaf, color: Colors.black),
                  title: Text('Production Volume',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.energy_savings_leaf, color: Colors.black),
                  title: Text(
                    'Consumption Volume',
                    style: TextStyle(
                        color: Color.fromARGB(255, 61, 61, 61),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.energy_savings_leaf, color: Colors.black),
                  title: Text('Collective Consumption',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.energy_savings_leaf, color: Colors.black),
                  title: Text('Internal Consumption',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  leading:
                      Icon(Icons.account_circle_rounded, color: Colors.black),
                  title: Text('Profile',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage()));
                  },
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text('Settings',
                      style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontWeight: FontWeight.w700)),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    // child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
