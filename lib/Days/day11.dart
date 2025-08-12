import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'dart:async';

class Day11 extends StatefulWidget {
  const Day11({super.key});

  @override
  State<Day11> createState() => _Day11State();
}

class _Day11State extends State<Day11> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  final PageController _categoryPageController = PageController();
  int _currentPage = 0;
  int _currentCategoryPage = 0;
  int _selectedNavIndex = 0;

  List<String> imagesCount = [
    "https://5.imimg.com/data5/RV/LI/MY-31825245/trendy-casual-shirt-500x500.jpg",
    "https://bamigo.com/media/catalog/product/cache/e5003119a0e3fd304438d617b07da7a2/b/a/bamigo_man_004433_kopie_1.jpg",
    "https://cdn.beymen.com/mnresize/505/704/productimages/50whz5zv.sq0_IMG_02_8683791597786.jpg",
    "https://i.pinimg.com/736x/92/8b/d1/928bd1dcb9357bb948bfe00bd4126d06.jpg",
  ];

  // Animation Controllers
  late AnimationController _headerAnimationController;
  late AnimationController _carouselAnimationController;
  late AnimationController _categoryAnimationController;
  late AnimationController _productsAnimationController;
  late AnimationController _floatingAnimationController;

  // Auto-scroll timer
  Timer? _autoScrollTimer;

  // Animations
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _carouselFadeAnimation;
  late Animation<Offset> _carouselSlideAnimation;
  late Animation<double> _categoryFadeAnimation;
  late Animation<Offset> _categorySlideAnimation;
  late Animation<double> _productsFadeAnimation;
  late Animation<Offset> _productsSlideAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startEntranceAnimations();
  }

  void _initializeAnimations() {
    // Header animations
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Carousel animations
    _carouselAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _carouselFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _carouselAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _carouselSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _carouselAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Category animations
    _categoryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _categoryFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _categoryAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _categorySlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _categoryAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Products animations
    _productsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );
    _productsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _productsAnimationController,
        curve: Curves.easeOut,
      ),
    );
    _productsSlideAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _productsAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Floating animation for cards
    _floatingAnimationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _floatingAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _floatingAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _startEntranceAnimations() async {
    // Start floating animation immediately and repeat
    _floatingAnimationController.repeat(reverse: true);

    // Staggered entrance animations
    await Future.delayed(const Duration(milliseconds: 100));
    _headerAnimationController.forward();

    await Future.delayed(const Duration(milliseconds: 200));
    _carouselAnimationController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    _categoryAnimationController.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _productsAnimationController.forward();

    // Start auto-scroll after all animations complete
    await Future.delayed(const Duration(milliseconds: 2000));
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % 3;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _pauseAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  void _resumeAutoScroll() {
    // Resume auto-scroll after 5 seconds of inactivity
    Timer(const Duration(seconds: 5), () {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _headerAnimationController.dispose();
    _carouselAnimationController.dispose();
    _categoryAnimationController.dispose();
    _productsAnimationController.dispose();
    _floatingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 8),

                // Animated Header
                SlideTransition(
                  position: _headerSlideAnimation,
                  child: FadeTransition(
                    opacity: _headerFadeAnimation,
                    child: _buildHeader(),
                  ),
                ),

                Column(
                  children: [
                    const SizedBox(height: 20),

                    // Animated Carousel Section
                    SlideTransition(
                      position: _carouselSlideAnimation,
                      child: FadeTransition(
                        opacity: _carouselFadeAnimation,
                        child: _buildCarousel(),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Animated Category Icons
                    SlideTransition(
                      position: _categorySlideAnimation,
                      child: FadeTransition(
                        opacity: _categoryFadeAnimation,
                        child: _buildCategorySection(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Animated Category Page Indicator
                    FadeTransition(
                      opacity: _categoryFadeAnimation,
                      child: _buildCategoryPageIndicator(),
                    ),

                    const SizedBox(height: 30),

                    // Animated Best Sale Products
                    SlideTransition(
                      position: _productsSlideAnimation,
                      child: FadeTransition(
                        opacity: _productsFadeAnimation,
                        child: _buildBestSaleSection(),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search Bar
          Container(
            height: 50,
            width: 270,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 25,
                  colorFilter: const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search..",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Notification Icons
          Row(
            children: [
              _buildNotificationIcon("assets/icons/shopping_bag.svg", 2),
              const SizedBox(width: 15),
              _buildNotificationIcon("assets/icons/message.svg", 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(String iconPath, int notificationCount) {
    return Stack(
      children: [
        Container(
          height: 40,
          child: SvgPicture.asset(
            iconPath,
            height: iconPath == "assets/icons/message.svg" ? 30 : 35,
            colorFilter: const ColorFilter.mode(
              Colors.black54,
              BlendMode.srcIn,
            ),
          ),
        ),
        if (notificationCount > 0)
          Positioned(
            top: 0,
            right: -1,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: AnimatedBuilder(
                    animation: _floatingAnimationController,
                    builder: (context, child) {
                      double pulseScale =
                          1.0 +
                              (math.sin(
                                _floatingAnimationController.value *
                                    2 *
                                    math.pi,
                              ) *
                                  0.1);
                      return Transform.scale(
                        scale: pulseScale,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Text(
                            notificationCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        // Carousel with indicator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#Fashion Day",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: List.generate(3, (index) {
                  final bool isActive = _currentPage == index;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: isActive ? 16 : 8, // longer when active
                    height: 4,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.black87 : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // consistent rounded borders
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 180,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onPanStart: (_) => _pauseAutoScroll(),
                  onPanEnd: (_) => _resumeAutoScroll(),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_pageController.position.haveDimensions) {
                            value = _pageController.page! - index;
                            value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                          }
                          return Transform.scale(
                            scale: value,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.8, end: 1.0),
                              duration: Duration(
                                milliseconds: 500 + (index * 200),
                              ),
                              curve: Curves.elasticOut,
                              builder: (context, scale, _) {
                                return Transform.scale(
                                  scale: scale,
                                  child: _buildCarouselItem(index + 1),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarouselItem(int index) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            "assets/images/carousel_image_$index.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {"icon": "assets/icons/category.svg", "label": "Category"},
      {"icon": "assets/icons/aeroplane.svg", "label": "Flight"},
      {"icon": "assets/icons/package.svg", "label": "Bill"},
      {"icon": "assets/icons/package.svg", "label": "Data plan"},
      {"icon": "assets/icons/topup.svg", "label": "Top Up"},
    ];

    // Repeat categories to create multiple pages
    final allCategories = [...categories, ...categories, ...categories];

    return Container(
      height: 100,
      child: PageView.builder(
        controller: _categoryPageController,
        onPageChanged: (index) {
          setState(() {
            _currentCategoryPage = index;
          });
        },
        itemCount: 3, // 3 pages of categories
        itemBuilder: (context, pageIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                final categoryIndex = (pageIndex * 5) + index;
                final category =
                allCategories[categoryIndex % allCategories.length];
                return _buildCategoryItem(
                  category["icon"]!,
                  category["label"]!,
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final bool isActive = _currentCategoryPage == index;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: isActive ? 16 : 8,
          height: 4,
          decoration: BoxDecoration(
            color: isActive ? Colors.black87 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildCategoryItem(String iconPath, String label) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: GestureDetector(
            onTap: () {
              // Add haptic feedback and scale animation
              _animateButtonPress();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(
                        milliseconds: 400 + (label.length * 50),
                      ),
                      builder: (context, iconValue, _) {
                        return Transform.rotate(
                          angle: (1 - iconValue) * 0.5,
                          child: SvgPicture.asset(
                            iconPath,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 500 + (label.length * 30)),
                    builder: (context, textValue, _) {
                      return Opacity(
                        opacity: textValue,
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _animateButtonPress() {
    // This can be expanded with haptic feedback and custom animations
  }

  void _navigateToProductDetail(
      String title,
      String price,
      double rating,
      int imageIndex,
      bool isFavorited,
      int reviews,
      ) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => ProductDetailScreen(
          title: title,
          price: price,
          rating: rating,
          imageUrl: imagesCount[imageIndex % imagesCount.length],
          isFavorited: isFavorited,
          reviews: reviews,
          heroTag: 'product_$imageIndex',
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.elasticOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  Widget _buildBestSaleSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Best Sale Product",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.teal.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          // adjust height/width ratio
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            _buildProductCard(
              "Essentials Men's Short-Sleeve Crewneck T-Shirt",
              "\$12.00",
              4.9,
              0, // Use index 0 for first image
              true,
              2356,
            ),
            _buildProductCard(
              "Essentials Men's Short-Sleeve Crewneck T-Shirt",
              "\$18.00",
              4.9,
              1, // Use index 1 for second image
              false,
              2356,
            ),
            _buildProductCard(
              "Summer Cotton Casual T-Shirt",
              "\$15.00",
              4.7,
              2, // Use index 2 for third image
              false,
              1890,
            ),
            _buildProductCard(
              "Premium Quality Polo Shirt",
              "\$22.00",
              4.8,
              3, // Use index 3 for fourth image
              true,
              3420,
            ),
            // _buildProductCard(
            //   "Classic Denim Casual Shirt",
            //   "\$28.00",
            //   4.6,
            //   1567,
            //   false,
            // ),
            // _buildProductCard(
            //   "Vintage Style Cotton Tee",
            //   "\$16.00",
            //   4.9,
            //   2890,
            //   true,
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard(
      String title,
      String price,
      double rating,
      int imageIndex,
      bool isFavorited,
      int reviews,
      ) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.95, end: 1.0),
            duration: Duration(milliseconds: 300 + (imageIndex * 100)),
            curve: Curves.elasticOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: GestureDetector(
                  onTapDown: (_) => _onCardTapDown(),
                  onTapUp: (_) => _onCardTapUp(),
                  onTapCancel: () => _onCardTapUp(),
                  onTap:
                      () => _navigateToProductDetail(
                    title,
                    price,
                    rating,
                    imageIndex,
                    isFavorited,
                    reviews,
                  ),
                  child: AnimatedScale(
                    scale: scale,
                    duration: const Duration(milliseconds: 150),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: _buildProductCardContent(
              title,
              price,
              rating,
              imageIndex,
              isFavorited,
              reviews,
            ),
          ),
        );
      },
    );
  }

  void _onCardTapDown() {
    // Scale animation handled by AnimatedScale widget
  }

  void _onCardTapUp() {
    // Scale animation handled by AnimatedScale widget
  }

  Widget _buildProductCardContent(
      String title,
      String price,
      double rating,
      int imageIndex,
      bool isFavorited,
      int reviews,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Product image with Hero animation
              Hero(
                tag: 'product_$imageIndex',
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      imagesCount[imageIndex % imagesCount.length],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 140,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Text(
                              "Product\nImage",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, opacity, _) {
                              return Opacity(opacity: opacity, child: child);
                            },
                          );
                        }
                        return ShimmerEffect(
                          isLoading: true,
                          child: Container(
                            height: 140,
                            color: Colors.grey.shade200,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Favorite button
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.pink : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shirt",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 2),
                        Text(
                          "$rating | $reviews",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    final navItems = [
      {"icon": "assets/icons/home.svg", "label": "Home"},
      {"icon": "assets/icons/voucher.svg", "label": "Voucer"},
      {"icon": "assets/icons/wallet.svg", "label": "Wallet"},
      {"icon": "assets/icons/setting.svg", "label": "Settings"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
        navItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, String> item = entry.value;
          bool isSelected = _selectedNavIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedNavIndex = index;
              });
            },
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 300 + (index * 100)),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: AnimatedScale(
                    scale: isSelected ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                            isSelected
                                ? Colors.teal.shade400
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(
                              begin: 0.0,
                              end: isSelected ? 1.0 : 0.7,
                            ),
                            duration: const Duration(milliseconds: 200),
                            builder: (context, iconScale, _) {
                              return Transform.scale(
                                scale: iconScale + 0.3,
                                child: SvgPicture.asset(
                                  item["icon"]!,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    isSelected
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 12,
                            color:
                            isSelected
                                ? Colors.teal.shade400
                                : Colors.grey.shade500,
                            fontWeight:
                            isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                          child: Text(item["label"]!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Custom scroll behavior for smooth scrolling
class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

// Shimmer effect for loading images
class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerEffect({Key? key, required this.child, this.isLoading = false})
      : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    if (widget.isLoading) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(ShimmerEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading) {
      _animationController.repeat();
    } else {
      _animationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: [
                math.max(0.0, _animation.value - 0.3),
                _animation.value,
                math.min(1.0, _animation.value + 0.3),
              ],
            ).createShader(rect);
          },
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Product Detail Screen with stunning animations
class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final double rating;
  final String imageUrl;
  final bool isFavorited;
  final int reviews;
  final String heroTag;

  const ProductDetailScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.isFavorited,
    required this.reviews,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _detailAnimationController;
  late AnimationController _buttonAnimationController;
  late AnimationController _floatingController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingAnimation;

  bool _isFavorited = false;
  int _quantity = 1;
  String _selectedSize = 'M';
  String _selectedColor = 'Black';

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _detailAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _detailAnimationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _detailAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _detailAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _floatingAnimation = Tween<double>(begin: -3, end: 3).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _detailAnimationController.forward();
    _floatingController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Custom App Bar
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorited ? Colors.pink : Colors.black87,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorited = !_isFavorited;
                      });
                      _buttonAnimationController.forward().then((_) {
                        _buttonAnimationController.reverse();
                      });
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: AnimatedBuilder(
                  animation: _floatingAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _floatingAnimation.value),
                      child: Hero(
                        tag: widget.heroTag,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                                width: 300,
                                height: 350,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 300,
                                    height: 350,
                                    color: Colors.grey.shade200,
                                    child: const Center(
                                      child: Text("Product Image"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Product Details
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Title and Price
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Premium Collection",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    widget.price,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade400,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "\$${(double.parse(widget.price.substring(1)) * 1.5).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Rating and Reviews
                        _buildRatingSection(),

                        const SizedBox(height: 24),

                        // Size Selection
                        _buildSizeSelection(),

                        const SizedBox(height: 24),

                        // Color Selection
                        _buildColorSelection(),

                        const SizedBox(height: 24),

                        // Quantity Selection
                        _buildQuantitySelection(),

                        const SizedBox(height: 30),

                        // Product Description
                        _buildProductDescription(),

                        const SizedBox(height: 30),

                        // Add to Cart Button
                        _buildAddToCartButton(),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < widget.rating.floor()
                        ? Icons.star
                        : index < widget.rating
                        ? Icons.star_half
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
              const SizedBox(width: 8),
              Text(
                "${widget.rating} (${widget.reviews} reviews)",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSizeSelection() {
    final sizes = ['S', 'M', 'L', 'XL', 'XXL'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Size",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children:
          sizes.map((size) {
            final isSelected = _selectedSize == size;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = size;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.teal.shade400 : Colors.white,
                  border: Border.all(
                    color:
                    isSelected
                        ? Colors.teal.shade400
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorSelection() {
    final colors = [
      {'name': 'Black', 'color': Colors.black},
      {'name': 'Navy', 'color': Colors.blue.shade900},
      {'name': 'Grey', 'color': Colors.grey.shade600},
      {'name': 'White', 'color': Colors.white},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children:
          colors.map((colorData) {
            final isSelected = _selectedColor == colorData['name'];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = colorData['name'] as String;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                    isSelected
                        ? Colors.teal.shade400
                        : Colors.transparent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorData['color'] as Color,
                    borderRadius: BorderRadius.circular(50),
                    border:
                    colorData['name'] == 'White'
                        ? Border.all(color: Colors.grey.shade300)
                        : null,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuantitySelection() {
    return Row(
      children: [
        const Text(
          "Quantity",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (_quantity > 1) {
                  setState(() {
                    _quantity--;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.remove, size: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _quantity.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _quantity++;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Premium quality shirt made from 100% cotton. Comfortable fit with modern styling. Perfect for both casual and semi-formal occasions. Machine washable and easy to care for.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return AnimatedBuilder(
      animation: _buttonAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 - (_buttonAnimationController.value * 0.05),
          child: Container(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                _buttonAnimationController.forward().then((_) {
                  _buttonAnimationController.reverse();
                });
                // Add haptic feedback and show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Added to cart! Quantity: $_quantity"),
                    backgroundColor: Colors.teal.shade400,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade400,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    "Add to Cart • ${widget.price}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _detailAnimationController.dispose();
    _buttonAnimationController.dispose();
    _floatingController.dispose();
    super.dispose();
  }
}
