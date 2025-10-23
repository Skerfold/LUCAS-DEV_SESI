class TimeRecord {
  final String id;
  final String userId;
  final DateTime timestamp;
  final double latitude;
  final double longitude;

  TimeRecord({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory TimeRecord.fromMap(Map<String, dynamic> map) {
    return TimeRecord(
      id: map['id'],
      userId: map['userId'],
      timestamp: DateTime.parse(map['timestamp']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
