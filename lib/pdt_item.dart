import 'package:flutter/material.dart';
import 'package:pharmatiq/pdt_detail_screen.dart';
import 'package:provider/provider.dart';
import 'products.dart';
import 'cart.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  PdtItem({this.name, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridTile(
          child: Image.network(imageUrl),

          footer: GridTileBar(
            title: Text(name,style: TextStyle(color: Color.fromRGBO(0, 170, 140, 2)),),
            trailing: IconButton(
                icon: Icon(Icons.shopping_cart,color: Color.fromRGBO(0, 170, 140, 2),),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Item Added to Cart'),
                  ));
                  cart.addItem(pdt.id, pdt.name, pdt.price);
                }),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}