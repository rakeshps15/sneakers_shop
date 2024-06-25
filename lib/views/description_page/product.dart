import 'package:flutter/material.dart';
import 'package:sneakers_shop/models/shoe_model.dart';

class ProductViewPage extends StatefulWidget {
  Shoe shoe;
  void Function()? onTap;
  ProductViewPage({super.key, required this.shoe, required this.onTap});

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  List<dynamic> productList = [];
  List<String> size = [
    "40",
    "41",
    "42",
    "43",
    "44",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.green,

  ];

  int _selectedColor = 0;
  int _selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.6,
              elevation: 0,
              snap: true,
              floating: true,
              stretch: true,
              backgroundColor: Colors.grey.shade50,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  background: Image.asset(widget.shoe.imagePath, fit: BoxFit.cover,)
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(45),
                  child: Transform.translate(
                    offset: Offset(0, 1),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                          child: Container(
                            width: 50,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                      ),
                    ),
                  )
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.shoe.name,
                                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(widget.shoe.description, style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                                  ],
                                ),
                                Text("\$ " +widget.shoe.price.toString() + '.00',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Take a break from jeans with the parker long straight pant. These lightweight, pleat front pants feature a flattering high waist and loose, straight legs.",
                              style: TextStyle(height: 1.5, color: Colors.grey.shade800, fontSize: 15,),
                            ),
                            SizedBox(height: 30,),
                            Text("Color", style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                            SizedBox(height: 10,),
                            Container(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: colors.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedColor = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                          shape: BoxShape.circle
                                      ),
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: _selectedColor == index ? Icon(Icons.check, color: Colors.white,) : Container(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('Size', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                            SizedBox(height: 10,),
                            Container(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: size.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedSize = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                                          shape: BoxShape.circle
                                      ),
                                      width: 40,
                                      height: 40,
                                      child: Center(
                                        child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              height: 50,
                              elevation: 0,
                              splashColor: Colors.yellow[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              color: Colors.yellow[800],
                              child: Center(
                                child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            )
                          ],
                        ),
                      )
                  )
                ])
            ),
          ]
      ),
    );
  }
}