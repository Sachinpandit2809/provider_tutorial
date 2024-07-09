import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/favourite_provider.dart';
import 'package:provider_tutorial/screens/favourite/icon_widget.dart';
import 'package:provider_tutorial/screens/favourite/myFavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // List<int> selectedItem = [];
  Widget redHeart = Icon(
    Icons.favorite,
    color: Colors.red,
    size: 25,
  );
  Widget blackHeart = Icon(
    Icons.favorite_border_outlined,
    //color: Colors.black87,
    size: 20,
  );
  @override
  Widget build(BuildContext context) {
    //  final favouriteProvider = Provider.of<FavouriteProvider>(
    //   context,
    // );
    print("...............build............");
    return Scaffold(
      appBar: AppBar(
        title: Text("favourite"),
        backgroundColor: Colors.lightBlue,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyfavouriteScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.selectedItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                    //setState(() {});
                  },
                  title: Text("item " + index.toString()),
                  // trailing: Icon(value.selectedItem.contains(index)
                  //     ? Icons.favorite
                  //     : Icons.favorite_outline),
                  trailing: (value.selectedItem.contains(index))
                      ? MyIconWidget.redHeart
                      : MyIconWidget.blackHeart,
                );
              });
            },
          ))
        ],
      ),
    );
  }
}
