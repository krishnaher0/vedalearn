import 'package:flutter/material.dart';

class LanguageDropdownWidget extends StatelessWidget {
  final List<String> languages;
  final String? selectedLanguage;
  final Function(String?) onLanguageChanged;
  final bool isLoading;

  const LanguageDropdownWidget({
    super.key,
    required this.languages,
    required this.onLanguageChanged,
    this.selectedLanguage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF64748B),
              ),
            ),
          ),
        ),
      );
    }

    if (languages.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.language,
            color: Color(0xFF94A3B8),
          ),
          onPressed: null,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: selectedLanguage != null 
            ? const Color(0xFF667EEA).withOpacity(0.1)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: selectedLanguage != null 
            ? Border.all(color: const Color(0xFF667EEA).withOpacity(0.3))
            : null,
      ),
      child: PopupMenuButton<String>(
        icon: Icon(
          Icons.language,
          color: selectedLanguage != null 
              ? const Color(0xFF667EEA)
              : const Color(0xFF64748B),
        ),
        tooltip: 'Select Language',
        onSelected: onLanguageChanged,
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<String>(
              value: null,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.public,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'All Languages',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (selectedLanguage == null) ...[
                    const Spacer(),
                    const Icon(
                      Icons.check,
                      color: Color(0xFF10B981),
                      size: 16,
                    ),
                  ],
                ],
              ),
            ),
            const PopupMenuDivider(),
            ...languages.map((language) {
              final isSelected = selectedLanguage == language;
              return PopupMenuItem<String>(
                value: language,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: _getLanguageColor(language),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          language.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        language,
                        style: TextStyle(
                          fontWeight: isSelected 
                              ? FontWeight.w600 
                              : FontWeight.w500,
                          color: isSelected 
                              ? const Color(0xFF667EEA)
                              : const Color(0xFF1E293B),
                        ),
                      ),
                    ),
                    if (isSelected) ...[
                      const Icon(
                        Icons.check,
                        color: Color(0xFF667EEA),
                        size: 16,
                      ),
                    ],
                  ],
                ),
              );
            }).toList(),
          ];
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
        popUpAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  Color _getLanguageColor(String language) {
    final hash = language.hashCode;
    final colors = [
      const Color(0xFF667EEA),
      const Color(0xFF764BA2),
      const Color(0xFF06B6D4),
      const Color(0xFF10B981),
      const Color(0xFFF59E0B),
      const Color(0xFFEF4444),
      const Color(0xFF8B5CF6),
      const Color(0xFFEC4899),
    ];
    return colors[hash.abs() % colors.length];
  }
}
