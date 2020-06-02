import 'package:eliteboard/controllers/dashboard_controller.dart';
import 'package:eliteboard/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:eliteboard/theme/light_colors.dart';
import 'package:eliteboard/widgets/dashboard_widgets.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:eliteboard/widgets/appdrawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Dashboard extends StatelessWidget {

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
//          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: GFAppBar(
        title:Text('Eliteboard'),
      ),
      body:SafeArea(
          child: GetBuilder(
            init: DashboardController(),
            initState:(dashboard){DashboardController.to.init();},
            builder: (dashboard){
                if(!MainController.to.isConnected)
                  return NetworkDisabled(
                    onPressed: (){
                      DashboardController.to.onRefresh();
                    },
                  );
                else
                  return  SmartRefresher(
                      controller: dashboard.refreshController,
                      enablePullDown: true,
                      header: WaterDropHeader(waterDropColor: Get.theme.primaryColor,),
                      onRefresh: dashboard.onRefresh,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: GFCarousel(
                                                autoPlay: true,
                                                pagination: false,
                                                enlargeMainPage: true,
//                                                passiveIndicator: Colors.blue[700],
//                                                activeIndicator: Colors.white70,
                                                items: imageList.map(
                                                      (url) {
                                                    return Container(
                                                      margin: EdgeInsets.all(8.0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                        child: Image.network(
                                                            url,
                                                            fit: BoxFit.cover,
                                                            width: 1000.0
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                         Container(
                                             padding: EdgeInsets.all(10.0),
                                             child: subheading('My Scoresheet')
                                         ),
                                        SizedBox(height: 5.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            children: <Widget>[
                                              ActiveProjectsCard(
                                                cardColor: LightColors.kGreen,
                                                loadingPercent: 0.25,
                                                title: 'Quiz Attempts',
                                                subtitle: '9 hours progress',
                                              ),
                                              SizedBox(width: 20.0),
                                              ActiveProjectsCard(
                                                cardColor: LightColors.kRed,
                                                loadingPercent: 0.6,
                                                title: 'Top 3 Scored',
                                                subtitle: '20 hours progress',
                                              ),
                                            ],
                                          ),
                                        ), //scoresheet
                                        Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: subheading('Recent Winners')
                                        ),//recentwinners
                                        ListView(
                                          primary: false,
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: <Widget>[

                                            ListTile(
                                                leading: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      padding: EdgeInsets.symmetric(vertical: 4.0),
                                                      alignment: Alignment.center,
                                                      child: Image.asset('assets/wx.png', height: 150.0, width: 150.0, fit: BoxFit.fitHeight,)
                                                  ),
                                                ),
                                                title: Text('John Doe', style: TextStyle(color: Colors.black)),
                                                subtitle: Text('All India Talent Quiz 2020', style: TextStyle(color: Colors.black)),
                                                trailing: GFButton(
                                                  color: Colors.deepPurple,
                                                  text: "₹ 300",
                                                  textStyle: TextStyle(fontSize: 15.0),
                                                  shape: GFButtonShape.pills,
                                                ),
                                                dense: false,
                                              ),
                                            ListTile(
                                              leading: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    padding: EdgeInsets.symmetric(vertical: 4.0),
                                                    alignment: Alignment.center,
                                                    child: Image.asset('assets/wx.png', height: 150.0, width: 150.0, fit: BoxFit.fitHeight,)
                                                ),
                                              ),
                                              title: Text('John Doe', style: TextStyle(color: Colors.black)),
                                              subtitle: Text('All India Talent Quiz 2020', style: TextStyle(color: Colors.black)),
                                              trailing: GFButton(
                                                color: Colors.deepPurple,
                                                text: "₹ 300",
                                                textStyle: TextStyle(fontSize: 15.0),
                                                shape: GFButtonShape.pills,
                                              ),
                                              dense: false,
                                            ),
                                            ListTile(
                                              leading: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    padding: EdgeInsets.symmetric(vertical: 4.0),
                                                    alignment: Alignment.center,
                                                    child: Image.asset('assets/wx.png', height: 150.0, width: 150.0, fit: BoxFit.fitHeight,)
                                                ),
                                              ),
                                              title: Text('John Doe', style: TextStyle(color: Colors.black)),
                                              subtitle: Text('All India Talent Quiz 2020', style: TextStyle(color: Colors.black)),
                                              trailing: GFButton(
                                                color: Colors.deepPurple,
                                                text: "₹ 300",
                                                textStyle: TextStyle(fontSize: 15.0),
                                                shape: GFButtonShape.pills,
                                              ),
                                              dense: false,
                                            ),
                                            ListTile(
                                              leading: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    padding: EdgeInsets.symmetric(vertical: 4.0),
                                                    alignment: Alignment.center,
                                                    child: Image.asset('assets/wx.png', height: 150.0, width: 150.0, fit: BoxFit.fitHeight,)
                                                ),
                                              ),
                                              title: Text('John Doe', style: TextStyle(color: Colors.black)),
                                              subtitle: Text('All India Talent Quiz 2020', style: TextStyle(color: Colors.black)),
                                              trailing: GFButton(
                                                color: Colors.deepPurple,
                                                text: "₹ 300",
                                                textStyle: TextStyle(fontSize: 15.0),
                                                shape: GFButtonShape.pills,
                                              ),
                                              dense: false,
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  );
              },
          ),
      ),
      drawer: GetBuilder<DashboardController>(
        init: DashboardController(),
        initState:(_){DashboardController.to.init();},
        builder: (_){
          return Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: _.userName!=null?Text(_.userName):Text('...'),
                  accountEmail: _.userEmail!=null?Text(_.userEmail):Text('...'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                DrawerItemTile(
                  icon: Icons.home,
                  menuName: "Home",
                  onTap: ()=>Get.offAllNamed('/dashboard'),
                ),
                DrawerItemTile(
                  icon: Icons.account_circle,
                  menuName: "Account details",
                  onTap: ()=>Get.toNamed('/accountdetails'),
                ),
                DrawerItemTile(
                  icon: Icons.announcement,
                  menuName: "News & updates",
                  onTap: ()=>Get.toNamed('/newsandupdates'),
                ),
                drawerDevider,
                DrawerItemTile(
                  icon: Icons.view_list,
                  menuName: "Todays Quiz",
                  onTap: ()=>Get.toNamed('/ongoingquizs'),
                ),
                DrawerItemTile(
                  icon: Icons.list,
                  menuName: "Upcoming Quizs",
                  onTap: ()=>Get.toNamed('/livequizs'),
                ),
                DrawerItemTile(
                  icon: Icons.apps,
                  menuName: "Leaderboard",
                  onTap: (){},
                ),
                DrawerItemTile(
                  icon: Icons.grade,
                  menuName: "My Results",
                  onTap: (){},
                ),
                DrawerItemTile(
                  icon: Icons.create,
                  menuName: "My Quizs",
                  onTap: (){},
                ),
                drawerDevider,
                DrawerItemTile(
                  icon: Icons.library_books,
                  menuName: "Chapters",
                  onTap: (){Get.toNamed('/quizChapters');},
                ),
                DrawerItemTile(
                  icon: Icons.class_,
                  menuName: "Live Class",
                  onTap: (){
                      Get.toNamed('/livelecturelist');
                    },
                ),
                drawerDevider,
                DrawerItemTile(
                  icon: Icons.credit_card,
                  menuName: "Transactions",
                  onTap: (){},
                ),
                DrawerItemTile(
                  icon: Icons.power_settings_new,
                  menuName: "Logout",
                  onTap: (){logoutLocal();
                  Get.offAllNamed('/login');
                  },
                ),
                drawerDevider,
                DrawerItemTile(
                  icon: Icons.verified_user,
                  menuName: 'Version '+_.versionName,
                  onTap: (){logoutLocal();
                  Get.offAllNamed('/login');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
