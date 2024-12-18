import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipto/HomePage/Model/giftModel.dart';
import 'package:recipto/HomePage/Model/productModel.dart';
import 'package:recipto/HomePage/Widget/giftCard.dart';
import 'package:recipto/Widget/TestStyle.dart';
import 'Widget/bottomSheet.dart';
import 'Widget/productCard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>with SingleTickerProviderStateMixin  {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<GiftCard>giftItem =[
    GiftCard(backgroundColor: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFEBFAFF), // Light Blue
        Color(0xFFB8E5FF), // Slightly Darker Blue
      ],
      stops: [0.0, 0.9517], // Gradient stops at 0% and 95.17%
    ), title: "Claim your gift", offerText: "of ₹250", buttonText:"Claim", image: "assets/images/Rectangle 9.png", applied: false,),
    GiftCard(backgroundColor: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF8EFFC), // Light Blue#F8EFFC
        Color(0xFFEAD3F7), // Slightly Darker Blue#EAD3F7
      ],
      stops: [0.0, 0.9517], // Gradient stops at 0% and 95.17%
    ), title: "Buy🪙500", offerText: "for just ₹450", buttonText:"Get for ₹450", image: "assets/images/Gift box - Purple 2.png",applied: false),
    GiftCard(backgroundColor: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFEF9F0), // Light Blue#FEF9F0
        Color(0xFFFFF5E0), // Slightly Darker Blue#FFF5E0
      ],
      stops: [0.0, 0.9517], // Gradient stops at 0% and 95.17%
    ), title: "Shop above ₹899", offerText: "& get🪙50", buttonText:"Applied", image: "assets/images/Cashback Offer.png",applied: true),
    GiftCard(backgroundColor: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFEBFAFF), // Light Blue
        Color(0xFFB8E5FF), // Slightly Darker Blue
      ],
      stops: [0.0, 0.9517], // Gradient stops at 0% and 95.17%
    ), title: "Claim your gift", offerText: "& get 5% back", buttonText:"Applied", image: "assets/images/Group 2094.png",applied: true),
  ];
  
  List<ProductCard>productItem = [
    ProductCard("120", "25", "145", coin: "110", title: "Drools Chicken & Egg Adult Dog Food.", image: "assets/images/Product images (1).png"),
    ProductCard("60", "25", "70", coin: "40", title: "ADIDOG Combo of 3 Squeaky Active Balls", image: "assets/images/Product images.png"),
    ProductCard("120", "25", "145", coin: "150", title: "Pedigree Dry Dog Food for Puppy (pack of 2)", image: "assets/images/Product images (2).png"),
    ProductCard("120", "25", "145", coin: "280", title: "Farmina Vetlife Renal Dog Food 2kg", image: "assets/images/Product images (3).png")
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: SafeArea(child:Padding(
        padding: const EdgeInsets.only(top:8.0,left: 8.0,right:8.0),
        child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [

               Image.asset("assets/images/Store Logo.png",height: 50,),
               SizedBox(width: 15,),
               const Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Ratnadeep Supermarket",style: AppTextStyles.headline,maxLines: 1,overflow: TextOverflow.ellipsis,),
                   Text("3% cashback • ₹250 Welcome Bonus",style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                     color: Colors.grey,
                   ),),
                 ],
               )
             ],
           ),
           TabBar(
             controller: _tabController,
             labelColor: Colors.blue, // Color for selected tab
             unselectedLabelColor: Colors.grey, // Color for unselected tabs
             labelStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
             indicator: const UnderlineTabIndicator(
               borderSide: BorderSide(
                 color: Colors.blue,
                 width: 5.0,
               ),
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(10),
                 topRight: Radius.circular(10),
               ),
               insets: EdgeInsets.symmetric(horizontal: 0.0),
             ),
             tabs: [
                const Tab(child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Text('Store Visit ')
               ],),),
               Tab(child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 const Text("Online",style: TextStyle(fontSize: 14,color: Colors.grey),),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                   decoration: BoxDecoration(
                     color: Colors.pink.shade50, // Light pink background
                     borderRadius: BorderRadius.circular(20), // Rounded corners
                   ),
                   child: const Text(
                     '10% BACK',
                     style: TextStyle(
                       color: Colors.pink,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ],),),
             ],
           ),
           Flexible(
             child: TabBarView(
               controller: _tabController,
               children: [
                 // First Tab Content
                 GridView.builder(
                   scrollDirection: Axis.vertical,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, // Two widgets per row
                     mainAxisSpacing: 10,
                     crossAxisSpacing: 10,
                     childAspectRatio: 0.645, // Adjust this to control the widget's aspect ratio
                   ),
                   itemCount: 8,
                   padding: EdgeInsets.all(10),
                   itemBuilder: (context, index) {
                     if(index <= 3){
                       return giftCard(context,giftItem[index],(){
                         showTransactionBottomSheet(context);
                       });
                     }else{
                       return productCard(context,productItem[(index-4)],(){
                         showTransactionBottomSheet(context);
                       });
                     }

                   },
                 ),
                 // Second Tab Content
                 Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text('Second Tab Content'),
                   ),
                 ),
               ],
             ),
           ),
         ],
        ),
      ),
      ),
    );
  }
}


