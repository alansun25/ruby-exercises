require 'pry'

def caesar_cipher(str, shift)
    # map each character's unicode value to the shifted value, then convert them back to characters.
    shifted = str.bytes.map do |code|
        uppercase = code.between?(65, 90)
        lowercase = code.between?(97, 122)
        upperOrLower = code < 97 ? 65 : 97

        if uppercase || lowercase
            if (uppercase && code + shift > 90) || (lowercase && code + shift > 122)
                code = code - wrap(shift) # wrap backward
            elsif (uppercase && code + shift < 65) || (lowercase && code + shift < 97)
                code = code + wrap(shift) # wrap forward
            else 
                code = code + shift # when no wrap back is needed
            end
        end

        code = code.chr
    end

    puts shifted.join
end

def wrap(shift)
    shift = shift.abs
    n = 26
    while n < shift
        n += 26
    end
    shift = n - shift
end

### Tests ###
caesar_cipher("What a string!", 5) # "Bmfy f xywnsl!"
caesar_cipher("Hello, World!", 5) # "Mjqqt, Btwqi!"
caesar_cipher("Mjqqt, Btwqi!", -5) # "Hello, World!"
caesar_cipher("Z", 1) # "A"
caesar_cipher("A", -1) # "Z"
caesar_cipher("Hello, World!", 75) # "Ebiil, Tloia!"
caesar_cipher("Ebiil, Tloia!", -75) # "Hello, World!"
caesar_cipher("My name is Alan.", 145) # "Xj ylxp td Lwly."