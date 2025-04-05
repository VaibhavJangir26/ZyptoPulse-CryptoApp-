import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fav_bloc/index.dart';
import '../model/index.dart';
import '../reuse_widget/index.dart';
import '../theme/app_theme.dart';

class HomeUiCryptoCard extends StatelessWidget {
  const HomeUiCryptoCard({super.key, required this.crypto});
  final CryptoModel crypto;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white70,
        child: CachedNetworkImage(
          imageUrl: crypto.image ?? "",
          height: 40,
          width: 40,
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => Container(color: Colors.blue.shade50),
          errorWidget: (context, error, _) => const Icon(Icons.error),
        ),
      ),

      title: CustomText(
        text: crypto.name ?? "",
        fontWeight: FontWeight.w700,
        maxLine: 2,
        textOverFlow: TextOverflow.ellipsis,
        fontSize: 16,
        color: AppColors.textFaded,
      ),

      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Symbol",
                fontSize: 12,
                textAlign: TextAlign.start,
                color: AppColors.textFaded,
              ),
              CustomText(
                text: (crypto.symbol ?? "").toUpperCase(),
                fontSize: 12,
                textAlign: TextAlign.start,
                color: AppColors.textFaded,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Market Change",
                fontSize: 14,
                color: AppColors.textFaded,
              ),
              CustomText(
                text:
                    "${crypto.marketCapChangePercentage24h!.toStringAsFixed(1)}%",
                fontSize: 12,
                color: crypto.marketCapChangePercentage24h! < 0
                    ? Colors.red
                    : Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "ATH",
                fontSize: 14,
                color: AppColors.textFaded,
              ),
              CustomText(
                text: crypto.ath!.toStringAsFixed(1),
                fontSize: 12,
                color: crypto.ath! < 0 ? Colors.red : Colors.green,
              ),
            ],
          ),
        ],
      ),

      // Favorite Button
      trailing: BlocBuilder<FavBloc, FavState>(
        builder: (context, state) {
          bool isFav = state is LoadedFavState &&
              state.favoriteList.any((fav) => fav.id == crypto.id);
          return InkWell(
            onTap: () {
              if (isFav) {
                context.read<FavBloc>().add(RemoveFromFav(crypto.id ?? ""));
              } else {
                context.read<FavBloc>().add(
                      AddToFav(FavouriteModel.fromCryptoModel(crypto)),
                    );
              }
            },
            child: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.orange : Colors.grey),
          );
        },
      ),
    );
  }
}
