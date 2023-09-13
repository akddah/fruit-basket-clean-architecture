class AppConstances {
  static const baseUrl = "https://thimar.amr.aait-d.com/public/api";
  static const login = "$baseUrl/login";
  static const homeProducts = "$baseUrl/products";
  static const homeSlider = "$baseUrl/sliders";
  static const homeCategories = "$baseUrl/categories";
  static const addressessGet = "$baseUrl/client/addresses";
  static const addressInsert = "$baseUrl/client/addresses";
  static const getFavorite = "$baseUrl/client/products/favorites";
  static String addressDelete(int id) => "$baseUrl/client/addresses/$id";
  static String addressUpdate(int id) => "$baseUrl/client/addresses/$id";
  static String getProduct(int id) => "$baseUrl/products/$id";
  static String getProductRate(int id) => "$baseUrl/products/$id/rates";
  static String addToFavorite(int id) => "$baseUrl/client/products/$id/add_to_favorite";

  static String removeFromFavorite(int id) => "$baseUrl/client/products/$id/remove_from_favorite";
}
