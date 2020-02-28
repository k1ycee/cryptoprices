

import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'package:crypto_prices/magic/services/crypt_memory.dart';
import 'package:dio/dio.dart';


class CryptoCall{
  // declaring the api url as a global string so it can be used anywhere in the class making it a bit drier
  
  String url = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';

// This function makes the Api call and within it I then selected the data i want to parse to the UI

  Future <List<Crypto>> fetchCrypto()async{
    Response call = await Dio().get(url);

    // if (call.statusCode == 200){
    //   var data = call.body.toString();
    //   var decodedData = jsonDecode(data);
      // var bypass = Crypto.fromJson(decodedData);

      //persisting the data here 
    //   CryptMemory.cryptMemory.createCrypts(decodedData).toList();

    //   return decodedData;
    // }else{
    //   print(call.statusCode.toString());
    //   return null;
    // }
    return (call.data as List).map((crypts){
      print('Inserting $crypts');
      CryptMemory.cryptMemory.createCrypts(Crypto.fromJson(crypts));
    }).toList();
    // final res = jsonDecode(call.body) as List;
    // if (call.statusCode == 200){
    //   return res.map((crypt){
    //     /// This is where I select what to pass to the UI.
    //     /// Re-editted the code to get all objects from the madel class so I can pass it to the UI.
      
      
    //     // return Crypto(
    //     //   name: crypt['name'],
    //     //   priceUsd: crypt['price_usd'],
    //     //   percentChange1H: crypt['percent_change_1h'],
    //     //   symbol: crypt['symbol']
    //     print('Inserting $crypt');
    //     CryptMemory.cryptMemory.createCrypts(Crypto.fromJson(crypt));
    //   }).toList();
    } 
    // else{
    //   throw Exception("Couldn't fetch Crypto's");
    // }
  //}
}