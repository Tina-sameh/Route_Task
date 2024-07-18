import 'package:flutter/material.dart';
import 'package:task/Api/api_manager.dart';
import 'package:task/widgets/build_product.dart';


class Screen extends StatefulWidget {
  static const String routeName = "Screen";

  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Scaffold(
          body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome Back ....",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.indigo, width: 1.5)),
                    child: TextField(
                      onTap: () {
                      },
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          hintText: "What do you search for?",
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.indigo,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                const Expanded(
                    child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 35,
                  color: Colors.indigo,
                ))
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: ApiManager.getProductes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.indigo,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          const Text("Something went wrong"),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ApiManager.getProductes();
                                });
                              },
                              child: const Text("Try again"))
                        ],
                      );
                    } else {
                      var productList = snapshot.data?.products;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: .66),
                        itemCount: productList?.length,
                        itemBuilder: (context, index) {
                          String? image = productList?[index].images?.first;
                          return BuildProduct(
                              product: productList![index], image: image);
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
