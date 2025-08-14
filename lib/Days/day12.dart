import 'package:flutter/material.dart';
import 'dart:math' as math;

class Day12CarSelling extends StatefulWidget {
  const Day12CarSelling({super.key});

  @override
  State<Day12CarSelling> createState() => _Day12CarSellingState();
}

class _Day12CarSellingState extends State<Day12CarSelling>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _backgroundController;
  late AnimationController _carAnimationController;
  late AnimationController _floatingController;
  late AnimationController _pulseController;
  late Animation<double> _backgroundAnimation;
  late Animation<Offset> _carSlideAnimation;
  late Animation<double> _carFadeAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _carScaleAnimation;
  late Animation<double> _carRotationAnimation;
  late Animation<double> _pulseAnimation;

  int currentPage = 0;
  bool isMovingRight = true;

  List<String> carImages = [
    "assets/images/red.png",
    "assets/images/blue.png",
    "assets/images/green.png",
  ];

  final List<CarModel> cars = [
    CarModel(
      name: "Tesla Model S",
      price: "\$89,999",
      year: "2024",
      color: const Color(0xFFE53E3E),
      features: ["Autopilot", "0-60 in 2.1s", "405 mi range"],
      gradient: const LinearGradient(
        colors: [Color(0xFFFF6B6B), Color(0xFFE53E3E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    CarModel(
      name: "Porsche 911",
      price: "\$112,999",
      year: "2024",
      color: const Color(0xFF3182CE),
      features: ["Turbo S", "0-60 in 2.6s", "315 HP"],
      gradient: const LinearGradient(
        colors: [Color(0xFF4299E1), Color(0xFF3182CE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    CarModel(
      name: "BMW M8",
      price: "\$134,999",
      year: "2024",
      color: const Color(0xFF38A169),
      features: ["Twin Turbo V8", "617 HP", "Sport Mode"],
      gradient: const LinearGradient(
        colors: [Color(0xFF68D391), Color(0xFF38A169)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _carAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _backgroundAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_backgroundController);

    _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _setupCarAnimation();
  }

  void _setupCarAnimation() {
    _carSlideAnimation = Tween<Offset>(
      begin: isMovingRight ? const Offset(2.0, 0) : const Offset(-2.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _carAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _carFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _carAnimationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _carScaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _carAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _carRotationAnimation = Tween<double>(
      begin: isMovingRight ? -0.3 : 0.3,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _carAnimationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      isMovingRight = page > currentPage;
      currentPage = page;
    });

    _carAnimationController.reset();
    _setupCarAnimation();

    Future.delayed(const Duration(milliseconds: 400), () {
      _carAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _backgroundController.dispose();
    _carAnimationController.dispose();
    _floatingController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return _buildCarShowcase(cars[index], index == currentPage);
                },
              ),
            ),
            _buildPageIndicator(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Text(
            "Car Classy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarShowcase(CarModel car, bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Main car display card
          Expanded(
            flex: 3,
            child: SlideTransition(
              position: _carSlideAnimation,
              child: FadeTransition(
                opacity: _carFadeAnimation,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF2A2A2A),
                        const Color(0xFF1E1E1E),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        // Car image
                        Center(
                          child: ScaleTransition(
                            scale: _carScaleAnimation,
                            child: RotationTransition(
                              turns: _carRotationAnimation,
                              child: Image.asset(
                                carImages[cars.indexOf(car)],
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 200,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.directions_car,
                                    size: 120,
                                    color: Colors.white.withOpacity(0.3),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // Subtle pattern overlay
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: _backgroundAnimation,
                            builder: (context, child) {
                              return CustomPaint(
                                painter: PatternPainter(
                                  _backgroundAnimation.value,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Car details section
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Year and model info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Artwork & coded by",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          "Ahmed Khan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          car.year,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          car.name.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Model code and features
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Model code / number",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _getModelCode(car.name),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: car.color.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: car.color.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "More info",
                            style: TextStyle(
                              color: car.color,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const Spacer(),

                // Features as tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                  car.features.map((feature) {
                    return TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 600),
                      tween: Tween(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              feature,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getModelCode(String carName) {
    switch (carName) {
      case "Tesla Model S":
        return "TS461";
      case "Porsche 911":
        return "P911X";
      case "BMW M8":
        return "BM8GT";
      default:
        return "RT461";
    }
  }

  Widget _buildCarCard(CarModel car, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: car.gradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: car.color.withOpacity(0.4),
            blurRadius: isActive ? 30 : 15,
            spreadRadius: isActive ? 5 : 0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Animated background pattern
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _backgroundAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: PatternPainter(_backgroundAnimation.value),
                );
              },
            ),
          ),
          // Car image with enhanced animations
          Center(
            child: SlideTransition(
              position: _carSlideAnimation,
              child: FadeTransition(
                opacity: _carFadeAnimation,
                child: ScaleTransition(
                  scale: _carScaleAnimation,
                  child: RotationTransition(
                    turns: _carRotationAnimation,
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: isActive ? _pulseAnimation.value : 1.0,
                          child: Container(
                            width: 240,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: car.color.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Image.asset(
                                  carImages[currentPage],
                                  width: 240,
                                  height: 140,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.directions_car,
                                      size: 100,
                                      color: Colors.white70,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Shine effect
          if (isActive)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _backgroundController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment(
                          -1 + (_backgroundAnimation.value / math.pi),
                          -1,
                        ),
                        end: Alignment(
                          1 + (_backgroundAnimation.value / math.pi),
                          1,
                        ),
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.1),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCarDetails() {
    final car = cars[currentPage];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Car name with spectacular background
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: Container(
                  key: ValueKey(car.name),
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        car.color.withOpacity(0.3),
                        car.color.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: car.color.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: car.color.withOpacity(
                                0.2 * _pulseAnimation.value,
                              ),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: car.color.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                AnimatedBuilder(
                                  animation: _floatingAnimation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(
                                        _floatingAnimation.value * 0.2,
                                        0,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              car.color,
                                              car.color.withOpacity(0.7),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: car.color.withOpacity(0.4),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          car.year,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    key: ValueKey(car.price),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.2),
                                          Colors.white.withOpacity(0.1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    child: Text(
                                      car.price,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Features grid with cards
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with icon
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: _backgroundAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _backgroundAnimation.value * 0.1,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      car.color.withOpacity(0.3),
                                      car.color.withOpacity(0.1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.star,
                                  color: car.color,
                                  size: 20,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Key Features",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Features as animated cards
                    ...car.features.asMap().entries.map((entry) {
                      return TweenAnimationBuilder<double>(
                        duration: Duration(
                          milliseconds: 400 + (entry.key * 150),
                        ),
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset((1 - value) * 80, 0),
                            child: Opacity(
                              opacity: value,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      car.color.withOpacity(0.15),
                                      car.color.withOpacity(0.05),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: car.color.withOpacity(0.3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: car.color.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Feature icon
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: car.color.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        _getFeatureIcon(entry.value),
                                        color: car.color,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    // Feature text
                                    Expanded(
                                      child: Text(
                                        entry.value,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    // Animated indicator
                                    AnimatedBuilder(
                                      animation: _pulseAnimation,
                                      builder: (context, child) {
                                        return Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: car.color.withOpacity(
                                              _pulseAnimation.value,
                                            ),
                                            shape: BoxShape.circle,
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
                    }).toList(),

                    // Performance badge
                    const SizedBox(height: 12),
                    AnimatedBuilder(
                      animation: _floatingAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _floatingAnimation.value * 0.3),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  car.color.withOpacity(0.3),
                                  car.color.withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: car.color.withOpacity(0.4),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bolt, color: car.color, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  "Premium Performance Vehicle",
                                  style: TextStyle(
                                    color: car.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getFeatureIcon(String feature) {
    if (feature.toLowerCase().contains('autopilot') ||
        feature.toLowerCase().contains('turbo')) {
      return Icons.auto_awesome;
    } else if (feature.toLowerCase().contains('0-60') ||
        feature.toLowerCase().contains('hp')) {
      return Icons.speed;
    } else if (feature.toLowerCase().contains('range') ||
        feature.toLowerCase().contains('mi')) {
      return Icons.battery_charging_full;
    } else if (feature.toLowerCase().contains('mode')) {
      return Icons.settings;
    }
    return Icons.star;
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(cars.length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == currentPage ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color:
              index == currentPage
                  ? cars[currentPage].color
                  : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cars[currentPage].color,
              cars[currentPage].color.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: cars[currentPage].color.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0.2), Colors.transparent],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.play_arrow, color: Colors.white, size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    "VIEW DETAILS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CarModel {
  final String name;
  final String price;
  final String year;
  final Color color;
  final List<String> features;
  final LinearGradient gradient;

  CarModel({
    required this.name,
    required this.price,
    required this.year,
    required this.color,
    required this.features,
    required this.gradient,
  });
}

class PatternPainter extends CustomPainter {
  final double animationValue;

  PatternPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
    Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..strokeWidth = 1;

    final sparkPaint =
    Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 2;

    // Animated dots pattern
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 8; j++) {
        final x =
            (size.width / 12) * i + math.sin(animationValue + i * 0.5) * 8;
        final y =
            (size.height / 8) * j + math.cos(animationValue + j * 0.5) * 8;
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }

    // Sparkling particles
    for (int i = 0; i < 15; i++) {
      final sparkX =
          size.width * math.sin(animationValue * 0.5 + i) * 0.5 +
              size.width * 0.5;
      final sparkY =
          size.height * math.cos(animationValue * 0.3 + i) * 0.5 +
              size.height * 0.5;
      final sparkSize = (math.sin(animationValue * 2 + i) * 0.5 + 0.5) * 3;

      canvas.drawCircle(
        Offset(sparkX, sparkY),
        sparkSize,
        sparkPaint
          ..color = Colors.white.withOpacity(
            0.3 + math.sin(animationValue + i) * 0.3,
          ),
      );
    }

    // Dynamic lines
    final linePaint =
    Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    for (int i = 0; i < 5; i++) {
      final startX =
          math.sin(animationValue + i) * size.width * 0.3 + size.width * 0.5;
      final startY =
          math.cos(animationValue * 0.7 + i) * size.height * 0.3 +
              size.height * 0.5;
      final endX = startX + math.cos(animationValue + i) * 50;
      final endY = startY + math.sin(animationValue + i) * 50;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
