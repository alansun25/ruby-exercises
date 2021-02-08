require 'pry'

def caesar_cipher(str, shift)
    shifted = str.bytes.map do |code|
        if code.between?(65, 90) || code.between?(97, 122)
            upperOrLower = code < 97 ? 65 : 97
            code = ((code + shift - upperOrLower) % 26 + 26) % 26 + upperOrLower
        end
        code = code.chr
    end

    shifted.join
end

# Tests
p caesar_cipher("Z", 1) # "A"
p caesar_cipher("A", -1) # "Z"
p caesar_cipher("What a string!", 5) # "Bmfy f xywnsl!"
p caesar_cipher("Hello, World!", 5) # "Mjqqt, Btwqi!"
p caesar_cipher("Mjqqt, Btwqi!", -5) # "Hello, World!"
p caesar_cipher("Hello, World!", 75) # "Ebiil, Tloia!"
p caesar_cipher("Ebiil, Tloia!", -75) # "Hello, World!"
p caesar_cipher("My name is Alan.", 145) # "Bn cpbt xh Papc."
p caesar_cipher("Bn cpbt xh Papc.", -145) # "My name is Alan."