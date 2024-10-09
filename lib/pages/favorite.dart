import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/models/favourite_state.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<FavouriteDataObject> favouriteList = [];

  @override
  void initState() {
    favouriteList = <FavouriteDataObject>[
      FavouriteDataObject(
        imagePath: 'images/wildlife.jpg',
        label: 'Wildlife',
        isFavourite: true,
      ),
      FavouriteDataObject(
        imagePath: 'images/wildlife.jpg',
        label: 'Wildlife',
        isFavourite: true,
      ),
      FavouriteDataObject(
        imagePath: 'images/wildlife.jpg',
        label: 'Wildlife',
        isFavourite: true,
      ),
      FavouriteDataObject(
        imagePath: 'images/wildlife.jpg',
        label: 'Wildlife',
        isFavourite: true,
      ),
      FavouriteDataObject(
        imagePath: 'images/wildlife.jpg',
        label: 'Wildlife',
        isFavourite: true,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Favourite",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              favouriteList.isEmpty
                  ? Container(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      alignment: Alignment.center,
                      child: Text(
                        "No Favourite",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  : Column(
                      children: favouriteList.map(
                        (e) {
                          int index = favouriteList.indexOf(e);
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    e.imagePath,
                                    width: MediaQuery.of(context).size.width,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        // e.isFavourite = !e.isFavourite;
                                                        favouriteList
                                                            .removeAt(index);
                                                      });
                                                    },
                                                    child: e.isFavourite
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 25,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Colors.black,
                                                            size: 25,
                                                          ),
                                                  ),
                                                  SizedBox(width: 10),
                                                ],
                                              ),
                                              Expanded(
                                                child: Text(
                                                  e.label,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 30.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
