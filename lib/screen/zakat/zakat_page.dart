import 'package:flutter/material.dart';
import 'package:sakib/screen/zakat/zakat_calculator.dart';
import 'package:sakib/utility/app_colors.dart';

class Zakat extends StatefulWidget {
  const Zakat({super.key});

  @override
  State<Zakat> createState() => _ZakatState();
}

class _ZakatState extends State<Zakat> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: const Text("Nisab"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              children: [
                const Text(
                  "Nisab is a threshold, referring to the minimum amount of wealth and possessions that a Muslim must own before being obligated to pay zakat.",
                  style: TextStyle(color: AppColors.textDefaultColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "The nisab threshold for gold is 87.48g (7.5 Tola/Vori), The nisab threshold for silver is 612.36g (52.52 Tola/Vori) or their cash equivalent",
                  style: TextStyle(color: AppColors.textDefaultColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "To calculate nisab, Enter the current price of gold in vori : ",
                  style: TextStyle(
                      color: AppColors.textDefaultColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 5, right: 5),
                        child: TextField(
                          controller: textEditingController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: AppColors.textDefaultColor,),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            hintText: 'Write the price of 1 vori gold.',
                            labelText: 'Write the price of 1 vori gold.',
                            hintStyle: TextStyle(color: AppColors.textDefaultColor,),
                            labelStyle: TextStyle(color: AppColors.textDefaultColor,),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        double number =
                            double.tryParse(textEditingController.text) ?? 0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ZakatCalculator(number: number)));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.functionalButtonColor),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: AppColors.textDefaultColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
