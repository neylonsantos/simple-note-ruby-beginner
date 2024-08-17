require 'yaml'
require_relative 'note'

class NoteManager
  def initialize(file_path = 'notes.yml')
    @file_path = file_path
    @notes = load_notes
  end

  def add_note(title, description, date)
    note = Note.new(title, description, date)
    @notes << note
    save_notes
  end

  def list_notes
    if @notes.empty?
      puts "Não há notas a serem exibidas."
    else
      @notes.each_with_index do |note, index|
        puts "#{index + 1}. #{note}"
      end
    end
  end

  def remove_notes(index)
    if index.between?(1, @notes.size)
      @notes.delete_at(index - 1)
      save_notes
      puts "Nota removida com sucesso."
    else
      puts "Número inválido."
    end
  end

  def save_notes
    File.open(@file_path, 'w') { |file| file.write(@notes.to_yaml) }
  end

  def load_notes
    return [] unless File.exist?(@file_path)

    YAML.load_file(@file_path, permitted_classes: [Note])
  end
end
