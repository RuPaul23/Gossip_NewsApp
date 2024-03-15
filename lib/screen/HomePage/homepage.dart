import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/models/category/articleModel.dart';
import 'package:news_app/models/category/showCategory/categoryModel.dart';
import 'package:news_app/models/list/listOfNews.dart';
import 'package:news_app/models/list/sliderModel.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:news_app/widgets/custom_sizes/custom_sizes.dart';
import 'package:news_app/widgets/custom_heading_section/custom_heading_section.dart';

import '../../models/trendingTile/trendingTile.dart';
import '../../widgets/custom_animated_scroll_indicator/custom_scroll_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Model Loading
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getSliders();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  getSliders() async {
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            backgroundColor: Colors.yellow,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            leading: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Iconsax.menu),
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'GOSSIP',
                style: TextStyle(color: Colors.black),
              ),
              titlePadding: const EdgeInsets.all(10.0), //Padding for title ecnter
              background: Image.asset(
                'assets/animation/AppBarGossip.gif',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(CustomSizes.spaceBtwItems),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _loading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            // List of News
                            ListOfNews(categories: categories),
                            // Breaking News
                            CustomSectionHeading(
                              title: 'Breaking News',
                              textColor: Colors.black,
                              showActionButton: true,
                              buttonTitle: 'View all',
                              onPressed: () {},
                            ),
                            const SizedBox(height: CustomSizes.spaceBtwItemsmd),
                            // Carousel
                            if (sliders.isNotEmpty)
                              CarouselSlider.builder(
                                itemCount: sliders.length,
                                itemBuilder: (BuildContext context, int index, int realIndex) {
                                  String? resimage = sliders[index].urlToImage;
                                  String? resname = sliders[index].title;
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: resimage!,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                      Container(
                                        height: 200.0,
                                        padding: const EdgeInsets.only(left: 8.0),
                                        margin: const EdgeInsets.only(top: 130.0),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.black26,
                                        ),
                                        child: Text(
                                          resname!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                options: CarouselOptions(
                                  height: 200.0,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  viewportFraction: 0.8,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ),
                              ),
                            // CustomScrollIndicator
                            const SizedBox(height: CustomSizes.md14),
                            CustomScrollIndicator(activeIndex: activeIndex, sliders: sliders),
                            // List of News
                            const SizedBox(height: CustomSizes.spaceBtwItemsmd),
                            // Trending News
                            const CustomSectionHeading(
                              title: 'Trending News',
                              textColor: Colors.black,
                              showActionButton: true,
                              buttonTitle: 'View all',
                            ),
                            SizedBox(
                              height: 1000,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                itemCount: articles.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return TrendingNewsList(
                                    url: articles[index].url!,
                                    imageUrl: articles[index].urlToImage!,
                                    title: articles[index].title!,
                                    desc: articles[index].description!,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
