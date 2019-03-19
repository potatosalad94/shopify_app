ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "db132a0bee18bc1e49f07ddbbcc05e55"
  config.secret = "c929af1c881e2b92847bfe6092ef8d78"
  config.old_secret = "<old_secret>"
  config.scope = "read_products, read_orders" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
