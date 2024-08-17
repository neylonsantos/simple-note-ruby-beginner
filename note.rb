class Note
  def initialize(title, description, date)
    @title = title
    @description = description
    @date = date
  end

  def to_s
    "Titulo: #{@title}, Descrição: #{@description}, Data: #{@date}"
  end
end