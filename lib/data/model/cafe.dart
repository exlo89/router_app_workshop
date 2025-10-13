class Cafe {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String description;

  Cafe({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.description,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  static List<Cafe> sampleCafes = [
    Cafe(
      id: '1',
      name: 'Cafe Mocha',
      address: '123 Coffee St, Caffeine City',
      latitude: 37.7749,
      longitude: -122.4194,
      imageUrl: 'https://example.com/cafe_mocha.jpg',
      description: 'A cozy place to enjoy your coffee.',
    ),
    Cafe(
      id: '2',
      name: 'Espresso Express',
      address: '456 Java Ave, Brewtown',
      latitude: 34.0522,
      longitude: -118.2437,
      imageUrl: 'https://example.com/espresso_express.jpg',
      description: 'Fast service with great espresso.',
    ),
    Cafe(
      id: '3',
      name: 'Latte Lounge',
      address: '789 Latte Ln, Beanville',
      latitude: 40.7128,
      longitude: -74.0060,
      imageUrl: 'https://example.com/latte_lounge.jpg',
      description: 'Relax and unwind with a latte.',
    ),
  ];
}
