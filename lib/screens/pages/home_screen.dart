
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyptopulse/bloc/crypto_bloc/index.dart';
import 'package:zyptopulse/reuse_ui_widgets/custom_app_bar.dart';
import 'package:zyptopulse/reuse_ui_widgets/home_ui_crypto_card.dart';
import 'package:zyptopulse/reuse_ui_widgets/index.dart';
import '../../bloc/fav_bloc/index.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CryptoBloc>().add(FetchCryptoData());
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
        child: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) {
            if (state is LoadingCryptoState) {
              return const LoadingAnimation();
            }

            if (state is LoadedCryptoState) {
              final cryptoData = state.cryptoData;
              return ListView.separated(
                itemBuilder: (context, index) {
                  final crypto = cryptoData[index];
                  return HomeUiCryptoCard(crypto: crypto);
                },
                separatorBuilder: (context, index){
                  return Divider(indent: MediaQuery.of(context).size.width*.18,);
                },
                itemCount: cryptoData.length,
              );
            }

            if (state is ErrorCryptoState) {
              return Center(child: Text(state.errorMsg));
            }

            return const Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }
}

