class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @orders = ShopifyAPI::Order.find(:all)
    @customers = ShopifyAPI::Customer.find(:all)
    # @data = {
    #   labels: @orders.group_by_hour_of_day(&:created_at).values.flatten.map(&:created_at).map(&:to_time),
    #   datasets: [
    #     {
    #         label: "My First dataset",
    #         background_color: "rgba(220,220,220,0.2)",
    #         border_color: "rgba(220,220,220,1)",
    #         data: @orders.group_by_hour_of_day(&:created_at).values.flatten.map(&:total_price).map(&:to_f)
    #     }
    #   ]
    # }

    grouped_orders = @orders.group_by_hour_of_day(format: "%b %d %Y, %-l %P") { |order| order.created_at }
    datasets = [
      {
        label: "Profit in AED",
        background_color: "rgba(220,220,220,0.2)",
        border_color: "rgba(220,220,220,1)",
        data: grouped_orders.values.map { |orders| orders.map(&:total_price).map(&:to_f).sum * 0.4 }
      }
    ]
    @data = { labels: grouped_orders.keys, datasets: datasets }
  end
end
