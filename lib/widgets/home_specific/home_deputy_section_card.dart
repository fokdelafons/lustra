import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../services/app_router.dart'; // Potrzebne do smartNavigate

class HomeDeputySectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final String destinationPath;
  final String buttonText;

  const HomeDeputySectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    required this.destinationPath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final cardColor = Colors.white;
    final shadowColor = Colors.black.withAlpha((0.08 * 255).round());
    final lightPrimaryColor = primaryColor.withAlpha((255 * 0.1).round());
    final lighterPrimaryColor = primaryColor.withAlpha((255 * 0.05).round());

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER ---
          Padding(
            padding: EdgeInsets.all(
              kIsWeb ? 24.0 : MediaQuery.of(context).size.width * 0.04
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(kIsWeb ? 12.0 : MediaQuery.of(context).size.width * 0.025),
                  decoration: BoxDecoration(
                    color: lightPrimaryColor,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.03)
                  ),
                  child: Icon(icon, color: primaryColor, size: 24),
                ),
                SizedBox(width: kIsWeb ? 16.0 : MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          
          // --- CONTENT (Lista posłów) ---
          child,
          
          // --- FOOTER BUTTON ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.smartNavigate(destinationPath);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: lighterPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.04), 
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.04)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            buttonText,
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16, color: primaryColor),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}