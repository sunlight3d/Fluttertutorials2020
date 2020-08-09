class Slider {
  String image;
  String button;
  String description;

  Slider({this.image, this.button, this.description});
}

class SliderList {
  List<Slider> _list;

  List<Slider> get list => _list;

  SliderList() {
    _list = [
      new Slider(
          image: 'img/slider3.jpg',
          button: 'Collection',
          description: 'A room without books is like a body without a soul.'),
      new Slider(
          image: 'img/slider1.jpg', button: 'Explore', description: 'Be yourself, everyone else is already taken.'),
      new Slider(image: 'img/slider2.jpg', button: 'Visit Store', description: 'So many books, so little time.'),
    ];
  }
}
