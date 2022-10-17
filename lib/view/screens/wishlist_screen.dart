
import 'package:app1/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';
import '../../providers/wishlist_provider.dart';


class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override

  Widget build(BuildContext context) {
    final loadedproduct = Provider.of<Wishlist>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(
          children:[
            TextButton.icon(icon:Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),

            label: Text(''),
            onPressed: (){
             Get.to(HomePage());
              }, ),
            Text('wishlist'),
        ]
      ),
      ),
      body: Consumer<Data>(builder: (context, loadedp, child) {
        return ListView.builder(
            itemCount: loadedproduct.wishlistbyid.length,
            itemBuilder: (context,index) {
              return Column(
                children: [
                  Image.network(
                    loadedproduct.wishlistbyid[index].image,
                    width: 100,
                    height: 100,
                  ),
                  Text(loadedproduct.wishlistbyid[index].title),
                  Text(loadedproduct.wishlistbyid[index].price),
                  Text(loadedproduct.wishlistbyid[index].id.toString()),
                  ElevatedButton(onPressed: (){
                    loadedproduct.removefromwishlist(loadedproduct.wishlistbyid[index]);
                    setState(() {
                    });
                  }, child: Icon(Icons.remove_circle_outline))
                ],
              );
            }
        );
      }
      ),

    );
  }
}