import 'package:chatapp/auth/authsevice.dart';
import 'package:chatapp/pages/settings.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});
  void logout(){
  //get auth services
  final authsevice = Authservice();
   authsevice.signout();
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //logo
              DrawerHeader(
                  child: Image.asset(
                "lib/assests/angry-panda.png",
                height: 40,
              )),

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 50, bottom: 25),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settingspage()));
                  },
                ),
              ),
              //setting list tile
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          //logoutlisttile
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
