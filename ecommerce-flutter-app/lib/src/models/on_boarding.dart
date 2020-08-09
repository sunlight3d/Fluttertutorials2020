class Introduction {
  String image;
  String description;

  Introduction({this.image, this.description});
}

class IntroductionList {
  List<Introduction> _list;

  List<Introduction> get list => _list;

  IntroductionList() {
    _list = [
      new Introduction(
          image: 'img/onboarding0.png', description: 'Don\'t cry because it\'s over, smile because it happened.'),
      new Introduction(image: 'img/onboarding1.png', description: 'Be yourself, everyone else is already taken.'),
      new Introduction(image: 'img/onboarding2.png', description: 'So many books, so little time.'),
      new Introduction(image: 'img/onboarding3.png', description: 'A room without books is like a body without a soul.'),
    ];
  }
}
