import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find();

  @override
  void initState() {
    controller.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Faccinate Category"),
      ),
      body: Obx(()=>ListView.builder(
          itemCount: controller.listOfCategory.length,
          itemBuilder: (context, index) => Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [

                SvgPicture.network(
                  controller.listOfCategory[index].icon ?? "-",
                  height: 20,
                  width: 20,
                  placeholderBuilder:(_){
                    return Image.asset("");
                  },
                ),
                Text(
                  controller.listOfCategory[index].name!,
                ),
              ],
            ),
          ))),
    );
  }
}
