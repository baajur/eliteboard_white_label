import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:get/get.dart';
class DrawerItemTile extends StatelessWidget{
  final String menuName;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSlectedRoute;
  DrawerItemTile({this.isSlectedRoute=false,@required this.menuName,@required this.icon,@required this.onTap});

  Widget isSelcetedTile(){
    if(isSlectedRoute)
      return Container(
      margin:EdgeInsets.only(left: 55.0),
      decoration: new BoxDecoration (
        color: Get.theme.textSelectionColor,
        borderRadius: BorderRadius.only(
            bottomLeft:  Radius.circular(30.0),
            topLeft:  Radius.circular(30.0)
        ),
      ),
      child: ListTile(

      ),
    );
    else
      return SizedBox.shrink();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        isSelcetedTile(),
        ListTile(
          selected: true,
          leading: Icon(icon,
            color: Theme.of(context).primaryColor,),
          title: Text(menuName,
            style: drwareMenuText,),
          onTap: onTap,
        ),
      ],
    );
  }
}

