import 'package:flutter/material.dart';
import 'package:final_project_bootcampflutter/ui/lib_ui.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listRestoProvider = Provider.of<ApiService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Restaurant',
                      style: titleStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountSetting(),
                          ),
                        );
                      },
                      child: Container(
                        width: 58,
                        height: 58,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                          ),
                        ),
                        child: Image.asset(
                          'assets/Pas Fot.png',
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Recomendations restaurant for you!',
                    style: titleStyle.copyWith(fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                _topCardSlider(context),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 4 / 5,
                  child: FutureBuilder<RestaurantResult>(
                    future: listRestoProvider.getListResto(),
                    builder:
                        (context, AsyncSnapshot<RestaurantResult> snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return ListView.separated(
                            itemBuilder: (context, index) => RestoCardSkelton(),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: 6);
                      } else {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data?.restaurants.length,
                            itemBuilder: (context, index) {
                              var restaurant =
                                  snapshot.data?.restaurants[index];
                              return _ListCardResto(restaurant: restaurant!);
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          return Text('');
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topCardSlider(BuildContext context) {
    var listRestoProvider = Provider.of<ApiService>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 230,
          child: FutureBuilder<RestaurantResult>(
            future: listRestoProvider.getListResto(),
            builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Expanded(
                                            child: Skeleton(
                                              height: 200,
                                              width: 10,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: 2);
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = snapshot.data?.restaurants[index];
                      return CardTopResto(
                        restaurant: restaurant!,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text('');
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

class _ListCardResto extends StatelessWidget {
  final Restaurants restaurant;

  _ListCardResto({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            height: 100,
            width: 70,
            image: NetworkImage(
                "${ApiService.baseUrlImage}${restaurant.pictureId}"),
          ),
        ),
        title: Text(
          restaurant.name!,
          style: titleStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: Row(
          children: [
            Icon(
              CupertinoIcons.location_solid,
              size: 20,
              color: Colors.redAccent,
            ),
            Text(
              "${restaurant.city}",
              style: titleStyle.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestoDetailPage(id: restaurant.id!),
            ),
          );
        },
      ),
    );
  }
}

class PageResto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listRestoProvider = Provider.of<ApiService>(context);
    return Scaffold(
        body: FutureBuilder<RestaurantResult>(
            future: listRestoProvider.getListResto(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data?.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = snapshot.data?.restaurants[index];
                    return _ListCardResto(restaurant: restaurant!);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Text('');
              }
            }));
  }
}
