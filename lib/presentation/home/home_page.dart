import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/search_input.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/space_height.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/colors.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/images.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/home/bloc/products/products_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/home/widgets/category_button.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/home/widgets/image_slider.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/home/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Images.recommendedProductBanner,
      Images.recommendedProductBanner,
      Images.recommendedProductBanner,
    ];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SpaceHeight(20.0),
          Row(
            children: <Widget>[
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Alamat Pengiriman',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorName.grey,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Cianjur, Jawa Barat',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorName.primary,
                        ),
                      ),
                      SpaceHeight(5.0),
                      Icon(
                        Icons.expand_more,
                        size: 18.0,
                        color: ColorName.primary,
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SizedBox(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      Images.iconBuy,
                      height: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SizedBox(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      Images.iconNotificationHome,
                      height: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SpaceHeight(16.0),
          SearchInput(
            controller: searchController,
            onChanged: (value) {},
          ),
          const SpaceHeight(16.0),
          ImageSlider(items: images),
          const SpaceHeight(12.0),
          const Text(
            'Kategori',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
          ),
          const SpaceHeight(12.0),
          Row(
            children: <Widget>[
              Flexible(
                child: CategoryButton(
                  imagePath: Images.fashion1,
                  label: 'Pakaian',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.fashion2,
                  label: 'Pakaian',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.fashion3,
                  label: 'Pakaian',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CategoryButton(
                  imagePath: Images.iconMore,
                  label: 'Lebih Banyak',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SpaceHeight(16.0),
          const Text(
            'Produk',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
          ),
          const SpaceHeight(8.0),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (data) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 55.0,
                    ),
                    itemCount: data.data.length,
                    itemBuilder: (context, index) => ProductCard(
                      data: data.data[index],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
