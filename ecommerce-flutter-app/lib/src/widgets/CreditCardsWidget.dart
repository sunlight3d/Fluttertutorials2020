import 'package:flutter/material.dart';

class CreditCardsWidget extends StatelessWidget {
  const CreditCardsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          width: 259,
          height: 165,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          width: 275,
          height: 177,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          width: 300,
          height: 195,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), blurRadius: 20, offset: Offset(0, 5)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'img/visa.png',
                  height: 22,
                  width: 70,
                ),
                SizedBox(height: 20),
                Text(
                  'CARD NUMBER',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 5),
                Text(
                  '8154  3265  0045  1582',
                  style: Theme.of(context).textTheme.body2.merge(TextStyle(letterSpacing: 1.4)),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'EXPIRY DATE',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      'CVV',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '07/21',
                      style: Theme.of(context).textTheme.body2.merge(TextStyle(letterSpacing: 1.4)),
                    ),
                    Text(
                      '007',
                      style: Theme.of(context).textTheme.body2.merge(TextStyle(letterSpacing: 1.4)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
