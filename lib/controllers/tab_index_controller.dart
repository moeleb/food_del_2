import 'package:get/get.dart';

class TabIndexController extends GetxController{
  final RxInt _tabIndex = 0.obs ;

  // create getters and setters
  int get tabIndex => _tabIndex.value ;

  set setTabIndex(int newValue){
    _tabIndex.value = newValue ;
  }
}