import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_practice/cubit/app_cubit_states.dart';
import 'package:travel_app_practice/cubit/app_cubits.dart';
import 'package:travel_app_practice/models/data_model.dart';
import 'package:travel_app_practice/utils/colors.dart';

import 'package:travel_app_practice/widgets/app_large_text.dart';
import 'package:travel_app_practice/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //tab bar view state is in ticker provider state mixin
  Map images = {
    "balloning.png": " Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
        length: 3,
        vsync: this); //"this" should get the context so have to put it inside.

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        //to access the data
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return MainContent(
              tabController: tabController,
              images: images,
              info: info,
            );
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.tabController,
    required this.images,
    required this.info,
  }) : super(key: key);

  final TabController tabController;
  final Map images;
  final List<DataModel> info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 70, left: 20),
          child: Row(
            children: [
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black54,
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const AppLargeText(text: "Discover"),
        ),
        const SizedBox(
          height: 20,
        ),
        //Tap Bar
        Align(
          alignment: Alignment
              .centerLeft, //this is for aligning., works together with the below settings.
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true, //this will compress the tab bar elements
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            indicatorSize:
                TabBarIndicatorSize.label, //keeps the size same as the label.
            indicator: const CircleTabIndicator(
              color: AppColors.mainColor,
              radius: 4,
            ),
            controller: tabController,
            tabs: const [
              Tab(
                text: "Places",
              ),
              Tab(
                text: "Inspiration",
              ),
              Tab(
                text: "Emotions",
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: tabController,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AppCubits>(context)
                          .detailPage(info[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Text("There"),
              const Text("Bye"),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppLargeText(
                text: "Explore more",
                size: 22,
              ),
              AppText(
                text: "See all",
                color: AppColors.textColor1,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 120,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/${images.keys.elementAt(index)}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text: images.values.elementAt(index),
                      color: AppColors.textColor2,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  } //this will be supplied to the indicator property of the tab bar

}

//this is because the createBoxPainter return the Box Painter
class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    //configuration object we get access to wherever the user hs tapped
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true; //H\W Accelerations
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    ); //x position is in the middle where we tapped and y is the position which is offsetted(moved) by the height value.
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
