if @review.persisted?
    json.form json.partial!("reviews/form.html.erb", item: @item, review: Review.new)
    json.inserted_item json.partial!("items/review.html.erb", review: @review)
  else
    json.form json.partial!("reviews/form.html.erb", item: @item, review: @review)
  end
