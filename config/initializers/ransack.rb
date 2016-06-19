Ransack.configure do |config|
  config.add_predicate 'date_gt',
    arel_predicate: 'gt',
    formatter: proc { |v| process_user_date_search_string(v).to_date },
    validator: proc { |v| v.present? },
    type: :string
end
