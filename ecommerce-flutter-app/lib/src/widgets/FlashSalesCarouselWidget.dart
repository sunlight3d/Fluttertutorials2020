import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/FlashSalesCarouselItemWidget.dart';
import 'package:flutter/material.dart';

class FlashSalesCarouselWidget extends StatelessWidget {
  List<Product> productsList;
  String heroTag;

  FlashSalesCarouselWidget({
    Key key,
    this.productsList,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            double _marginLeft = 0;
            (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
            return FlashSalesCarouselItemWidget(
              heroTag: this.heroTag,
              marginLeft: _marginLeft,
              product: productsList.elementAt(index),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
