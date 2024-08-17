require_relative 'note_manager'

class CLI
  def initialize
    @manager = NoteManager.new
  end

  def start
    loop do
      puts "Simple Note"
      puts "1. Adicionar nota"
      puts "2. Listar notas"
      puts "3. Remover notas"
      puts "4. Sair"
      print "Escolha uma opção: "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_note
      when 2
        list_notes
      when 3
        remove_notes
      when 4
        break
      else
        puts "Opção inválida, tente novamente."
      end
    end
  end

  def add_note
    print "Digite o título da nota: "
    title = gets.chomp
    print "Digite a descrição da nota: "
    description = gets.chomp
    print "Digite a data da nota: "
    date = gets.chomp

    @manager.add_note(title, description, date)
    puts "Nota criada com sucesso."
  end

  def list_notes
    @manager.list_notes
  end

  def remove_notes
    print "Insira o número da nota que deseja remover: "
    index = gets.chomp.to_i
    @manager.remove_notes(index)
  end
end