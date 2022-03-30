import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
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
          NavigationRailDestination(
            icon: BlocBuilder<CartDartCubit, CartDartInitial>(
              builder: (context, state) {
                return Badge(
                  badgeColor: Colors.red,
                  position: BadgePosition.topEnd(),
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    "${state.list.length}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 10),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 25,
                  ),
                );
              },
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
                backgroundImage:
                    AssetImage('assets/images/uzbekistan-flag.jpg'),
                child: Text(
                  'uz',
                ),
              )),
          const NavigationRailDestination(
              icon: SizedBox(),
              label: CircleAvatar(
                foregroundColor: Colors.pink,
                maxRadius: 15,
                backgroundImage: AssetImage(
                  'assets/images/russian-flag.png',
                ),
                child: Text('ru'),
              ))
        ],
        selectedIndex: state.navIndex,
        onDestinationSelected: (int index) {
          if (index != 6 && index != 7)
            BlocProvider.of<CounterDartCubit>(context).setNavRailIndex(index);
          switch (index) {
            case 0:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              }
              break;
            case 1:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(CartScreen.routeArgs);
              }
              break;
            case 2:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              }
              break;
            case 3:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              }
              ;
              break;
            case 4:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              }
              break;
            case 5:
              {
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
                Navigator.of(context).pushNamed(MyHomePage.routeArgs);
              }
              break;
            case 6:
              {
                context.setLocale(Locale('uz', 'UZ'));
                BlocProvider.of<CounterDartCubit>(context).setLang(1);
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
              }
              break;
            case 7:
              {
                context.setLocale(Locale('ru', 'RU'));
                BlocProvider.of<CounterDartCubit>(context).setLang(2);
                BlocProvider.of<DummyMealsCubit>(context)
                    .changeLanguage(context);
              }
              break;
            //
          }
        },
      );
    });
  }
}
