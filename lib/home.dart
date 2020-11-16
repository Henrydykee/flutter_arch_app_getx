
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Home",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
        child: Column(
          children: [
            Expanded(
              child: Obx(()=>  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2 ),
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                  imageUrl: productController.productList[index].imageLink,
                                height: 80,
                              ),
                              SizedBox(height: 5,),
                              Text(productController.productList[index].name),
                              SizedBox(height: 5,),
                              Text(productController.productList[index].price),
                            ],
                          )
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
