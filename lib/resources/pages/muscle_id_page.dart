import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/muscle_id_controller.dart';
import 'package:flutter_app/app/data/item.dart';
import 'package:flutter_app/app/models/muscle.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/widgets/layout.dart';
import 'package:flutter_app/resources/widgets/video_player_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_support/widgets/ny_state.dart';

class MuscleIdPage extends NyStatefulWidget {
  final MuscleIdController controller = MuscleIdController();

  MuscleIdPage({Key? key}) : super(key: key);

  @override
  _MuscleIdPageState createState() => _MuscleIdPageState();
}

class MuscleAnimatingTransition extends StatelessWidget {
  const MuscleAnimatingTransition({
    required this.heroAnimation,
    required this.video,
    Key? key,
  }) : super(key: key);

  final Animation<double> heroAnimation;
  final String video;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return SizedBox(
          height: 250,
          child: VideoPlayerWidget(heroAnimation: heroAnimation, url: video),
        );
      },
    );
  }
}

class _MuscleIdPageState extends NyState<MuscleIdPage>
    with TickerProviderStateMixin {
  dynamic muscle;

  @override
  widgetDidLoad() async {
    var item = await ItemData<Muscle>().get(Muscle(), widget.data());
    setState(() {
      muscle = item;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return muscle == null
        ? Container()
        : LayoutWidget(
            title: "muscles." + muscle?.name + ".name",
            body: Column(
              children: [
                ...(muscle.movieLying != ""
                    ? [
                        Container(
                          decoration: BoxDecoration(
                            color: NyColors.of(context).secondaryBackground,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: "id",
                            child: MuscleAnimatingTransition(
                                video: muscle?.movieLying,
                                heroAnimation: const AlwaysStoppedAnimation(1)),
                            // This app uses a flightShuttleBuilder to specify the exact widget
                            // to build while the hero transition is mid-flight.
                            //
                            // It could either be specified here or in SongsTab.
                            flightShuttleBuilder: (context,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext) {
                              return MuscleAnimatingTransition(
                                heroAnimation: animation,
                                video: muscle?.movieLying,
                              );
                            },
                          ),
                        ),
                        const Divider(
                          height: 0,
                          color: Colors.grey,
                        )
                      ]
                    : []),
                Expanded(
                  child: GridView(
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(top: 24, left: 24, right: 24),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                      (muscle as Muscle).getImages().length,
                      (int index) {
                        return Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: NyColors.of(context).secondaryBackground,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                            ),
                            child: Image.asset(
                              (muscle as Muscle).getImages()[index],
                              height: 100,
                              width: 100,
                            ));
                      },
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisCount: 2,
                      mainAxisSpacing: 24.0,
                      crossAxisSpacing: 24.0,
                    ),
                  ),
                ),
              ],
            ));
  }
}
