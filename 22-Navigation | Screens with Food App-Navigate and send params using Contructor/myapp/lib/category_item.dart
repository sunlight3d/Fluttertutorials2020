import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'foods_page.dart';
class CategoryItem extends StatelessWidget {
  //1 categoryItem - 1 category object
  Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color _color = this.category.color;
    //i[ you tap to this Container, it must navigate to the list of Foods
    return InkWell(
      onTap: (){
        print('tapped to category: ${this.category.content}');
        //Navigate to another page
        //Pages are stored into a Stack, the page you see is the top Page(in the stack)
        /*
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodsPage(category: this.category,)//you can send parameters using constructor

            ));

         */
        //Are there another way to send parameters ? Yes !, Use RouteNames
        Navigator.pushNamed(context, '/FoodsPage', arguments: {'category': category});
      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Now change font's family from "Google Fonts"
            Text(this.category.content,
                style: Theme.of(context).textTheme.title),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  _color.withOpacity(0.8),
                  _color
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            ),
            color:_color,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}