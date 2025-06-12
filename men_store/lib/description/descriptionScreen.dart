import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:men_store/controller/main_controller.dart';
import 'package:men_store/utils/const/assets.dart';
import 'package:men_store/utils/const/color.dart';
import 'package:men_store/utils/const/dimension.dart';
import 'package:men_store/utils/const/text_style.dart';
import 'package:men_store/widget/enteryListItem.dart';

class Descriptionscreen extends StatefulWidget {
  final String immg;
  const Descriptionscreen({super.key, required this.immg});

  @override
  State<Descriptionscreen> createState() => _DescriptionscreenState();
}

class _DescriptionscreenState extends State<Descriptionscreen> {
  RxDouble imgPos = (-Dimens.horizontalBlockSize * 60).obs;
  Future<void> changePosition() async {
    await Future.delayed(Duration(milliseconds: 200));
    imgPos.value = Dimens.horizontalBlockSize * 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          _imgView(),
          _description(),
        ],
      ),
    );
  }

  SizedBox _imgView() {
    return SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.verticalBlockSize * 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(
                () => AnimatedPositioned(
                  right: imgPos.value,
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    height: Dimens.verticalBlockSize * 38,
                    width: Dimens.verticalBlockSize * 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.immg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Dimens.s_20(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(148),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: MainController.to.sizes.map((size) {
                      int idx = MainController.to.sizes.indexOf(size);
                      return Obx(
                        () => Enterylistitem(
                          index: idx,
                          child: GestureDetector(
                            onTap: () {
                               MainController.to.selSize.value = idx;
                          
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: Dimens.s_55(),
                              width: Dimens.s_55(),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: MainController.to.selSize.value == idx
                                    ? AppColors.linearGradient
                                    : null,
                              ),
                                child: Text(
                                  size,
                                  style: AppTextStyle.bodyRegular[18]?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        MainController.to.selSize.value == idx
                                            ? Colors.white
                                            : AppColors.greyScale[20],
                                  ),
                                ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Enterylistitem(
            index: 0,
            child: Text(
              'Description',
              style: AppTextStyle.bodyRegular[24]?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: Dimens.verticalBlockSize * 1.2),
          Enterylistitem(
            index: 0,
            child: Text(
              'Collar cardigan for summer with Luxurious texture of Milanses.Organization and Emphasize cool feeling with mother of perl button',
              style: AppTextStyle.bodyRegular[18]?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.greyScale[20],
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: Dimens.verticalBlockSize * 8),
          Enterylistitem(
            index: 0,
            child: Text(
              'Price: \$ 88.66',
              style: AppTextStyle.bodyRegular[24]?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Enterylistitem(
            index: 0,
            child: Padding(
              padding: EdgeInsets.only(top: Dimens.verticalBlockSize * 2),
              child: Bounceable(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimens.verticalBlockSize * 2.5,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orange.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    gradient: AppColors.linearGradient,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagesAsset.shop, scale: 4),
                      SizedBox(width: Dimens.s_6()),
                      Text(
                        'Add to Cart',
                        style: AppTextStyle.bodyRegular[15]?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),

        child: Enterylistitem(
          index: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.white,
                  child: Image.asset(ImagesAsset.back, scale: 3),
                ),
              ),
              Text(
                'Short Cardigan',
                style: AppTextStyle.bodyRegular[24]?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
                child: Image.asset(ImagesAsset.heart, scale: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
