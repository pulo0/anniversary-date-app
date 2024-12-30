import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';

class StarterDatePanel extends StatelessWidget {
  const StarterDatePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;

    const double boxWidth = 350.0;
    const double boxHeightSpacing = 10.0;

    return SizedBox(
      width: boxWidth,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorScheme.primaryContainer.withOpacity(0.8),
                offset: const Offset(9.5, 12.0),
                blurRadius: 9.0,
                spreadRadius: 4.9,
              )
            ],
          ),
          child: Hero(
            tag: 'date-card',
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Add your significant event',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 20,
                        fontFamily: textTheme.bodyMedium!.fontFamily,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: boxHeightSpacing),
                    Icon(
                      Icons.favorite_border,
                      color: colorScheme.onPrimary,
                      size: 30,
                      semanticLabel: 'Heart',
                    ),
                    Text(
                      'May your important event be actually important',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 20,
                        fontFamily: textTheme.bodyMedium!.fontFamily,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
