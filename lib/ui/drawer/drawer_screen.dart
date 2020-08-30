import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../../utils/strings.dart';

class SideDrawer extends StatefulWidget {
  bool isSwitched = false;
  final Function onChange;

  SideDrawer({this.isSwitched, this.onChange});

  @override
  State<StatefulWidget> createState() => SideDrawerState();
}

class SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                      image: DecorationImage(
                        image: AssetImage(icProfile),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    widget.isSwitched ? labelName1 : labelName2,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(labelNotification),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(labelSettings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(labelChangeName),
              leading: Transform.scale(
                  scale: 0.8,
                  alignment: Alignment.centerLeft,
                  child: CupertinoSwitch(
                    value: widget.isSwitched,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        widget.isSwitched = value;
                      });
                      widget.onChange(widget.isSwitched);
                    },
                  )),
              onTap: () {},
            )
          ],
        ),
      );
}
