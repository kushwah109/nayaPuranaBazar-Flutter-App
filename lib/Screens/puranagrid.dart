import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/oldproduct_categories.dart';
import '../constant/icons _class.dart';
import '../constant/widget class.dart';
import 'detail_page.dart';

class Purana extends StatefulWidget {
  final List<Item> item;
  final String categoryName;
  const Purana({super.key, required this.item, required this.categoryName, });

  @override
  State<Purana> createState() => _puranaState();
}

class _puranaState extends State<Purana> {
  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: colorCode,
          // backgroundColor: Colors.orange.shade700,
          leading: IconButton(onPressed: (){
            Get.back();
          },icon:backIcon,color: colorOrange,),
          title: Text(widget.categoryName,style: nayabazarHeading.copyWith(color: colorOrange),),
          actions: [
            Row(
              children: [
                IconButton(onPressed: (){},icon: search_Icon,color: colorOrange,),
                IconButton(onPressed: (){},icon: favoriteIcon,color: colorOrange,),
                IconButton(onPressed: (){},icon: shopingIcon,color: colorOrange,)
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  padding:EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing:10),
                  itemCount: widget.item.length,
                  itemBuilder: (context, index) {
                    final currentItem = widget.item[index];
                    // String img = items['imageUrl'].toString();
                    // String name = item['title'].toString();
                    // String price = item['price'].toString();
                    // String desc = item['description'].toString();
                    // String rate = item['rating']['rate'].toString();
                    // print('Item $index: Image: $img, Name: $name, Price: $price, Rate: $rate');

                    return Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.grey.shade200,
                      elevation: 6,
                      child: Stack(
                          children:[
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      Get.to(()=>DetailPage(
                                        img: currentItem.imageUrl,
                                        title: currentItem.name,
                                        price: currentItem.price,
                                        rate: currentItem.rating,
                                        description: currentItem.itemName,
                                        relatedProducts: widget.item,));
                                    },

                                    child: Container(
                                        height: h/7,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(w * 0.02), // Dynamic padding
                                        margin: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
                                        // padding: EdgeInsets.all(10),
                                        // margin: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.grey.shade100.withOpacity(0.5))
                                        ),
                                        child: Image.asset(currentItem.imageUrl,fit: BoxFit.contain,))),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),

                                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        // height: h * 0.03, // Dynamic height for text
                                        // height:40,
                                        child: Text(
                                          currentItem.name,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          // style: gridText.copyWith(fontSize: w * 0.035, // Dynamic font size
                                          style: gridText.copyWith(fontSize: h/50, // Dynamic font size
                                          ),),
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              children:[
                                                TextSpan(text: ' price : ',
                                                    // style:gridText.copyWith(fontSize: w * 0.031, // Dynamic font size
                                                    style:gridText.copyWith(fontSize: h/50, // Dynamic font size
                                                    )),
                                                TextSpan(text: '\u{20B9}${currentItem.price}',
                                                  // style: gridPriceText.copyWith(fontSize: w*0.035),)
                                                  style: gridPriceText.copyWith(fontSize: h/40),)
                                              ]
                                          )),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: w * 0.08,
                                          vertical: h * 0.01,
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: h * 0.005),

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: colorOrange
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(currentItem.rating,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(  fontSize:h/40, // Dynamic font size
                                                  // style: TextStyle(  fontSize: w * 0.03, // Dynamic font size
                                                  fontWeight: FontWeight.w500,color: Colors.white),),
                                            Icon(Icons.star,color: Colors.white,size:  h * 0.02,)
                                          ],
                                        ),
                                      ),
                                      // Text('rate: $rate',
                                      //   textAlign: TextAlign.start,
                                      //   style: TextStyle(fontSize: 15),),
                                    ],
                                  ),
                                )

                              ],

                            ),
                            Positioned(
                              top:h/80,left:w*0.3,right:w*0.004,
                              child: Container(
                                height: h/25,width: w/1,
                                // margin: const EdgeInsets.only(right: 10,top: 5,left: 120),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorCode.withOpacity(0.5),
                                ),
                                child: Icon(Icons.favorite,color:colorOrange,size: h/40,),
                              ),)

                          ]
                      )
                      ,
                    );
                  }),
            )
          ],
        )

    );

  }
}
