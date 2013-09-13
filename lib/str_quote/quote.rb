module StrQuote
 module Quote
   def quote(opts = {})
     opts = {quote_char: '"', escape_char: '\\'}.merge opts
     unless opts[:escape_char].nil?
       e = self.gsub(opts[:quote_char], "#{opts[:escape_char]}#{opts[:quote_char]}")
     else
       e = self
     end
     "#{opts[:quote_char]}#{e}#{opts[:quote_char]}"
   end
   
   def unquote(opts = {})
    opts = {quote_char: ['"',"'"], strip: true, escape_char: '\\'}.merge opts
    
     # Should we strip this string first?     
     if opts[:strip]
       s = self.strip
     else
       s = self
     end
     
     # Get the quote string into an array, to simplify the logic below
     if opts[:quote_char].is_a? String
       opts[:quote_char] = [ opts[:quote_char] ]
     end
     
     # If it's too short to quote, we're done.
     return s if s.length < 2
     
     # Now it has to be quoted before we do anything.
     opts[:quote_char].each do |qc|
       if s[0..qc.length-1] == qc and s[0-qc.length..-1] == qc
         unless opts[:escape_char].nil?
           return s[qc.length..0-(qc.length+1)].gsub("#{opts[:escape_char]}#{qc}", qc)
         else
           return s[qc.length..0-(qc.length+1)]
         end
       end
     end
     
     # Not quoted according to the rules passed to us
     s
   end
   
   alias dequote unquote
  end
end