import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Screens/nayabazargrid.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

import '../api/cateogries.dart';
import 'icons _class.dart';

class NayaBazar extends StatefulWidget {
  const NayaBazar({super.key});

  @override
  State<NayaBazar> createState() => _NayaBazarState();
}

class _NayaBazarState extends State<NayaBazar> {
  ProductCateogries _category =ProductCateogries();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return FutureBuilder<Map<String, List<dynamic>>>(
        future: _category.cateogries(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          }
          var categories = snapshot.data!;
          // print('Categories Data: $categories');

          return SingleChildScrollView(
            child: Container(
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Women Categories',style: nayabazarHeading.copyWith(fontSize: h/40),),
                        TextButton(onPressed: (){
                          Get.to(()=>Nayabazargrid(products: categories['womenCat']!, categoryName: 'Women\'s ', isNayaBazar: true,));
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
                    height:h/ 4.5,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories['womenCat']!.length,
                        itemBuilder: (context,index){
                        var item = categories['womenCat']![index];
                        String img = item['image'].toString();
                        String name = item['title'].toString();
                        return GestureDetector(
                          onTap: (){
                            // print('cat1 $categories');
                            // print('wom  $womenCat');
                            // final products = categories['womenCat']; // Safely access the products
                            // print('products $products');
                            // if (products != null&& products.isNotEmpty) {
                              Get.to(() => Nayabazargrid(products: categories['womenCat']!, categoryName: 'Women\'s', isNayaBazar: true,));
                            // } else {
                            //   print("No products available for the selected category.");
                            //   Get.snackbar('Error', 'No products available for the selected category.');
                            // }
                          },
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            margin: EdgeInsets.all(8),
                            elevation: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(img,
                                    height: h/10,
                                    width: w/4,
                                  ),
                                ),
                                SizedBox(height: h/120,),
                                ConstrainedBox(

                                    constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,style: TextStyle(fontSize: h/55),),
                                    ))
                              ],
                            ),
                          ),
                        );
                        }),
                  ),
                  SizedBox(height: 15,),
                  Divider(color: Colors.white,
                  thickness: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Men Categories',style: nayabazarHeading.copyWith(fontSize: h/40),),
                        TextButton(onPressed: (){
                          Get.to(()=>Nayabazargrid(products: categories['menCat']!, categoryName: 'Men\'s Clothes', isNayaBazar: true,));
                        },
                            child: Row(
                          children: [
                            Text('VIEW ALL',style: viewAllStyle.copyWith(fontSize: h/50),),
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
                        itemCount: categories['menCat']!.length,
                        itemBuilder: (context,index){
                          var item = categories['menCat']![index];
                          String img = item['image'].toString();
                          String name = item['title'].toString();
                          return GestureDetector(
                            onTap: (){
                              Get.to(() => Nayabazargrid(products: categories['menCat']!, categoryName: 'Men\'s Clothes', isNayaBazar: true,));
                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              margin: EdgeInsets.all(8),
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(img,
                                      height: h/10,
                                      width: w/4,
                                    ),
                                  ),
                                  SizedBox(height: h/120,),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text

                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,style: TextStyle(fontSize: h/55),),
                                      )
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        ),
                  ),
                  SizedBox(height: 15,),
                  Divider(color: Colors.white,
                    thickness: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Electronic Categories',style: nayabazarHeading.copyWith(fontSize: h/40),),
                        TextButton(onPressed: (){
                          Get.to(()=>Nayabazargrid(products: categories['electronicCat']!, categoryName: 'Electronics', isNayaBazar: true,));
                        }, child: Row(
                          children: [
                            Text('VIEW ALL',style: viewAllStyle.copyWith(fontSize:h/50),),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorOrange
                              ),
                              child:viewRightArrowIcon,
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
                        itemCount:  categories['electronicCat']?.length ?? 0,
                        itemBuilder: (context,index){
                          var item = categories['electronicCat']![index];
                          String img = item['image']?.toString() ?? '';
                          String name = item['title'].toString();

                          // print('img $img');
                          if (img.isEmpty) {
                            return Center(child: Text('No Image Available'));
                          }

                          return GestureDetector(
                            onTap: (){
                              Get.to(() => Nayabazargrid(products: categories['electronicCat']!, categoryName: 'Electronics', isNayaBazar: true,));

                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              margin: EdgeInsets.all(8),
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(img,
                                      height: h/10,
                                      width: w/4,
                                    ),
                                  ),
                                  SizedBox(height: h/120,),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text

                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,style: TextStyle(fontSize: h/55),),
                                      ))

                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15,),
                  Divider(color: Colors.white,
                    thickness: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jewelery Categories',style: nayabazarHeading.copyWith(fontSize: h/40),),
                        TextButton(onPressed: (){
                          Get.to(()=>Nayabazargrid(products: categories['jeweleryCat']!, categoryName: 'Jewelery', isNayaBazar: true,));
                        }, child: Row(
                          children: [
                            Text('VIEW ALL',style: viewAllStyle.copyWith(fontSize: h/50),),
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
                        itemCount: categories['jeweleryCat']!.length,
                        itemBuilder: (context,index){
                          var item = categories['jeweleryCat']![index];
                          String img = item['image'].toString();
                          String name = item['title'].toString();

                          return GestureDetector(
                            onTap: (){
                              Get.to(() => Nayabazargrid(products: categories['jeweleryCat']!, categoryName: 'Jewelery', isNayaBazar: true,));

                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              margin: EdgeInsets.all(8),
                              elevation: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(img,
                                      height: h/10,
                                      width: w/4,
                                    ),
                                  ),
                                  SizedBox(height: h/120,),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: w / 3),  // Constrain the width of the text

                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,style: TextStyle(fontSize: h/55),),
                                      ))

                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        }
        );

    //   SizedBox(
    //   height: h/3,
    //   width: double.infinity,
    //   child: GridView.builder(
    //     cacheExtent: 10,
    //     padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
    //     scrollDirection: Axis.vertical,
    //     itemCount: 8,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisSpacing: 15,
    //         mainAxisSpacing: 15,
    //         crossAxisCount: 2,
    //       ),
    //       itemBuilder: (context,index){
    //       return Column(
    //         children: [
    //           Container(
    //             height: h/5,
    //             width: h/2,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               border: Border.all(color: Colors.transparent),
    //               image: DecorationImage(
    //                   fit: BoxFit.fill,
    //                   image: AssetImage('assets/images1/screen3.jpg',)
    //               )
    //             ),
    //           )
    //         ],
    //       );
    //     }
    //     ),
    // );
  }
}
