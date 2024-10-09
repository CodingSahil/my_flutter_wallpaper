import 'package:flutter/material.dart';
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
         child: Column(children: [
           Center(
             child: Text(
                 "Categoies",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 25.0,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'Poppins')),
           ),
            SizedBox(height: 20.0,),
            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("images/wildlife.jpg",width: MediaQuery.of(context).size.width,height: 180,fit: BoxFit.cover,)),
            Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
           color: Colors.black26,
            borderRadius: BorderRadius.circular(20)
         ),
          child: Center(child: Text("Wildlife",style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 30.0,fontWeight: FontWeight.bold),)),
                )
              ],),
            ),
           Container(
             margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
             ),
             child: Stack(children: [
               ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.asset("images/cars.jpg",width: MediaQuery.of(context).size.width,height: 180,fit: BoxFit.cover,)),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 180,
                 decoration: BoxDecoration(
                     color: Colors.black26,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Center(child: Text("Cars",style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 30.0,fontWeight: FontWeight.bold),)),
               )
             ],),
           ),
           Container(
             margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
             ),
             child: Stack(children: [
               ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.asset("images/nature.jpg",width: MediaQuery.of(context).size.width,height: 180,fit: BoxFit.cover,)),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 180,
                 decoration: BoxDecoration(
                     color: Colors.black26,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Center(child: Text("Nature",style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 30.0,fontWeight: FontWeight.bold),)),
               )
             ],),
           ),
           Container(
             margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
             ),
             child: Stack(children: [
               ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.asset("images/marvel.jpg",width: MediaQuery.of(context).size.width,height: 180,fit: BoxFit.cover,)),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 180,
                 decoration: BoxDecoration(
                     color: Colors.black26,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child: Center(child: Text("MarvelStudio",style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 30.0,fontWeight: FontWeight.bold),)),
               )
             ],),
           )
         ],),
        ),
      ),
    );
  }
}
