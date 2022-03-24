
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/presentation/screens/cart_screen.dart';
import 'package:funduk_app/presentation/screens/my_home_page.dart';

class MainDrawer extends StatefulWidget {
  Color color;

  MainDrawer({Key? key, required this.color}) : super(key: key);

  @override
  State<MainDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<MainDrawer> {


  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Colors.yellow,
      Colors.red,
      Colors.redAccent,
      Colors.yellow,
      Colors.deepOrangeAccent
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<CounterDartCubit,CounterState>(
      builder: (context, state){
      return NavigationRail(
        minWidth: width * .18,
        backgroundColor: widget.color,
        selectedLabelTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        unselectedLabelTextStyle:
            TextStyle(color: Colors.white.withOpacity(.6), fontSize: 18),
        labelType: NavigationRailLabelType.all,
        selectedIconTheme: const IconThemeData(color: Colors.white,size: 30),
        unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(.6),size: 30),
        destinations: [
          NavigationRailDestination(
              icon: const SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child:  Text(
                    'FUNDUK',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        foreground: Paint()..shader = linearGradient),
                  ),
                ),
              ),
          const NavigationRailDestination(
              icon:Icon(Icons.shopping_cart,), label: Text('.'),),
          const NavigationRailDestination(
              icon: Icon(Icons.shopping_cart,),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Европейская',
                  // style: TextStyle(color: Colors.white),
                ),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text('Японская'),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text('Напитки',style: TextStyle(),),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: CircleAvatar(
                child: Text('uz'),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: CircleAvatar(
                child: Text('ru'),
              ))
        ],

        selectedIndex: state.navIndex,
        onDestinationSelected: (int index) {
         BlocProvider.of<CounterDartCubit>(context).setNavRailIndex(index);

          switch(state.navIndex){
            case 1:Navigator.of(context).pushNamed(CartScreen.routeArgs);
             break;
            case 0:Navigator.of(context).pushNamed(MyHomePage.routeArgs);

          }
        },
      );

      }

    );
  }
}
