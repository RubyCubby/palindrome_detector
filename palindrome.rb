require 'json'
require 'i18n'

class Palindrome
  def is_palindrome(str)
    if str.nil?
      puts "Error: Received #{str} as argument"
    elsif str.empty?
      puts "Error: Received empty string"
    else
      for i in 0..((str.length / 2) - 1) do
        if str[i] != str[str.length - i - 1]
          puts "#{str} is not a palindrome"
          return false
        end
      end

      puts "#{str} is a palindrome"
    end
  end
end

file = File.read('words.json')
data_hash = JSON.parse(file)

palindrome = Palindrome.new
I18n.config.available_locales = :en

data_hash.each do |element|
  element.each_value do |value|
    value = I18n.transliterate(value)
    value.tr!('-\'', '')
    palindrome.is_palindrome(value.downcase)
  end
end

