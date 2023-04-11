class Urls {
  static  loginUrl(username,password) => "https://secure-falls-43052.herokuapp.com/api/authenticate?username=$username&password=$password&rememberMe=true";
  static const addProductsUrl = "https://secure-falls-43052.herokuapp.com/api/create-products";
  static deleteProductsUrl(id) => 'https://secure-falls-43052.herokuapp.com/api/products/$id';
  static const getProductsUrl = "https://secure-falls-43052.herokuapp.com/api/products?page=0&size=20";
  static const getProfileUrl = "https://secure-falls-43052.herokuapp.com/api/account";
}
