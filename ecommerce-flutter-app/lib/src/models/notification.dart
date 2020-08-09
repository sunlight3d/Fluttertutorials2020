class Notification {
  String image;
  String title;
  String time;
  bool read;

  Notification(this.image, this.title, this.time, this.read);
}

class NotificationList {
  List<Notification> _notifications;

  NotificationList() {
    this._notifications = [
      new Notification('img/man1.webp', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          '33min ago', false),
      new Notification(
          'img/home4.webp', 'It is a long established fact that a reader will be distracted', '32min ago', true),
      new Notification(
          'img/sport1.webp', 'There are many variations of passages of Lorem Ipsum available', '34min ago', true),
      new Notification(
          'img/man3.webp', 'Contrary to popular belief, Lorem Ipsum is not simply random text', '52min ago', true),
      new Notification('img/pro1.webp', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          '10min ago', false),
      new Notification(
          'img/user0.jpg', 'It is a long established fact that a reader will be distracted', '12min ago', false),
      new Notification(
          'img/man5.webp', 'There are many variations of passages of Lorem Ipsum available', '2 hours ago', true),
      new Notification(
          'img/baby2.webp', 'Contrary to popular belief, Lorem Ipsum is not simply random text', '1 day ago', false),
    ];
  }

  List<Notification> get notifications => _notifications;
}
