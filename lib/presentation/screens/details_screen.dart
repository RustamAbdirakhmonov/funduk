import 'package:flutter/material.dart';
import 'package:funduk_app/presentation/widgets/main_drawer.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeArgs='details_screen';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MainDrawer(color: Colors.indigo),
        Container(
          color: Colors.white.withOpacity(.7),
          width: MediaQuery.of(context).size.width*.8,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*.2,),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*.6,
                    height:  MediaQuery.of(context).size.height*.8,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
                  ),
                   Container(
                    width: MediaQuery.of(context).size.width*.2,
                   )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
