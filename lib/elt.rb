module Elt

class Elt
  def initialize
    gemdir = File.dirname File.dirname __FILE__
    @dictionary_path = gemdir + '/' + 'elements.txt'
  end

  def lookup(term)
    File.open(@dictionary_path, 'r') do |dict|
      dict.each_line do |line_nl|
        row = line_nl.chomp.split
        if row.include?(term)
          return row
        end
      end
    end
    return nil
  end

  def show((atomic_number, name, symbol))
    puts "#{atomic_number} #{name} #{symbol}"
  end

  def usage
    puts "Usage: elt NAME_NUMBER_OR_SYMBOL"
  end
  
  def run
    case ARGV.size
    when 1
      row = lookup(ARGV[0])
      if row
        show(row)
      else
        puts 'Not found'
      end
    else
      usage
    end
  end
end

end
