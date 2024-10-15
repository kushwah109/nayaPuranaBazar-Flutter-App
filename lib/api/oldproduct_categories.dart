import 'dart:convert';

import 'package:http/http.dart'as http;
List clothes = [];
List electronics = [];
List furniture = [];
List shoes = [];
List sofa = [];
class OldProductCategories{

  var baseurl = 'https://api.escuelajs.co/api/v1/products';
 Future<void> oldcategories()async{
   try{
     var parseurl = Uri.parse(baseurl);
     http.Response response = await http.get(parseurl);
      if (response.statusCode == 200){
        var jsondata = jsonDecode(response.body);
        return jsondata;
      }
   }catch(e){
     print('$e');
   }
 }
}

class Item{
  final String imageUrl;
  final String name;
  final String rating;
  final String price;
  final String itemName;

  Item({required this.imageUrl,required this.name, required this.price,required this.rating,required this.itemName});


}