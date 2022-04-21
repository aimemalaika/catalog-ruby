def load_labels
  return [] unless File.exist?('labels.json')

  file = File.open('labels.json')
  labels_read = File.read(file)
  labels_json = JSON.parse(labels_read)

  loaded_labels = []
  labels_json.each do |label|
    loaded_labels << Label.new(label['title'], label['color'], label['items'], id: label['id'])
  end
  file.close
  loaded_labels
end
