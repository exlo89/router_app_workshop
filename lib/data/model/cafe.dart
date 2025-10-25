class Cafe {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String description;
  final bool hasWifi;
  final double rating;
  final String hours;

  Cafe({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.description,
    required this.hasWifi,
    required this.rating,
    required this.hours,
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
      hasWifi: json['hasWifi'] ?? false,
      rating: json['rating']?.toDouble() ?? 0.0,
      hours: json['hours'] ?? '',
    );
  }

  static List<Cafe> sampleCafes = [
    Cafe(
      id: '1',
      name: 'Cafe Mocha',
      address: '123 Coffee St, Caffeine City',
      latitude: 37.7749,
      longitude: -122.4194,
      imageUrl: 'https://images.unsplash.com/photo-1485217988980-11786ced9454',
      description: 'A cozy place to enjoy your coffee. Perfect for reading or working in a quiet atmosphere.',
      hasWifi: true,
      rating: 4.5,
      hours: 'Mon-Fri: 7:00-20:00, Sat-Sun: 8:00-22:00',
    ),
    Cafe(
      id: '2',
      name: 'Espresso Express',
      address: '456 Java Ave, Brewtown',
      latitude: 34.0522,
      longitude: -118.2437,
      imageUrl: 'https://images.pexels.com/photos/1024359/pexels-photo-1024359.jpeg',
      description: 'Fast service with great espresso. Ideal for a quick coffee break on the go.',
      hasWifi: false,
      rating: 4.2,
      hours: 'Mon-Sun: 6:00-18:00',
    ),
    Cafe(
      id: '3',
      name: 'Latte Lounge',
      address: '789 Latte Ln, Beanville',
      latitude: 40.7128,
      longitude: -74.0060,
      imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
      description: 'Relax and unwind with a latte. Comfortable seating and friendly staff.',
      hasWifi: true,
      rating: 4.7,
      hours: 'Mon-Fri: 8:00-21:00, Sat-Sun: 9:00-23:00',
    ),
    Cafe(
      id: '4',
      name: 'Cappuccino Corner',
      address: '321 Bean Blvd, Java Junction',
      latitude: 51.5074,
      longitude: -0.1278,
      imageUrl: 'https://images.unsplash.com/photo-1533777857889-4be7c70b33f7',
      description: 'Authentic Italian cappuccino in a modern setting. Try our homemade pastries!',
      hasWifi: true,
      rating: 4.6,
      hours: 'Mon-Sun: 7:30-19:30',
    ),
    Cafe(
      id: '5',
      name: 'The Roastery',
      address: '555 Roast Road, Grind City',
      latitude: 48.8566,
      longitude: 2.3522,
      imageUrl: 'https://images.pexels.com/photos/30424439/pexels-photo-30424439.jpeg',
      description: 'Watch our baristas roast beans fresh daily. Coffee lovers paradise!',
      hasWifi: true,
      rating: 4.9,
      hours: 'Mon-Fri: 7:00-19:00, Sat: 8:00-20:00, Sun: Closed',
    ),
    Cafe(
      id: '6',
      name: 'Brew & Bites',
      address: '777 Coffee Court, Beantown',
      latitude: 52.5200,
      longitude: 13.4050,
      imageUrl: 'https://images.pexels.com/photos/31888721/pexels-photo-31888721.jpeg',
      description: 'Great coffee paired with delicious sandwiches and salads.',
      hasWifi: false,
      rating: 4.3,
      hours: 'Mon-Sun: 8:00-17:00',
    ),
  ];
}
