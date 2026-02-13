select distinct

    product_id,
    product_name,
    category_name,
    brand_name,
    round(list_price, 2) as list_price,

case
    when list_price is null then 'Unknown'
    when list_price < 0 then 'Invalid'
    when list_price < 500 then 'Low'
    when list_price between 500 and 1500 then 'Medium'
    else 'High'
end as price_category


from {{ ref('int_sales_enriched') }}
