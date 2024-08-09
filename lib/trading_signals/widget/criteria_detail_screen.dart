import 'package:demo_fitpage/application/widget/dashed_line_painter.dart';
import 'package:flutter/material.dart';

class CriteriaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> criteriaDetail;

  const CriteriaDetailScreen({super.key, required this.criteriaDetail});

  @override
  Widget build(BuildContext context) {
    final type = criteriaDetail['type'];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (type == 'value')
                Expanded(
                  child: ListView.builder(
                      itemCount: (criteriaDetail['${type}s'] as List).length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    (criteriaDetail['${type}s'][index] as num)
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                                CustomPaint(
                                  size: const Size(double.infinity, 1),
                                  painter: DashedLinePainter(),
                                ),
                              ],
                            ),
                          )),
                )
              else if (type == 'indicator')
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Other widgets you want to show
                      Text(
                        (criteriaDetail['study_type'] as String).toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Set Parameters',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Align items to left and right
                          children: [
                            Text(
                              (criteriaDetail['parameter_name'] as String)
                                  .split(' ')
                                  .map((word) =>
                                      word[0].toUpperCase() + word.substring(1))
                                  .join(' '),
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              width: 50,
                            ), // Add spacing between Text and TextField

                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                controller: TextEditingController(
                                  text: (criteriaDetail['default_value'] as int)
                                      .toString(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
