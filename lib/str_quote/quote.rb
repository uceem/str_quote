module StrQuote
 module Quote
   def quote(quote_char = '"', escape_char = '\\')
     unless escape_char.nil?
       e = self.gsub(quote_char, "#{escape_char}#{quote_char}")
     else
       e = self
     end
     "#{quote_char}#{e}#{quote_char}"
   end
   
   def unquote(quote_char = '"', escape_char = '\\')
     return self if self.length < 2 or self[0] != quote_char or self[-1] != quote_char
     
     unless escape_char.nil?
       self[1..-2].gsub("#{escape_char}#{quote_char}", quote_char)
     else
       self[1..-2]
     end
   end
   
   alias dequote unquote
  end
end