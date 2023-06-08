import 'package:food_app/core/app_image.dart';

class Review {
  String? review;
  String? name;
  String? avtar;

  Review(this.review, this.name, this.avtar);
}

List<Review> reviews = [
  Review(
      'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote.',
      'Alyce Lambo',
      AppImages.avatar),
  Review(
      'Been a life saver for keeping our sanity during the pandemic, although they could improve some of their ui and how they handle specials as it often is unclear how to use them or everything is sold out so fast it feels a bit bait and switch. Still Id be stir crazy and losing track of days without so...',
      'Gonela Solom',
      AppImages.avatar),
  Review(
      'Got an intro offer of 50% off first order that did not work..... I have scaled the app to find a contact us button but only a spend with us button available.',
      'Brian C',
      AppImages.avatar)
];
