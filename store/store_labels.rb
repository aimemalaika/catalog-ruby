def store_labels
  labels = @labels.each_with_index.map do |label, _index|
    items = []
    @books.each do |book|
      items << book.id if book.label == label
    end
    { class: label.class, title: label.title, color: label.color, items: items, id: label.id }
  end
  json_labels = JSON.generate(labels)
  File.write('labels.json', json_labels)
end
