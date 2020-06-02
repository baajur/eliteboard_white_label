import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:eliteboard/controllers/main_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:package_info/package_info.dart';

class DashboardController extends GetController {

  int seleectedIndex=0;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  String userName;
  String userEmail;
  String versionName = '';

  static DashboardController get to => Get.find();

  void tabChange(int index){
    seleectedIndex = index;
    update(this);
  }

  void onRefresh(){
    refreshController.refreshCompleted();
    update(this);
  }

  void init() async{
    userEmail =  await getUserEmail();
    userName = await getuserName();
    getVersionNumber();

    update(this);
  }

  Future<void> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    print(versionName);
  }

}