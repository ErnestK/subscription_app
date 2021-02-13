usd = Currency.create!(name: "USD")
btc = Currency.create!(name: "BTC")

Subscription.create!(name: "Base", price_usd_cents: 9900)

Rate.create!(base_currency_id: usd.id, quote_currency_id: btc.id, price: 4746910)
