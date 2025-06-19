import 'package:applocation/app/di.dart';
import 'package:applocation/domain/state_management/cubit/plan_cubit.dart';
import 'package:applocation/domain/state_management/states/plan_states.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../../app/constants/widgets.dart';
import '../../../domain/model/models.dart';
import '../../resources/routes_manager.dart';

class PaymentScreen extends StatefulWidget {
  final Plan plan;

  const PaymentScreen({super.key, required this.plan});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isYearlySelected = true;

  Stack _credit(Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          clipper: halfCircle(),
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(45, 45, 45, 0.1),
                  Color.fromRGBO(134, 134, 134, 0),
                ],
                radius: size.height * 0.4,
              ),
            ),
          ),
        ),
        CreditCardWidget(
          cardNumber: '4242424242424242', // Use a valid card number
          expiryDate: '02/24',
          cardHolderName: 'Nada Al-Hashimi',
          cvvCode: '',
          showBackView: false,
          isHolderNameVisible: true,
          cardBgColor: Color.fromRGBO(156, 44, 243, 1),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          height: size.height * 0.23,
          width: size.width * 0.85,
          isSwipeGestureEnabled: false,
          onCreditCardWidgetChange: (creditCardBrand) {
            // Handle widget changes (if needed)
            debugPrint('Credit card brand: $creditCardBrand');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return BlocProvider<PlansCubit>(
      create: (context) => instance<PlansCubit>(),
      child: BlocConsumer<PlansCubit, PlanState>(listener: (context, state) {
        if (state is PlanLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return PopScope(
                canPop: false,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                subscriptionTittle('Upgrade', context),
                // Credit Card Display

                _credit(size),

                const SizedBox(
                    height: 24.0), // Add the missing comma above this line

                // Plan Selector
                defaultContainer(
                  height: size.height * 0.27,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildPlanOption(
                        size: size,
                        title: 'Yearly',
                        description: 'Pay for a full year',
                        price: "\$${widget.plan.billingYearly}",
                        isSelected: isYearlySelected,
                        onTap: () {
                          setState(() {
                            isYearlySelected = true;
                          });
                        },
                      ),
                      _buildPlanOption(
                        size: size,
                        title: 'Monthly',
                        description: 'Pay monthly, cancel anytime',
                        price: "\$${widget.plan.billingMonthly}",
                        isSelected: !isYearlySelected,
                        onTap: () {
                          setState(() {
                            isYearlySelected = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32.0),

                // Payment Button
                defaultElevatedButton(
                  onPressed: () async {
                    await context.read<PlansCubit>().pickPlan(widget.plan.id);
                    Navigator.pushReplacementNamed(context, Routes.mainRoute);
                  },
                  width: 0.9,
                  size: size,
                  text: 'Make Payment',
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String price,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
    required Size size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: circularBorderContainer(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m20),
        size: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected
                ? Color.fromRGBO(131, 131, 131, 1)
                : Colors.grey.shade300,
            width: 2,
          ),
          color: isSelected
              ? ColorManager.white
              : Color.fromRGBO(234, 234, 243, 1),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color:
                  isSelected ? Color.fromRGBO(131, 131, 131, 1) : Colors.grey,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void _onMakePayment() {
    // Implement payment logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isYearlySelected
              ? 'Processing Yearly Payment (\$${widget.plan.billingYearly})'
              : 'Processing Monthly Payment (\$${widget.plan.billingMonthly})',
        ),
      ),
    );
  }
}
