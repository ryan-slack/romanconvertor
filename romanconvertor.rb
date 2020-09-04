def fromRoman(romanNumber)
    romans = {
        "M" => 1000,
        "CM" => 900, "D" => 500, "CD" => 400, "C" => 100,
        "XC" => 90, "L" => 50, "XL" => 40, "X" => 10,
        "IX" => 9, "V" => 5, "IV" => 4, "I" => 1
    }
    reply = 0
    for key, value in romans
        while romanNumber.index(key) == 0
            reply += value
            romanNumber.slice!(key)
        end
    end
    if (romanNumber[0])
        reply = 0
    end
    begin
        raise TypeError if reply == 0
        raise RangeError if reply < 1 || reply > 3999
        reply
    rescue RangeError
        puts "Number out of range."
    rescue TypeError
        puts "Type error."
    end
end

def toRoman(arabicNumber)
    begin
        raise RangeError if arabicNumber < 1 || arabicNumber > 3999

        digits = {
            1000 => "M",
            900  => "CM", 500 => "D", 400 => "CD", 100 => "C",
            90   => "XC", 50  => "L", 40  => "XL", 10  => "X",
            9    => "IX", 5   => "V", 4   => "IV", 1   => "I"
        }
        digits.reduce("") do |acc, digit|
            key, numeral = digit
            occurances, arabicNumber = arabicNumber.divmod(key)
            acc + (numeral * occurances)
        end
    rescue RangeError
        puts "Number out of range."
    end
end
