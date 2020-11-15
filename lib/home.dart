
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

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
                          height: 200,
                          width: 100,
                          color: Colors.red,
                          child: Text(productController.productList[index].name,style: TextStyle(color: Colors.black),),
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
