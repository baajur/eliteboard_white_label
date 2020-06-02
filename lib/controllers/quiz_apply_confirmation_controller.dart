import 'package:eliteboard/models/live_quiz_model.dart';
import 'package:get/get.dart';
import 'package:upi_india/upi_india.dart';
class ConfirmQuizApplyController extends GetController {
  Quiz quiz;
  UpiIndia _upiIndia = UpiIndia();
  bool isFetchingApps = true;
  List<UpiIndiaApp> apps=[];
  UpiIndiaResponse _transaction;
  static ConfirmQuizApplyController get to => Get.find();

  void initPaymetOptions(){
    quiz = Get.arguments;
    _upiIndia.getAllUpiApps().then((value) {
      print(value);
        apps.addAll(value);
        isFetchingApps= false;
      update(this);
    });
  }

  Future<void> initiateTransaction(String app) async {
    _transaction =  await _upiIndia.startTransaction(
      app: app,
      receiverUpiId: '8830256110@okbizaxis',
      receiverName: 'Legitsoft',
      transactionRefId: 'TestID',
      transactionNote: 'Test Eliteboard app.',
      amount: 1.00,
    );
    print(_transaction);
  }
}