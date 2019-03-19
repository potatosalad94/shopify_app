class HomeController < ShopifyApp::AuthenticatedController
  def index
    # shop_url = "https://db132a0bee18bc1e49f07ddbbcc05e55:c929af1c881e2b92847bfe6092ef8d78@labouboutique.myshopify.com/admin"
    # ShopifyAPI::Base.site = shop_url
    # ShopifyAPI::Session.setup(api_key: "db132a0bee18bc1e49f07ddbbcc05e55", secret: "c929af1c881e2b92847bfe6092ef8d78")
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @customers = ShopifyAPI::Customer.find(:all)
  end
end
