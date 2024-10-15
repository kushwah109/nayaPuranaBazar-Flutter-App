import 'package:get/get.dart';

class BottomBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index){
    selectedIndex.value = index;
  }
}



// return Scaffold(
// body: Obx(()=> pages[indexController.selectedIndex.value]
// ),
// bottomNavigationBar:  Obx(()=>SizedBox(
// height: h/12,
// width: double.infinity,
// child: BottomNavigationBar(
// type: BottomNavigationBarType.fixed,
// backgroundColor:  colorCode,
// elevation: 8,
// iconSize: h/27,
// selectedLabelStyle: TextStyle(fontSize: h/60),
// unselectedLabelStyle: TextStyle(fontSize: h/60),
//
// selectedIconTheme: IconThemeData(color:selectedBottomIconColor),
// selectedItemColor: selectedBottomIconColor,
// unselectedItemColor: colorOrange,
// showSelectedLabels: true,
// showUnselectedLabels: true,
// currentIndex: indexController.selectedIndex.value,
// onTap: (index){
// indexController.changeTabIndex(index);
// },
// items: [
// _bottomNavigationBarItem(icon:homeIcon,label:'Home', index: 0, ),
// _bottomNavigationBarItem(icon:categoriesIcon,label: 'Categories' ,index: 1),
// _bottomNavigationBarItem(icon:favoriteOutlineIcon,label: 'Likes',index: 2 ),
// _bottomNavigationBarItem(icon:messageIcon,label: 'Chat',index: 3 ),
// _bottomNavigationBarItem(icon:orderIcon,label: 'My Orders',index: 4 ),] ,
// ),
// )),
//
// );
//
//
//
// }
// BottomNavigationBarItem _bottomNavigationBarItem({
// required Icon icon,required String label,required int index,
// }){
// return BottomNavigationBarItem(
// icon: Obx((){
// bool isSelected = indexController.selectedIndex.value==index;
// return Container(
// padding: EdgeInsets.all(8),
// decoration:  isSelected?
// BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.blue.withOpacity(0.2),
// ):null,
// child: IconButton(
// icon: icon,
// onPressed: () {
// indexController.changeTabIndex(index);
// },
// ),
// );
// }),
// label: label
// );
// }
//
// }
