String parseLocation(String location, int maxLength) {
  final locationInfo = location.split(",");
  if (locationInfo[0].length > 8) {
    return locationInfo.last;
  }

  return location;
}
