/// Validates that the given color index is within the valid range.
///
/// Throws an assertion error if the index is out of bounds.
///
/// - Parameters:
///   - indexColor: The index of the color to validate.
///   - lengthColors: The total number of available colors.
void validateIndexColor(int indexColor, int lengthColors) {
  assert(
    indexColor >= 0,
    'Selected color index must be greater than or equal to 0',
  );
  assert(
    indexColor < lengthColors,
    'Selected color index must be less than $lengthColors',
  );
}