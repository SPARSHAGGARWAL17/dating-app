class Matches {
  String name;
  String image;
  Matches({
    required this.image,
    required this.name,
  });

  factory Matches.fromObject(dynamic value) {
    return Matches(name: value!.name, image: value!.image);
  }
}

List<Matches> kMatches = [
  Matches(image: 'assets/images/profiles/profile1.jpg', name: 'Denise Burton'),
  Matches(image: 'assets/images/profiles/profile2.jpg', name: 'Maria Long'),
  Matches(image: 'assets/images/profiles/profile3.jpg', name: 'Deborah Plamer'),
  Matches(
      image: 'assets/images/profiles/profile4.jpg', name: 'Crystal Castilo'),
  Matches(image: 'assets/images/profiles/profile5.jpg', name: 'Julia Morris'),
  Matches(image: 'assets/images/profiles/profile6.jpg', name: 'chirist'),
  Matches(
      image: 'assets/images/profiles/profile7.jpg', name: 'Christina Evans'),
  Matches(
      image: 'assets/images/profiles/profile7.jpg', name: 'Christina Evans'),
  Matches(
      image: 'assets/images/profiles/profile7.jpg', name: 'Christina Evans'),
  Matches(
      image: 'assets/images/profiles/profile7.jpg', name: 'Christina Evans'),
];
