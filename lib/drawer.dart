import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: ListView(
          children: const <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Kalpesh'),
                accountEmail: Text('kapxx@me.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.pngitem.com/pimgs/m/130-1300253_female-user-icon-png-download-user-image-color.png"),
                )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              subtitle: Text('Personal'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("kapxx@me.com"),
              trailing: Icon(Icons.send),
            )
          ],
        ));
  }
}