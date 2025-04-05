import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fav_bloc/index.dart';
import '../model/index.dart';
import '../reuse_widget/index.dart';
import '../theme/app_theme.dart';

class FavUiCryptoCard extends StatelessWidget {
  const FavUiCryptoCard({super.key, required this.fav});
  final FavouriteModel fav;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white70,
        child: CachedNetworkImage(
          imageUrl: fav.imageUrl ?? "",
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => Container(color: Colors.blue.shade50),
          errorWidget: (context, error, _) => const Icon(Icons.error),
        ),
      ),
      trailing: InkWell(
        onTap: () {
          context.read<FavBloc>().add(RemoveFromFav(fav.id!));
        },
        child: const Icon(Icons.delete, color: Colors.red),
      ),
      title: CustomText(
        text: fav.name ?? "",
        fontWeight: FontWeight.w700,
        fontSize: 16,
        maxLine: 1,
        textOverFlow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Market Cap Rank",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                maxLine: 1,
                textOverFlow: TextOverflow.ellipsis,
              ),
              CustomText(
                text: fav.marketCapRank.toString(),
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: const Color(0xff5ED5A8),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Current Price",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                maxLine: 1,
                textOverFlow: TextOverflow.ellipsis,
              ),
              CustomText(
                text: fav.currentPrice!.toStringAsFixed(1),
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: AppColors.textFaded,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Price Change in 24h",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                maxLine: 1,
                textOverFlow: TextOverflow.ellipsis,
              ),
              CustomText(
                text: "${fav.priceChangePercentage24h!.toStringAsFixed(1)}%",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: fav.priceChangePercentage24h! < 0.0
                    ? Colors.red
                    : Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
