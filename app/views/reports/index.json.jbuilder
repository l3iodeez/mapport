json.array!(@reports) do |report|
  json.extract! report, :id, :reportname, :description, :filename, :customer_id, :report_date
  json.url report_url(report, format: :json)
end
