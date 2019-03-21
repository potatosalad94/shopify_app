class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @customers = ShopifyAPI::Customer.find(:all)
    @data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
      {
          label: "My First dataset",
          background_color: "rgba(220,220,220,0.2)",
          border_color: "rgba(220,220,220,1)",
          data: [65, 59, 80, 81, 56, 55, 40]
      },
      {
          label: "My Second dataset",
          background_color: "rgba(151,187,205,0.2)",
          border_color: "rgba(151,187,205,1)",
          data: [28, 48, 40, 19, 86, 27, 90]
      }
    ]
    }
  end
end
