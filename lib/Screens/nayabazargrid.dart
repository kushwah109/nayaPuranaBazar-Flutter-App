import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naya_purana_bazar/Screens/detail_page.dart';
import 'package:naya_purana_bazar/Screens/home.dart';
import 'package:naya_purana_bazar/constant/icons%20_class.dart';
import 'package:naya_purana_bazar/constant/widget%20class.dart';

class Nayabazargrid extends StatefulWidget {
  final List<dynamic> products;
  final String categoryName;
  final bool isNayaBazar;
  const Nayabazargrid({super.key, required this.products, required this.categoryName, required this.isNayaBazar});

  @override
  State<Nayabazargrid> createState() => _NayabazargridState();
}

class _NayabazargridState extends State<Nayabazargrid> {

  @override
  void initState() {
    super.initState();
    print('InitState Called for Nayabazargrid'); // To confirm initState is called
  }

  @override
  Widget build(BuildContext context) {
    print('Building Nayabazargrid...'); // Confirming that build is called
    print('Category Name: ${widget.categoryName}'); // Debug print
    print('Number of Products: ${widget.products.length}'); // Debug print

    final h = MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;

    int crossAxisCount =w>600?3:2;
     double childAspectRatio = w>1000 ? 0.82: w>600?0.75:w>400?0.7:w>300?0.75:0.6;




    // Check if the products are null or empty
    if (widget.products.isEmpty) {
      return Center(child: Text('No products available.'));
    }
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
              IconButton(onPressed: (){}, icon: search_Icon,color: colorOrange,),
              IconButton(onPressed: (){}, icon: favoriteIcon,color: colorOrange,),
              IconButton(onPressed: (){}, icon: shopingIcon,color: colorOrange,)
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
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
                    crossAxisSpacing: 10,
                    mainAxisSpacing:10),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  var item = widget.products[index];
                  String img = item['image'].toString();
                  String name = item['title'].toString();
                  String price = item['price'].toString();
                  String desc = item['description'].toString();
                  String rate = item['rating']['rate'].toString();
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
                                    img: img,
                                    title: name,
                                    price: price,
                                    rate: rate,
                                    description: desc,
                                  relatedProducts: widget.products,));
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
                                  child: Image.network(img,fit: BoxFit.contain,))),
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
                                    name,
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
                                    TextSpan(text: '\u{20B9}${price}',
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
                                      Text(rate,
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

