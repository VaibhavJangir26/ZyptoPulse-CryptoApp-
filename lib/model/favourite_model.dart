import 'crypto_model.dart';

class FavouriteModel {

  final String? id;
  final String? name;
  final String? symbol;
  final double? currentPrice;
  final int? marketCapRank;
  final double? priceChangePercentage24h;
  final String? imageUrl;

  FavouriteModel({
    this.id,
    this.name,
    this.symbol,
    this.currentPrice,
    this.marketCapRank,
    this.priceChangePercentage24h,
    this.imageUrl,
  });


  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      marketCapRank: json['market_cap_rank'] as int?,
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'current_price': currentPrice,
      'market_cap_rank': marketCapRank,
      'price_change_percentage_24h': priceChangePercentage24h,
      'image_url': imageUrl,
    };
  }


  factory FavouriteModel.fromCryptoModel(CryptoModel crypto) {
    return FavouriteModel(
      id: crypto.id,
      name: crypto.name,
      symbol: crypto.symbol,
      currentPrice: crypto.currentPrice,
      marketCapRank: crypto.marketCapRank,
      priceChangePercentage24h: crypto.priceChangePercentage24h,
      imageUrl: crypto.image,
    );
  }
}

