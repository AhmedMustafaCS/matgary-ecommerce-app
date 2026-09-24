class HomeCarouselItemModel {
  final String id;
  final String imgUrl;

  HomeCarouselItemModel({
    required this.id,
    required this.imgUrl,
  });
}

List<HomeCarouselItemModel> dummyHomeCarouselItems = [
  HomeCarouselItemModel(
    id: '1',
    imgUrl: 'https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg',
  ),
  HomeCarouselItemModel(
    id: '2',
    imgUrl: 'https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg',
  ),
  HomeCarouselItemModel(
    id: '3',
    imgUrl: 'https://i.pinimg.com/736x/af/e2/cd/afe2cd4bf4430d36c2d550c8fb97fdd3.jpg',
  ),
];
