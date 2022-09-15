import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkkclient/app/domain/food.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodModel food;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  SharedPreferences? pref;
  bool isFavorite = false;

  @override
  void initState() {
    initPref().whenComplete(
      () => checkIconFavorite(),
    );
    super.initState();
  }

  Future<SharedPreferences> initPref() async {
    pref = await SharedPreferences.getInstance();
    return pref!;
  }

  Future<bool> checkIconFavorite() async {
    final bool? isFavorite = pref!.getBool('isFavorite');
    if (isFavorite == null) {
      return false;
    } else {
      setState(() {
        this.isFavorite = isFavorite;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0B0B),
      appBar: AppBar(
        backgroundColor: const Color(0xff0B0B0B),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffDEB41E),
            size: 18,
          ),
        ),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SvgPicture.asset(
              'assets/images/logo/logo.svg',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Snacken',
              style: GoogleFonts.poppins(
                color: const Color(0xffDEB41E),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Image.asset(
                    widget.food.image,
                    fit: BoxFit.cover,
                    color: Colors.grey.shade300.withOpacity(0.5),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: GoogleFonts.poppins(
                          color: const Color(0xffDEB41E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.food.description,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      gridDesc(),
                      footer(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.5 - 90,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xff262626),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffDEB41E),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                widget.food.image,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cimol Mercon",
                              style: GoogleFonts.poppins(
                                color: const Color(0xffDEB41E),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffDEB41E),
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.food.rating,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xffDEB41E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
  }

  Row gridDesc() {
    return Row(
      children: [
        gridDescItem("Price", widget.food.price),
        const SizedBox(width: 32),
        gridDescItem("Type", widget.food.type),
      ],
    );
  }

  gridDescItem(String title, String food) {
    return SizedBox(
      width: 130,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type',
            style: GoogleFonts.poppins(
              color: const Color(0xffDEB41E),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            food,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Row footer() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {
            pref!.getBool('isFavorite');
            if (pref!.getBool('isFavorite') == true) {
              pref!.setBool('isFavorite', false);
            } else {
              pref!.setBool('isFavorite', true);
            }
            setState(() {
              isFavorite = pref!.getBool('isFavorite')!;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff262626),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: Center(
            child: Icon(
              isFavorite != true
                  ? Icons.favorite_border_rounded
                  : Icons.favorite,
              color: const Color(0xffDEB41E),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDEB41E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: Text(
              'Order Now',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
