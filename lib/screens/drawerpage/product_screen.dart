

//--------------สร้างตัวแปร refreshKey สำหรับการ RefreshIndicator-----------------//
import 'package:flexi_business_hub/screens/products/components/product_items.dart';
import 'package:flutter/material.dart';


import 'package:flexi_business_hub/app_router.dart';
import 'package:flexi_business_hub/models/product_model.dart';
import 'package:flexi_business_hub/services/API/rest_api_bill.dart';

var refreshKey = GlobalKey<RefreshIndicatorState>();
//-----------------------------------------------------------------------------//

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Toggle between ListView and GridView
  bool _isGridView = true;

  // สร้างฟังก์ชันสลับระหว่าง ListView และ GridView
  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(                  
            
        title: Center(child: const Text('สินค้า')),
        
        actions: [
           
          IconButton(
            onPressed: _toggleView,
            icon: Icon(_isGridView ? Icons.list_outlined : Icons.grid_view)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.productAdd);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: CallAPI().getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            // กรณีที่มี error
            if (snapshot.hasError) {
              return const Center(
                child: Text('มีข้อผิดพลาด โปรดลองใหม่อีกครั้ง'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              // กรณีที่โหลดข้อมูลสำเร็จ
              List<ProductModel> products = snapshot.data;
              return _isGridView ? _gridView(products) : _listView(products);
            } else {
              // กรณีที่กำลังโหลดข้อมูล
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      
    );
  }

  // _gridView Widget -----------------------------------------------------------
  Widget _gridView(List<ProductModel> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // จำนวนคอลัมน์
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        mainAxisExtent: 250,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(
          isGrid: true,
          product: products[index],
          onTap: () {
            Navigator.pushNamed(context, AppRouter.productDetail,
                arguments: {'products': products[index].toJson()});
          },
        );
      },
    );
  }
  // ---------------------------------------------------------------------------

  // _listView Widget -----------------------------------------------------------
  Widget _listView(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
          child: SizedBox(
            height: 350,
            child: ProductItem(
              product: products[index],
              onTap: () {
                Navigator.pushNamed(context, AppRouter.productDetail,
                    arguments: {'products': products[index].toJson()});
              },
            ),
          ),
        );
      },
    );
  }
  // ---------------------------------------------------------------------------
}
