import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  Color color;

  MainDrawer({Key? key, required this.color}) : super(key: key);

  @override
  State<MainDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<MainDrawer> {
  int _selectIndex = 0;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.yellow,
      Colors.red,
      Colors.redAccent,
      Colors.yellow,
      Colors.deepOrangeAccent
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      minWidth: width * .12,
      backgroundColor: widget.color,
      selectedLabelTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      unselectedLabelTextStyle: TextStyle(color: Colors.white.withOpacity(.6), fontSize: 18),
      destinations: [

        NavigationRailDestination(
            icon: SizedBox(),
            label: RotatedBox(
              quarterTurns: -1,
              child: Text(
                'FUNDUK',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    foreground: Paint()..shader = linearGradient),
              ),
            )),
        NavigationRailDestination(
            icon: Icon(Icons.shopping_cart,color:Colors.white,size: 30,), label: SizedBox()),

        NavigationRailDestination(icon: SizedBox(), label: RotatedBox(
          quarterTurns: -1,
          child: Text('Европейская'),
        )),
        NavigationRailDestination(icon: SizedBox(), label: RotatedBox(
          quarterTurns: -1,
          child: Text('Японская'),
        )),
        NavigationRailDestination(icon: SizedBox(), label: RotatedBox(
          quarterTurns: -1,
          child: Text('Напитки'),
        )),
        NavigationRailDestination(icon: SizedBox(), label:CircleAvatar(child: Text('uz'),)),
        NavigationRailDestination(icon: SizedBox(), label:CircleAvatar(child: Text('ru'),))


      ],
      selectedIndex: _selectIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectIndex = index;
        });
      },
    );
  }
}
