class MovieCategoriesModel {
  final String titleCategory;
  final String imageCategory;

  MovieCategoriesModel({
    required this.titleCategory,
    required this.imageCategory,
  });

  static final List<MovieCategoriesModel> movieCategoriesList = [
    MovieCategoriesModel(
      titleCategory: 'Action',
      imageCategory:
          'https://th.bing.com/th?id=OIP.x_hK446qqO9HfHYXO15uqQHaF7&w=279&h=223&c=8&rs=1&qlt=90&o=6&dpr=1.1&pid=3.1&rm=2',
    ),
    MovieCategoriesModel(
      titleCategory: 'Drama',
      imageCategory:
          'https://th.bing.com/th/id/R.23b8baad02ae777be21ff37f7f020be7?rik=Y9GgabmCRVVZtw&pid=ImgRaw&r=0',
    ),
    MovieCategoriesModel(
      titleCategory: 'Comedy',
      imageCategory:
          'https://i.pinimg.com/736x/46/e9/8d/46e98dfa0c07888d8bf2d54fc4fa01c8.jpg',
    ),
    MovieCategoriesModel(
      titleCategory: 'Romance',
      imageCategory:
          'https://th.bing.com/th/id/R.9ae963af36ada50948a056eb36f15981?rik=PtjjGpohqqCsNg&pid=ImgRaw&r=0',
    ),
    MovieCategoriesModel(
      titleCategory: 'Thriller',
      imageCategory:
          'https://th.bing.com/th/id/OIP.6ep9j41DzFmgrHeOTwZaDQAAAA?rs=1&pid=ImgDetMain',
    ),
    MovieCategoriesModel(
      titleCategory: 'Sci-Fi',
      imageCategory:
          'https://th.bing.com/th/id/R.03b9196c63e555c25035eb93e69dd1a5?rik=0KQYIFTyzTq%2fJw&pid=ImgRaw&r=0',
    ),
    MovieCategoriesModel(
      titleCategory: 'Fantasy',
      imageCategory:
          'https://miblart.com/wp-content/uploads/2021/06/The-Curse-of-Infinity-by-Rachel-Hetrick.png',
    ),
    MovieCategoriesModel(
      titleCategory: 'Adventure',
      imageCategory:
          'https://images.template.net/2912/Kid-s-Adventure-Book-Cover-Template-2x.jpg',
    ),
    MovieCategoriesModel(
      titleCategory: 'Animation',
      imageCategory:
          'https://th.bing.com/th/id/R.ab761d05fa748c981b78e5d5f988a153?rik=ikfQXzb%2fjr3cEw&riu=http%3a%2f%2fwww.my-sf.com%2fwp-content%2fuploads%2f2015%2f06%2fInside-Out-poster.jpg&ehk=1bAnz5D%2f9RvOv2Z%2fAvLRimPFDsvVwvCTkm5HuvkEDaw%3d&risl=&pid=ImgRaw&r=0',
    ),
    MovieCategoriesModel(
      titleCategory: 'History',
      imageCategory: 'https://mccovers.blob.core.windows.net/covers/78561.jpg',
    ),
    MovieCategoriesModel(
      titleCategory: 'War',
      imageCategory:
          'https://www.creativeparamita.com/wp-content/uploads/2020/10/war-machine-1.jpg',
    ),
    MovieCategoriesModel(
      titleCategory: 'Sport',
      imageCategory:
          'https://m.media-amazon.com/images/M/MV5BNjllMDNiNWQtZmE4OS00Mjg4LTk1YmItOTY3YWZiMzgzODgyXkEyXkFqcGdeQXVyMzMwMjI2NA@@._V1_.jpg',
    ),
  ];
}
