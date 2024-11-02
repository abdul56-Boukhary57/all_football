import 'package:flutter_riverpod/flutter_riverpod.dart';



class BtmNavBarNotifier extends StateNotifier<int> {

  BtmNavBarNotifier() : super(0);

  void selectPage(int integer){
    state = integer;
  }


}

final btmNavBarProvider =
StateNotifierProvider<BtmNavBarNotifier, int>((ref) {
  return BtmNavBarNotifier();
});
