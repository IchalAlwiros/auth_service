import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/api/ApiServices.dart';
import '../services/model/list_resto_models.dart';
import '../theme/theme.dart';
import '../ui/details_screen_resto.dart';

class CardTopResto extends StatelessWidget {
  final Restaurants restaurant;

  CardTopResto({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestoDetailPage(id: restaurant.id!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 260,
          margin: EdgeInsets.only(right: 20, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3.0, 6.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                    ("${ApiService.baseUrlImage}${restaurant.pictureId}"),
                    height: 138,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 2, left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${restaurant.name!}\n',
                                  style: titleStyle.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: restaurant.city,
                                  style:
                                      titleStyle.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('(${restaurant.ratings})')
                      ],
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
