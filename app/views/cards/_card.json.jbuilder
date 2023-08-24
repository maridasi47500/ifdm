json.extract! card, :id, :nb, :expire, :cvc, :sum, :payment_id, :created_at, :updated_at
json.url card_url(card, format: :json)
