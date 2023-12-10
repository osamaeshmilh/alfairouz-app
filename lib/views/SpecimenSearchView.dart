import 'package:alfairouz/controllers/SpecimenSearchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SpecimenSearchView extends GetView<SpecimenSearchController> {
  const SpecimenSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الاستعلام عن عينة"),
        // centerTitle: true,
      ),
      body: GetBuilder<SpecimenSearchController>(
        init: SpecimenSearchController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "رقم العينة"),
                  controller: _.labQr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _.findSpecimenByLabQr();
                  },
                  child: const Text('بحث'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _.loading.value
                  ? const CircularProgressIndicator()
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "النتائج",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
              _.specimen.id != null
                  ? Card(
                      elevation: 0.5,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        trailing: Text('${_.specimen.total} د.ل ', style: const TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                          "${_.specimen.labQr}",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.SPECIMEN_DETAILS, arguments: _.specimen.id);
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
