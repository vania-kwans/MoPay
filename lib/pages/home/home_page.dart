import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/bloc/user/user_bloc.dart';
import 'package:mopay_ewallet/bloc/user/user_state.dart';
import 'package:mopay_ewallet/components/my_error_component.dart';
import 'package:mopay_ewallet/models/user.dart';
import 'package:mopay_ewallet/pages/home/home_menu.dart';
import 'package:mopay_ewallet/pages/home/home_recommendation.dart';
import 'package:mopay_ewallet/pages/home/home_tips.dart';
import 'package:mopay_ewallet/pages/home/home_upper.dart';
import 'package:mopay_ewallet/pages/home/widgets/home_ads.dart';
import 'package:mopay_ewallet/utama/profile.dart';
import 'package:mopay_ewallet/utils/image_choice.dart';
import 'package:mopay_ewallet/utils/transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserBloc bloc;

  @override
  void initState() {
    bloc = Provider.of<UserBloc>(context, listen: false);

    bloc.getProfile();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      DateTime lastAdsShown = await Store.getLastAdsShown();
      if (lastAdsShown
          .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        showAdsDialog();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<UserState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            UserState state = snapshot.data!;

            if (state.hasError) {
              return MyErrorComponent(onRefresh: () async {
                await bloc.getProfile();
              });
            }

            User currentUser = state.user!;

            return RefreshIndicator(
              onRefresh: () async {
                await bloc.getProfile();
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo-mopay/logo2.png',
                            width: 100,
                          ),
                          Row(
                            children: [
                              Text(
                                "Hi, ${currentUser.name}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(slideInFromRight(
                                      const Profile(
                                        isRerouted: true,
                                      ),
                                    ));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[350],
                                    radius: 20,
                                    backgroundImage:
                                        ImageChoice.getPicture(currentUser),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: const Hero(
                        tag: "mopay",
                        child: Column(
                          children: [
                            SizedBox(height: 20),

                            //CARD ----------------------------------------------------------------------------------------------------------------------------
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HomeUpper(), // Ada di file home_upper.dart
                                SizedBox(height: 10),
                                HomeMenu(), // Ada di file home_menu.dart
                                SizedBox(height: 20),
                                HomeRecommendation(),
                                SizedBox(height: 20),
                                HomeTips(),
                                SizedBox(height: 50),
                                // // FITUR SEARCH --------------------------------------------------------------------------------------------------------------------
                                // OutlinedButton.icon(
                                //   onPressed: () {},
                                //   icon: const Icon(
                                //     Icons.search,
                                //     color: Color(0xff00224D),
                                //   ),
                                //   label: const Text(
                                //     "Cari Fitur",
                                //     style: TextStyle(
                                //         color: Color(0xff00224D),
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                //   style: OutlinedButton.styleFrom(
                                //     fixedSize:
                                //         Size.fromWidth(MediaQuery.of(context).size.width),
                                //     backgroundColor: const Color(0xffEEEEEE),
                                //     alignment: Alignment.centerLeft,
                                //     padding: const EdgeInsets.all(20),
                                //   ),
                                // ),
                                // const SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
