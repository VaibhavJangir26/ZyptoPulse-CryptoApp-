
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyptopulse/bloc/fav_bloc/index.dart';
import 'package:zyptopulse/reuse_ui_widgets/index.dart';
import 'package:lottie/lottie.dart';

import '../../reuse_widget/custom_text.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavBloc>().add(FetchFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),

      body: SafeArea(
        child: BlocBuilder<FavBloc, FavState>(
          builder: (context, state) {
            if (state is LoadingFavState) {
              return const LoadingAnimation();
            }

            if (state is LoadedFavState) {
              final favListCrypto = state.favoriteList;
              if (favListCrypto.isEmpty) {
                return addToFavAnimation();
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  final fav = favListCrypto[index];
                  return FavUiCryptoCard(fav: fav);
                },
                separatorBuilder: (context, index) =>
                    Divider(indent: MediaQuery
                        .of(context)
                        .size
                        .width * .18,),
                itemCount: favListCrypto.length,
              );
            }

            if (state is ErrorFavState) {
              return Center(child: Text(state.errorMsg));
            }

            return const Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }

  Widget addToFavAnimation(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset("assets/animation_json/addToFav.json",
            filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              repeat: true,
            ),
          ),
          const CustomText(text: "Add to fav",fontSize: 18,color: Colors.orange,textAlign: TextAlign.center,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }


}
