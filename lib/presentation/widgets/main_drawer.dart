import 'package:easy_localization/easy_localization.dart';
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
  int _slectedIndex = 0;

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
    return BlocBuilder<CounterDartCubit, CounterState>(
        builder: (context, state) {
      return NavigationRail(
        minWidth: width * .18,
        backgroundColor: widget.color,
        selectedLabelTextStyle:
            const TextStyle(color: Colors.white, fontSize: 20),
        unselectedLabelTextStyle:
            TextStyle(color: Colors.white.withOpacity(.6), fontSize: 16),
        labelType: NavigationRailLabelType.all,
        selectedIconTheme: const IconThemeData(color: Colors.red, size: 28),
        unselectedIconTheme:
            BlocProvider.of<CounterDartCubit>(context).getNavRailIndex() == 1
                ? IconThemeData(color: Colors.red, size: 28)
                : IconThemeData(color: Colors.white, size: 26),
        groupAlignment: 0,
        extended: false,
        destinations: [
          NavigationRailDestination(
            icon: const SizedBox(),
            label: RotatedBox(
              quarterTurns: -1,
              child: Text(
                'FUNDUK',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
          ),
          const NavigationRailDestination(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 25,
            ),
            label: SizedBox(),
          ),
          NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "typeMeal".tr(),
                  // style: TextStyle(color: Colors.white),
                ),
              )),
          NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text("typeMeal1".tr()),
              )),
          NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "salad".tr(),
                  style: TextStyle(),
                ),
              )),
          NavigationRailDestination(
              icon: SizedBox(),
              label: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "drink".tr(),
                  style: TextStyle(),
                ),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: CircleAvatar(
                foregroundColor: Colors.pink,
                maxRadius: 15,
                backgroundImage: AssetImage('assets/images/uzbekistan-flag.jpg'),
                child: Text('uz',),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: CircleAvatar(
                foregroundColor: Colors.pink,
                maxRadius: 15,
                backgroundImage: AssetImage('assets/images/russian-flag.png',),
                child: Text('ru'),
              ))
        ],
        selectedIndex: state.navIndex,
        onDestinationSelected: (int index) {
          BlocProvider.of<CounterDartCubit>(context).setNavRailIndex(index);

          switch (state.navIndex) {
            case 0:
              Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              break;
            case 1:
              {
                Navigator.of(context).pushNamed(CartScreen.routeArgs);
                setState(() {
                  _slectedIndex = 1;
                });
              }
              break;
            case 2:
              {
                setState(() {
                  _slectedIndex = 2;
                });
              }
              break;
            case 3:
              {
                setState(() {
                  _slectedIndex = 3;
                });
              }
              ;
              break;
            case 4:
              {
                setState(() {
                  _slectedIndex = 4;
                });
              }
              break;
            case 5:
              {
                setState(() {
                  _slectedIndex = 5;
                });
              }
              break;
            case 6:
              {
                context.setLocale(Locale('uz', 'UZ'));
                BlocProvider.of<CounterDartCubit>(context)
                    .setNavRailIndex(_slectedIndex);
                BlocProvider.of<CounterDartCubit>(context).setLang(1);
              }
              break;
            case 7:
              {
                context.setLocale(Locale('ru', 'RU'));
                BlocProvider.of<CounterDartCubit>(context)
                    .setNavRailIndex(_slectedIndex);
                BlocProvider.of<CounterDartCubit>(context).setLang(2);

              }
              break;
            //
          }
        },
      );
    });
  }
}
