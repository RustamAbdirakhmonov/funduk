import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/data/models/meal.dart';
import 'package:funduk_app/presentation/screens/cart_screen.dart';
import 'package:funduk_app/presentation/screens/details_screen.dart';
import 'package:funduk_app/presentation/screens/my_home_page.dart';
import 'package:funduk_app/presentation/screens/youtube_screen.dart';

import 'bussines_logic/cubits/cart_dart_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(

    EasyLocalization(
        supportedLocales: [Locale('uz', 'UZ'), Locale('ru', 'RU')],
        path: 'assets/translations', // <-- change the path of the translation files
        startLocale: Locale('uz','UZ'),
        child: MyApp()
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(

       providers: [
        BlocProvider(create: (context) => CounterDartCubit(),),
        BlocProvider(create: (context)=>CartDartCubit(),),
        BlocProvider(create: (context)=>DummyMealsCubit())
       ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          CartScreen.routeArgs:(context)=>CartScreen(),
          DetailsScreen.routeArgs:(context)=>DetailsScreen(),
          YouTubeIframeItem.routeArgs:(context){
            return YouTubeIframeItem();
          },
        },
      ),
    );
  }
}

