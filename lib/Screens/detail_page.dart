import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

class DetailPage extends StatefulWidget {
 final String img;
 final String title;
 final String price;
 final String rate;
 final String description;
 final List<dynamic> relatedProducts;

  const DetailPage({super.key, required this.img, required this.title, required this.price, required this.rate, required this.description, required this.relatedProducts,});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;


    int crossAxisCount =w>600?3:2;
    double childAspectRatio = w>1000 ? 0.7:w>800?0.65: w>600?0.7:w>400?0.6:w>300?0.65:0.6;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorCode,
        title: Text('Detail Product',style: nayabazarHeading.copyWith(color: colorOrange),),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: colorOrange,)),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(w/20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.grey.shade100,
                  // elevation: 1,
              child: Stack(
                children: [Column(
                  children: [
                    Container(
                        height: h/3,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade100.withOpacity(0.5))
                        ),
                        child: Center(child: Image.network(widget.img,fit: BoxFit.contain,))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.title,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: gridTitleText.copyWith(fontSize: h/50)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: colorOrange,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('Price: \u{20B9} ${widget.price}', style: gridPriceText.copyWith(fontSize: h/40,color: Colors.white)),)

                  ],
                ),
                  Positioned(
                    top:h/30,left:w*0.65,right:w*0.008,
                    child: Container(
                      height: h/20,width: w/1,
                      // margin: const EdgeInsets.only(right: 10,top: 5,left: 120),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorCode.withOpacity(0.5),
                      ),
                      child: Icon(Icons.favorite,color:colorOrange,size: h/30,),
                    ),)

                ]
              )

                ),

                Card(
                    clipBehavior: Clip.hardEdge,
                    color: Colors.grey.shade100,
                    // elevation: 1,
                    child:  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: w/50,vertical: h/50),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                          'Product Details',
                          style:descriptionTextStyle
                      ),
                      SizedBox(height: 10,),
                      Text(
                        widget.description,
                        style: TextStyle(fontSize: h/50,color: Colors.black54),
                      ),
                          ]
                ),)),
                Card(
                    clipBehavior: Clip.hardEdge,
                    color: Colors.grey.shade100,
                    // elevation: 1,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Customer Rating',
                                style:descriptionTextStyle
                            ),
                          ]
                      ),)),
                SizedBox(height: h/40,),
                Divider(),
                // Text('People also viewed',style: accountText.copyWith(fontSize: h/40),),
                // GridView.builder(
                //     padding:EdgeInsets.all(10),
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: crossAxisCount,
                //         childAspectRatio: childAspectRatio,
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing:10,
                //     ),
                //     itemCount: widget.relatedProducts.length,
                //     itemBuilder: (context, index) {
                //       var item = widget.relatedProducts[index];
                //       String img = item['image'].toString();
                //       String name = item['title'].toString();
                //       String price = item['price'].toString();
                //       String desc = item['description'].toString();
                //       String rate = item['rating']['rate'].toString();
                //       // print('Item $index: Image: $img, Name: $name, Price: $price, Rate: $rate');
                //
                //       return Card(
                //         clipBehavior: Clip.hardEdge,
                //         color: Colors.grey.shade200,
                //         elevation: 6,
                //         child: Stack(
                //           children: [Column(
                //             children: [
                //               GestureDetector(
                //                   onTap: (){
                //                     print('Navigating to DetailPage with:');
                //                     print('Image: ${item['image']}');
                //                     print('Title: ${item['title']}');
                //                     print('Price: ${item['price']}');
                //                     print('Rate: ${item['rating']['rate']}');
                //                     print('Description: ${item['description']}');
                //
                //                     // Get.toNamed('/DetailPage', arguments: {
                //                     //   'img': item['image'],
                //                     //   'title': item['title'],
                //                     //   'price': item['price'].toString(),
                //                     //   'rate': item['rating']['rate'].toString(),
                //                     //   'description': item['description'],
                //                     //   'relatedProducts': relatedProducts,
                //                     // });
                //                     Get.to(()=>DetailPage(
                //                       img: item['image'],
                //                       title: item['title'],
                //                       price: item['price'].toString(),
                //                       rate: item['rating']['rate'].toString(),
                //                       description: item['description'],
                //                       relatedProducts: widget.relatedProducts,));
                //                   },
                //
                //                   child: Container(
                //                       height: h/7,
                //                       width: double.infinity,
                //                       padding: EdgeInsets.all(w * 0.02), // Dynamic padding
                //                       margin: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
                //                       // padding: EdgeInsets.all(10),
                //                       // margin: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 8),
                //                       decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.circular(10),
                //                           border: Border.all(color: Colors.grey.shade100.withOpacity(0.5))
                //                       ),
                //                       child: Image.network(img,fit: BoxFit.contain,
                //                         errorBuilder: (context, error, stackTrace) {
                //                           // Display an error widget or placeholder when the image fails to load
                //                           return Center(
                //                             child: Icon(
                //                               Icons.broken_image,
                //                               color: Colors.grey,
                //                               size: 50,
                //                             ),
                //                           );
                //                         },
                //                         loadingBuilder: (context, child, loadingProgress) {
                //                           if (loadingProgress == null) return child;
                //                           return Center(
                //                             child: CircularProgressIndicator(),
                //                           );
                //                         },
                //                       ))),
                //               Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                //
                //                 // padding: const EdgeInsets.symmetric(horizontal: 10),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: [
                //                     SizedBox(
                //                       // height: h * 0.03, // Dynamic height for text
                //                       // height:40,
                //                       child: Text(
                //                         name,
                //                         overflow: TextOverflow.ellipsis,
                //                         textAlign: TextAlign.center,
                //                         // style: gridText.copyWith(fontSize: w * 0.035, // Dynamic font size
                //                         style: gridText.copyWith(fontSize: h/50, // Dynamic font size
                //                         ),),
                //                     ),
                //                     RichText(
                //                         textAlign: TextAlign.center,
                //                         text: TextSpan(
                //                             children:[
                //                               TextSpan(text: ' price : ',
                //                                   // style:gridText.copyWith(fontSize: w * 0.031, // Dynamic font size
                //                                   style:gridText.copyWith(fontSize: h/50, // Dynamic font size
                //                                   )),
                //                               TextSpan(text: '\u{20B9}${price}',
                //                                 // style: gridPriceText.copyWith(fontSize: w*0.035),)
                //                                 style: gridPriceText.copyWith(fontSize: h/40),)
                //                             ]
                //                         )),
                //                     Container(
                //                       margin: EdgeInsets.symmetric(
                //                         horizontal: w * 0.08,
                //                         vertical: h * 0.01,
                //                       ),
                //                       padding: EdgeInsets.symmetric(vertical: h * 0.005),
                //
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(15),
                //                           color: colorOrange
                //                       ),
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.center,
                //                         children: [
                //                           Text(rate,
                //                             textAlign: TextAlign.center,
                //                             style: TextStyle(  fontSize:h/40, // Dynamic font size
                //                                 // style: TextStyle(  fontSize: w * 0.03, // Dynamic font size
                //                                 fontWeight: FontWeight.w500,color: Colors.white),),
                //                           Icon(Icons.star,color: Colors.white,size:  h * 0.02,)
                //                         ],
                //                       ),
                //                     ),
                //                     // Text('rate: $rate',
                //                     //   textAlign: TextAlign.start,
                //                     //   style: TextStyle(fontSize: 15),),
                //                   ],
                //                 ),
                //               )
                //
                //             ],
                //
                //           ),
                //             Positioned(
                //               top:h/80,left:w*0.25,right:w*0.004,
                //               child: Container(
                //                 height: h/25,width: w/1,
                //                 // margin: const EdgeInsets.only(right: 10,top: 5,left: 120),
                //                 decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color: colorCode.withOpacity(0.5),
                //                 ),
                //                 child: Icon(Icons.favorite,color:colorOrange,size: h/40,),
                //               ),)
                //           ]
                //         )
                //         ,
                //       );
                //     })



                ]
          ),
        ),
      ) ,
    );
  }
}
