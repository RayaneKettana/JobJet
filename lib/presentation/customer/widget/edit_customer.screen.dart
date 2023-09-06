import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobjet/presentation/customer/controllers/customer.controller.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entity/customer.dart';

class EditCustomerScreen extends GetView<CustomerController> {
  Customer customer;

  EditCustomerScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text('Modifier', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(width: 2.w),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 50,
                    child: Text(
                      customer.firstName[0].toUpperCase() +
                          customer.lastName[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              '${customer.firstName} ${customer.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              customer.phoneNumber,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 20.w,
                      height: 5.h,
                      child: const Icon(Icons.calendar_month_outlined),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.sendMessage(customer.phoneNumber);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 20.w,
                        height: 5.h,
                        child: const Icon(Icons.message_outlined),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.callCustomer(customer.phoneNumber);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 20.w,
                        height: 5.h,
                        child: const HeroIcon(HeroIcons.phone,
                            style: HeroIconStyle.outline),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.launchWaze(customer.address);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 20.w,
                        height: 5.h,
                        child: const HeroIcon(HeroIcons.mapPin,
                            style: HeroIconStyle.outline),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
