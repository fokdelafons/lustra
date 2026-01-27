import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});


  TextStyle _headerStyle(BuildContext context) => Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: Colors.black87,
      );

  TextStyle _subHeaderStyle(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
        height: 1.3,
      );

  TextStyle _bodyStyle(BuildContext context) => Theme.of(context).textTheme.bodyLarge!.copyWith(
        height: 1.6,
        fontSize: 16,
        color: Colors.grey[900],
      );


  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
      child: SelectableText(title, style: _headerStyle(context)),
    );
  }

  Widget _buildSubsectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: SelectableText(title, style: _subHeaderStyle(context)),
    );
  }

  Widget _buildBodyText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SelectableText(text, style: _bodyStyle(context)),
    );
  }

  Widget _buildCodeBlock(BuildContext context, String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), 
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: SelectableText.rich(
        TextSpan(children: _parseCode(code)),
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          height: 1.5,
          color: Color(0xFFD4D4D4),
        ),
      ),
    );
  }

  List<TextSpan> _parseCode(String code) {
      final List<TextSpan> spans = [];
      final rawLines = code.replaceAll('\\n', '\n').split('\n');

      for (var line in rawLines) {
        if (line.trim().startsWith('//')) {
          spans.add(TextSpan(
            text: '$line\n',
            style: const TextStyle(color: Color(0xFF6A9955)),
          ));
          continue;
        }

        spans.add(TextSpan(text: '$line\n'));
      }
      return spans;
    }

  Widget _buildPipelineDiagram(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; 

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            _buildNode(l10n.techGraphSource, Colors.blueGrey),
            _buildArrow(),
            _buildDecisionNode(l10n.techGraphDecisionLength),
            _buildArrow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildLabel(l10n.techGraphNo),
                      _buildNode(l10n.techGraphFlash, Colors.blue),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildLabel(l10n.techGraphYes),
                      _buildNode(l10n.techGraphPro, Colors.indigo),
                    ],
                  ),
                ),
              ],
            ),
            _buildArrow(),
            _buildNode(l10n.techGraphJudge, Colors.orange.shade800),
            _buildArrow(),
            _buildDecisionNode(l10n.techGraphDecisionPass),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                  child: Column(
                    children: [
                      _buildLabel(l10n.techGraphYes),
                      _buildNode(l10n.techGraphPublishFirestore, Colors.green),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildLabel(l10n.techGraphNoRetry),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(l10n.techGraphRepairLoop, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(l10n.techGraphRetryFlash, style: const TextStyle(fontSize: 10)),
                            Text(l10n.techGraphRetrySurgeon, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_downward, color: Colors.red),
                      _buildNode(l10n.techGraphSurgeon, Colors.red.shade700),
                      const Icon(Icons.arrow_downward, color: Colors.grey),
                      _buildNode(l10n.techGraphHtmlReady, Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyTextWithLink(BuildContext context, String fullText, String linkText, String url) {
    final style = _bodyStyle(context);
    final linkStyle = style.copyWith(
      color: Colors.blue.shade700, 
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );

    if (!fullText.contains(linkText)) {
      return _buildBodyText(context, fullText);
    }

    final startIndex = fullText.indexOf(linkText);
    final prefix = fullText.substring(0, startIndex);
    final suffix = fullText.substring(startIndex + linkText.length);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SelectableText.rich(
        TextSpan(
          style: style,
          children: [
            TextSpan(text: prefix),
            TextSpan(
              text: linkText,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final uri = Uri.parse(url);
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    debugPrint('Could not launch $url');
                  }
                },
            ),
            TextSpan(text: suffix),
          ],
        ),
      ),
    );
  }

  Widget _buildNode(String text, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildDecisionNode(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Icon(Icons.arrow_downward, size: 20, color: Colors.grey),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
    );
  }

  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/fokdelafons/lustra');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch GitHub');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.techTitle),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView( 
        physics: const AlwaysScrollableScrollPhysics(),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // 1. METODOLOGIA
                _buildSectionTitle(context, l10n.techIntroTitle),
                _buildBodyText(context, l10n.techIntroBody),

                // 2. SCHEMAT
                _buildSectionTitle(context, l10n.techDiagramTitle),
                _buildBodyText(context, l10n.techDiagramIntro),
                
                // DIAGRAM
                _buildPipelineDiagram(context),
                
                _buildBodyText(context, l10n.techDiagramOutro),

                // 3. INSTRUKCJE
                _buildSectionTitle(context, l10n.techPromptsTitle),
                _buildBodyText(context, l10n.techPromptsIntro),

                // A) Generalizer
                _buildSubsectionTitle(context, l10n.techGeneralizerTitle),
                _buildBodyText(context, l10n.techGeneralizerBody),
                _buildCodeBlock(context, l10n.techGeneralizerCode),

                // B) Judge
                _buildSubsectionTitle(context, l10n.techJudgeTitle),
                _buildBodyText(context, l10n.techJudgeBody),
                _buildCodeBlock(context, l10n.techJudgeCode),

                // C) Surgeon
                _buildSubsectionTitle(context, l10n.techSurgeonTitle),
                _buildBodyText(context, l10n.techSurgeonBody),
                _buildCodeBlock(context, l10n.techSurgeonCode),

                // 4. WNIOSKI
                _buildSectionTitle(context, l10n.techConclusionsTitle),
                _buildBodyText(context, l10n.techConclusionsIntro),

                _buildSubsectionTitle(context, l10n.techConclusionATitle),
                _buildBodyText(context, l10n.techConclusionABody),

                _buildSubsectionTitle(context, l10n.techConclusionBTitle),
                  _buildBodyTextWithLink(
                  context, 
                  l10n.techConclusionBBody, 
                  "Lost in the Middle",
                  "https://arxiv.org/pdf/2307.03172"
                ),

                _buildSubsectionTitle(context, l10n.techConclusionCTitle),
                _buildBodyText(context, l10n.techConclusionCBody),

                const SizedBox(height: 32),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(l10n.techFooterDate,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic)),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: _launchGitHub,
                          icon: const Icon(Icons.code),
                          label: const Text("Source Code (GitHub)"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            side: BorderSide(color: Colors.grey[400]!),
                            foregroundColor: Colors.grey[800],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            l10n.techFooterLicense,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}