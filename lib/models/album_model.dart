class AlbumModel {
  final String artistName;
  final String collectionName;
  final String artworkUrl100;
  final double collectionPrice;
  final DateTime releaseDate;

  AlbumModel({
    required this.artistName,
    required this.collectionName,
    required this.artworkUrl100,
    required this.collectionPrice,
    required this.releaseDate,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      artistName: json['artistName'] ?? '',
      collectionName: json['collectionName'] ?? '',
      artworkUrl100: json['artworkUrl100'] ?? '',
      collectionPrice: json['collectionPrice'] ?? 0.0,
      releaseDate: DateTime.parse(json['releaseDate'] ?? ''
      ),
    );
  }
}
