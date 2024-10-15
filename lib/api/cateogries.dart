import 'dart:convert';
import 'package:http/http.dart'as http;
List<dynamic> womenCat = [];
List<dynamic> menCat = [];
List<dynamic> electronicCat = [];
List<dynamic> jeweleryCat = [];
class ProductCateogries{
  var baseurl = 'https://fakestoreapi.com/products';

  Future<Map<String, List<dynamic>>> cateogries() async{

    try{
      var url = Uri.parse(baseurl);

      http.Response response = await http.get(url);

      if(response.statusCode==200){
        // print('Raw Response: ${response.body}');

        var jsondata = jsonDecode(response.body) as List<dynamic>;
        for(var item in jsondata){
          // print('Item: $item'); // Debug: Print each item
          String category = item['category'] ?? ''; // Provide default value if null

          if(category=="women's clothing"){
            womenCat.add(item);
            // print(' women cat $womenCat');
          }else if(category== "men's clothing"){
            menCat.add(item);

          }else if(category== "electronics"){
            electronicCat.add(item);
          }else if(category== "jewelery"){
            jeweleryCat.add(item);
          }

        }
        // print('Parsed Data: {womenCat: $womenCat, menCat: $menCat, electronicCat: $electronicCat, jeweleryCat: $jeweleryCat}');

        return {
          'womenCat':womenCat,
          'menCat':menCat,
          'electronicCat':electronicCat,
          'jeweleryCat':jeweleryCat,
        };
        // Cat.add(jsondata);
      }else {
        print("Request failed with status: ${response.statusCode}");
            }

    }catch(e){
      print('Error $e');
    }
    return{};
  }
}


// List<dynamic> catelog = [];
class CatelogList {
  var basecat = 'https://api.escuelajs.co/api/v1/categories';

  Future<List<dynamic>> fetchcatelog()async{
    // print('fist');
    try{
      var par = await Uri.parse(basecat);
http.Response response = await http.get(par);

if(response.statusCode == 200){
  // print('Raw Response: ${response.body}');

  var data = jsonDecode(response.body) as List<dynamic>;
  // print('response 2$data');
return data;
  // catelog.add(data);
  // print(catelog);
}else{
  print('Failed to load data. Status code: ${response.statusCode}');

}
    }catch(e){
      print('Error catelog $e');
    }
    return [];
  }
}
