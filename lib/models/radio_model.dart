class RadioStation {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String channelImage;
  String channelLiveImage;
  String channelLiveUrl;

  RadioStation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.channelImage,
    required this.channelLiveImage,
    required this.channelLiveUrl,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      channelImage: json['channel_image'],
      channelLiveImage: json['channel_live_image'],
      channelLiveUrl: json['channel_live_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'name': name,
      'channel_image': channelImage,
      'channel_live_image': channelLiveImage,
      'channel_live_url': channelLiveUrl,
    };
  }
}