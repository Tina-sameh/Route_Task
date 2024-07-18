import 'package:flutter/material.dart';

import '../model/products_response.dart';

class BuildProduct extends StatelessWidget {
  Products product;
  String? image;

  BuildProduct({required this.product, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 2.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment:Alignment.topRight,
            children: [
              Image.network(
                image!,
                height: MediaQuery.of(context).size.height * .15,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow:[BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)
                ),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(10),
                  child: Image.asset("assets/heart.png",width: 25,height: 25,))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title!,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1d1d51),
                  ),
                ),
                Text(
                  product.description!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xff1d1d51)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${product.price!}',
                        style: const TextStyle(
                          color: Color(0xff1d1d51),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ${product.discountPercentage!}',
                        style: const TextStyle(
                          color: Colors.cyan,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text('Review (${product.reviews?[1].rating})'),
                    const Icon(Icons.star, color: Colors.yellow),
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .03,
                      width: MediaQuery.of(context).size.width * .05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.add_circle,
                          size: 35,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
