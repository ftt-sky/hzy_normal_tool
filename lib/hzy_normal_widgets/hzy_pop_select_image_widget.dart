/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 17:15:23
 * @LastEditors: TT
 * @LastEditTime: 2023-03-26 16:37:33
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class HzyPopSelectImageWidget extends StatelessWidget {
  HzyPopSelectImageWidget({super.key, required this.tapCall});

  final Function(int index) tapCall;

  final List<HzyNormalItemModel> list = [
    HzyNormalItemModel(
      leftMsg: "相册",
      mainAxisAlignment: MainAxisAlignment.center,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 30,
        bottom: 15,
      ),
      isShowLine: true,
    ),
    HzyNormalItemModel(
      leftMsg: "相机",
      mainAxisAlignment: MainAxisAlignment.center,
      borderRadius: BorderRadius.zero,
      isShowLine: true,
      linePadding: EdgeInsets.zero,
      lineMargin: EdgeInsets.zero,
    ),
    HzyNormalItemModel(
      isHintWidget: true,
      backGroudColor: HzyNormalColorS.chipBackground,
    ),
    HzyNormalItemModel(
      leftMsg: "取消",
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          list.length,
          (index) => HzyNormalItemWidget(
            itemModel: list[index],
            tapItem: ({currentIndex}) {
              tapCall(index);
            },
          ),
        )
      ],
    );

    body = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: body,
    );
    return body;
  }
}
