import 'package:clone_spotify/home/bloc/home_bloc.dart';
import 'package:clone_spotify/home/bloc/home_event.dart';
import 'package:clone_spotify/home/bloc/home_state.dart';
import 'package:clone_spotify/home/repository/home_repository.dart';
import 'package:clone_spotify/home/widgets/category_card.dart';
import 'package:clone_spotify/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeRepository homeRepository = HomeRepository();
  late HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(homeRepository)..add(Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size padding = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [MyTheme.generalColors.purple,MyTheme.generalColors.black],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: const [0.0,1.0],
                tileMode: TileMode.clamp
            ),
          ),
          child: BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is DataState) {
                return Stack(children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                              itemCount: state.categories.categories.items.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return CategoryCard(
                                  item: state.categories.categories.items[index],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  state.categories.categories.items.isEmpty
                      ? Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Text(
                      "No hay coincidencias.",
                      style: TextStyle(color: MyTheme.generalColors.black),
                      textAlign: TextAlign.center,
                    ),
                  )
                      : const SizedBox(),
                ]);
              }

              return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.generalColors.green,
                  ));
            },
          ),
        ));
  }
}