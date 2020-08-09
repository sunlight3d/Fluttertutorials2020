import 'package:ecommerce_app_ui_kit/src/models/review.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ReviewItemWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewsListWidget extends StatelessWidget {
  ReviewsList _reviewsList = new ReviewsList();

  ReviewsListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return ReviewItemWidget(review: _reviewsList.reviewsList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 30,
        );
      },
      itemCount: _reviewsList.reviewsList.length,
      primary: false,
      shrinkWrap: true,
    );
  }
}
