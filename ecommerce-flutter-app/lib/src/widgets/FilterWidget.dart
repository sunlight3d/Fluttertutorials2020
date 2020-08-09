import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/models/product_color.dart';
import 'package:ecommerce_app_ui_kit/src/models/product_size.dart';
import 'package:ecommerce_app_ui_kit/src/models/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  CategoriesList _categoriesList = new CategoriesList();
  SubCategoriesList _subCategoriesList = new SubCategoriesList();
  BrandsList _brandsList = new BrandsList();
  ProductColorsList _productColorsList = new ProductColorsList();
  ProductSizesList _productSizesList = new ProductSizesList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Refine Results'),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        clearSelection();
                      });
                    },
                    child: Text(
                      'Clear',
                      style: Theme.of(context).textTheme.body2,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionTile(
                    title: Text('Categories'),
                    children: List.generate(5, (index) {
                      var _category = _categoriesList.list.elementAt(index);
                      return ExpansionTile(
                        leading: Icon(_category.icon),
                        title: Text(_category.name),
                        children: List.generate(5, (index) {
                          var _subCategory = _subCategoriesList.list.elementAt(index);
                          return CheckboxListTile(
                            value: _subCategory.selected,
                            onChanged: (value) {
                              setState(() {
                                _subCategory.selected = value;
                              });
                            },
                            title: Text(
                              _subCategory.name,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 1,
                            ),
                          );
                        }),
                      );
                    }),
                    initiallyExpanded: true,
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('Brands'),
                    children: List.generate(_brandsList.list.length, (index) {
                      var _brand = _brandsList.list.elementAt(index);
                      return CheckboxListTile(
                        value: _brand.selected,
                        onChanged: (value) {
                          setState(() {
                            _brand.selected = value;
                          });
                        },
                        secondary: SizedBox(
                          width: 40,
                          height: 30,
                          child: SvgPicture.asset(
                            _brand.logo,
                            color: _brand.color,
                          ),
                        ),
                        title: Text(
                          _brand.name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }),
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('Colors'),
                    children: List.generate(5, (index) {
                      var _color = _productColorsList.list.elementAt(index);
                      return CheckboxListTile(
                        value: _color.selected,
                        onChanged: (value) {
                          setState(() {
                            _color.selected = value;
                          });
                        },
                        secondary: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: _color.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: Text(
                          _color.name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }),
                  ),
                  ExpansionTile(
                    title: Text('Size'),
                    children: List.generate(_productSizesList.list.length, (index) {
                      var _size = _productSizesList.list.elementAt(index);
                      return CheckboxListTile(
                        value: _size.selected,
                        onChanged: (value) {
                          setState(() {
                            _size.selected = value;
                          });
                        },
                        secondary: SizedBox(
                          height: 38,
                          child: Chip(
                            label: Text(_size.code),
                            labelStyle: TextStyle(color: Theme.of(context).hintColor),
                            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                            backgroundColor: Theme.of(context).focusColor.withOpacity(0.1),
                            shape:
                                StadiumBorder(side: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                          ),
                        ),
                        title: Text(
                          _size.name,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/Category',
                    arguments: RouteArgument(id: 2, argumentsList: [new CategoriesList().list.elementAt(0)]));
              },
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Theme.of(context).accentColor,
              shape: StadiumBorder(),
              child: Text(
                'Apply Filters',
                textAlign: TextAlign.start,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  void clearSelection() {
    this._categoriesList.clearSelection();
    this._subCategoriesList.clearSelection();
    this._productColorsList.clearSelection();
    this._productSizesList.clearSelection();
  }
}
