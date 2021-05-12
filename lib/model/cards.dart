

class MatchCard  {
  String imageUrl;
  String breedName;
  String name;
  int id;

  MatchCard({
    required this.imageUrl,
    required this.breedName,
    required this.name,
    required this.id,
  });

  // @override
  // String toString() {
  //   return 'Match-card: $id';
  // }

  // @override
  // bool operator ==(other) {
  //   return this.toString() == other.toString();
  // }

  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

List<MatchCard> matchCard = [
  MatchCard(
    id: 1,
    imageUrl: 'assets/images/dogs/dog1.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 2,
    imageUrl: 'assets/images/dogs/dog2.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 3,
    imageUrl: 'assets/images/dogs/dog3.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 4,
    imageUrl: 'assets/images/dogs/dog4.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 5,
    imageUrl: 'assets/images/dogs/dog5.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 6,
    imageUrl: 'assets/images/dogs/dog6.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 7,
    imageUrl: 'assets/images/dogs/dog7.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 8,
    imageUrl: 'assets/images/dogs/dog1.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 9,
    imageUrl: 'assets/images/dogs/dog2.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
  MatchCard(
    id: 10,
    imageUrl: 'assets/images/dogs/dog3.jpeg',
    breedName: 'Breed Name',
    name: 'Malena Veronica',
  ),
];
