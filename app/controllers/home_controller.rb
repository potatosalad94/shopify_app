class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @customers = ShopifyAPI::Customer.find(:all)
    @data = {
      labels: @orders.group_by_hour_of_day(&:created_at).values.flatten.map(&:created_at).map(&:to_time),
      datasets: [
        {
            label: "My First dataset",
            background_color: "rgba(220,220,220,0.2)",
            border_color: "rgba(220,220,220,1)",
            data: @orders.group_by_hour_of_day(&:created_at).values.flatten.map(&:total_price).map(&:to_f)
        }
      ]
    }
  end
end
