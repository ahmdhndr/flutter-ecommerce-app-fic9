import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/space_height.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/colors.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/variables.dart';
import 'package:flutter_fic9_ecommerce_app/common/extensions/currency_format.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/products_response_model.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorName.black.withOpacity(0.05),
              blurRadius: 7.0,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              '${Variables.baseUrl}${data.attributes.images.data.first.attributes.url}',
              width: 170.0,
              height: 112.0,
              fit: BoxFit.cover,
            ),
            const SpaceHeight(14.0),
            Flexible(
              child: Text(
                data.attributes.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SpaceHeight(4.0),
            Text(
              int.parse(data.attributes.price).currencyFormatRp,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
