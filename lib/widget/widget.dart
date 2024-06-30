import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/photo_model.dart';

Widget wallpaper(List<PhotosModel> listphotos, BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
    padding: EdgeInsets.all(4.0),
    crossAxisCount: 2,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
  children: listphotos.map((PhotosModel photosModel){
      return GridTile(child: Hero(tag: photosModel.src!.portrait!, child: Container(
    child: CachedNetworkImage(imageUrl: photosModel.src!.portrait!,fit: BoxFit.cover,)
  ),));
  }).toList(),),
  );
}