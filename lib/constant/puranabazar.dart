import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Screens/puranagrid.dart';
import '../api/oldproduct_categories.dart';
import 'icons _class.dart';
import 'widget class.dart';

class PuranaBazar extends StatefulWidget {
  const PuranaBazar({super.key});

  @override
  State<PuranaBazar> createState() => _PuranaBazarState();
}

class _PuranaBazarState extends State<PuranaBazar> {
  final List<Item> item = [Item(name: 'Summer',rating:'4.5' ,price:'\$56.55',imageUrl: 'assets/tempimg/mens_wear.jpg', itemName: 'All'),
    Item(name: 'Bag',rating:'4.5' ,price:'\$2.55',imageUrl: 'assets/tempimg/beg.jpg', itemName: 'Jacket'),
    Item(name: 'Dress',rating:'4.0' ,price:'\$84.55',imageUrl: 'assets/tempimg/short_dress.jpg', itemName: 'Dresses'),
    Item(name: 'Denim',rating:'2.5' ,price:'\$75.50',imageUrl: 'assets/tempimg/denim_dress.jpg', itemName: 'Tops'),
    Item(name: 'Shoe ',rating:'4.5' ,price:'\$25.5',imageUrl: 'assets/tempimg/shoes.jpg', itemName: 'Shoes'),
    Item(name: 'Sneaker',rating:'3.5' ,price:'\$78.75',imageUrl: 'assets/tempimg/sneakers.jpg', itemName: 'Bag'),
    Item(name: 'Hills',rating:'5.0' ,price:'\$60.5',imageUrl: 'assets/tempimg/hills.jpg', itemName: 'Hills'),
    Item(name: 'Black Matels Bangles',rating:'4.0' ,price:'\$20.0',imageUrl: 'assets/tempimg/bangles.jpg', itemName: 'Bangles'),
  ];
  // List productname = ['summer clothes','Bag','Short Dress','Denim','Shoes','Sneaker'];
  // List productprice = ['\$85.66','\$55.6','\$60.26','\$155.66','\$20.66','\$541.66',];
  // List productrate = ['4.4','4.0','2.4','4.4','5.0','4.8',];
  // List productcat = ['All','Bag','Dress','Tops','Shoes','Sneaker'];
  // List productimg = [
  //   'assets/tempimg/mens_wear.jpg',
  //   'assets/tempimg/beg.jpg',
  //   'assets/tempimg/short_dress.jpg',
  //   'assets/tempimg/denim_dress.jpg',
  //   'assets/tempimg/shoes.jpg',
  //   'assets/tempimg/sneakers.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Refurbished',style: nayabazarHeading.copyWith(fontSize: h/40),),
                TextButton(onPressed: (){
                  Get.to(()=>Purana(item: item, categoryName: 'Refurbished',));
                      
                  // Get.to(()=>Nayabazargrid(products: item, categoryName: 'Refurbished Product', isNayaBazar: false,));
                }, child: Row(
                  children: [
                    Text('VIEW ALL',style:viewAllStyle.copyWith(fontSize: h/50),),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorOrange
                      ),
                      child: viewRightArrowIcon,
                    )
                  ],))
              ],
            ),
          ),

          SizedBox(
            height: h/4.5,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
              itemCount: item.length,
                itemBuilder: (context,index){
                  final items = item[index];
                  // final img = items[[index];
                return GestureDetector(
                    onTap: () {
                      // Get.to(()=>Nayabazargrid(products: item, categoryName: 'Refurbished Product', isNayaBazar: false,));

                      Get.to(() => Purana(item: item, categoryName: 'Refurbished ',)); // Corrected: Wrapped in a closure
                    },
                    child: Card(
                      color: Colors.white,
                        shadowColor: Colors.grey,
                        margin: EdgeInsets.all(8),
                        elevation: 6,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                        Container(
                        decoration: BoxDecoration(
                        color: Colors.transparent,
                        ),
                                              child: Image.asset(
                        items.imageUrl, // Ensure the image has a transparent background.
                        fit: BoxFit.fill,
                        height: h/5,width: w/4,
                                              ),
                                            ),
                              // Padding(
                              //   padding: const EdgeInsets.all(10),
                              //   child: Image.network(img,
                              //     height: h/10,
                              //     width: w/4,
                              //   ),
                              // ),
                              // SizedBox(height: h/120,),
                              // ConstrainedBox(
                              //
                              //     constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text
                              //
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(horizontal: 10),
                              //       child: Text(
                              //         name,
                              //         overflow: TextOverflow.ellipsis,
                              //         textAlign: TextAlign.center,
                              //         maxLines: 2,style: TextStyle(fontSize: h/55),),
                              //     ))
                  ]
                    )
                  ));
                }
            ),
          )
        ],
      ),
    );
    // return FutureBuilder<Map<String, List<dynamic>>>(
    //     future: _category.cateogries(),
    // builder: (context,snapshot){
    // if (snapshot.connectionState == ConnectionState.waiting) {
    // return Center(child: CircularProgressIndicator());
    // } else if (snapshot.hasError) {
    // return Center(child: Text('Error: ${snapshot.error}'));
    // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    // return Center(child: Text('No data available'));
    // }
    // var categories = snapshot.data!;
    // return SingleChildScrollView(
    //   child: Container(
    //     color: Colors.grey.shade200,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text('Women Categories',style: nayabazarHeading.copyWith(fontSize: h/40),),
    //               TextButton(onPressed: (){
    //                 Get.to(()=>Nayabazargrid(products: categories['womenCat']!, categoryName: 'Women\'s Clothes',));
    //               }, child: Row(
    //                 children: [
    //                   Text('VIEW ALL',style:viewAllStyle.copyWith(fontSize: h/50),),
    //                   Container(
    //                     margin: EdgeInsets.only(left: 5),
    //                     decoration: BoxDecoration(
    //                         shape: BoxShape.circle,
    //                         color: colorOrange
    //                     ),
    //                     child: viewRightArrowIcon,
    //                   )
    //                 ],))
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           height:h/ 4.5,
    //           child: ListView.builder(
    //               padding: EdgeInsets.symmetric(horizontal: 5),
    //               scrollDirection: Axis.horizontal,
    //               itemCount: categories['womenCat']!.length,
    //               itemBuilder: (context,index){
    //                 var item = categories['womenCat']![index];
    //                 String img = item['image'].toString();
    //                 String name = item['title'].toString();
    //                 return GestureDetector(
    //                   onTap: (){
    //                     // print('cat1 $categories');
    //                     // print('wom  $womenCat');
    //                     // final products = categories['womenCat']; // Safely access the products
    //                     // print('products $products');
    //                     // if (products != null&& products.isNotEmpty) {
    //                     Get.to(() => Nayabazargrid(products: categories['womenCat']!, categoryName: 'Women\'s Clothes',));
    //                     // } else {
    //                     //   print("No products available for the selected category.");
    //                     //   Get.snackbar('Error', 'No products available for the selected category.');
    //                     // }
    //                   },
    //                   child: Card(
    //                     color: Colors.white,
    //                     shadowColor: Colors.grey,
    //                     margin: EdgeInsets.all(8),
    //                     elevation: 6,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.all(10),
    //                           child: Image.network(img,
    //                             height: h/10,
    //                             width: w/4,
    //                           ),
    //                         ),
    //                         SizedBox(height: h/120,),
    //                         ConstrainedBox(
    //
    //                             constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text
    //
    //                             child: Padding(
    //                               padding: const EdgeInsets.symmetric(horizontal: 10),
    //                               child: Text(
    //                                 name,
    //                                 overflow: TextOverflow.ellipsis,
    //                                 textAlign: TextAlign.center,
    //                                 maxLines: 2,style: TextStyle(fontSize: h/55),),
    //                             ))
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               }),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // }
    // );
  }
}
