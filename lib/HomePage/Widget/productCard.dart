
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipto/HomePage/Model/productModel.dart';

Widget productCard(BuildContext context,ProductCard data,VoidCallback showTransactionBottomSheet){
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      width: 170, // Adjust width as needed
      padding: const EdgeInsets.only(top: 12,left: 10,right: 10,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Product Image
          Center(
            child: Image.asset(
              data.image,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          // Product Title
           Text(
            data.title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Price Section
          Row(
            children: [
              Text(
                '₹${data.price} ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '₹${data.actualPrice}',
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '₹${data.offerPrice} OFF',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink[500],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Bottom Section with Coin and Claim Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Coin Amount
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.currency_exchange,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                   Text(
                    data.coin,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Claim Button
              OutlinedButton(
                onPressed: () {
                  showTransactionBottomSheet();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue[600],
                  side: BorderSide(color: Colors.blue[600]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0,
                  ),
                ),
                child: const Text(
                  'Claim',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}