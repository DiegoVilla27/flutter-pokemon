/// Capitalizes the first letter of each word in the given string.
///
/// Splits the input text by spaces, capitalizes the first letter of each
/// word, converts the rest of the word to lowercase, and then joins the
/// words back together with spaces.
///
/// Returns the modified string with each word capitalized.
String capitalizeWords(String text) {
  return text
      .split(' ')
      .map((word) {
        return word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '';
      })
      .join(' ');
}