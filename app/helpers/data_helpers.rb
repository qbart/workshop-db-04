module DataHelpers

  def self.model_info(model)
    s = "#{model.name} (#{model.table_name})\n"
    s << model.columns.map do |column|
      column.name
    end.join("\n")
    s
  end

  def self.format_number(num)
    sprintf("%0.02f", num)
  end

  def self.ar_table(model_class, caption, data)
    headers = model_class.columns.map(&:name)
    arr = []
    arr << headers
    data.each do |record|
      row = []
      headers.each do |header|
        row << record.public_send(header)
      end
      arr << row
    end
    table(arr, header: true, caption: caption)
  end

  def self.table(data, caption: nil, header: true, labels: {}, selected: [], attach_column: nil, border: [])
    if !attach_column.nil?
      data = data.zip(attach_column).map(&:flatten)
    end
    border_map = border.map { |x| [x, true] }.to_h
    selected_map = selected.map { |x| [x, true] }.to_h
    Haml::Engine.new(File.read('app/views/shared/_data.haml')).render(
      Object.new,
      data: data,
      header: header,
      labels: labels,
      selected: selected_map,
      border: border_map,
      caption: caption
    )
  end
end
