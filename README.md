# JTokenizers
This is a testing ground for various Tokenizers that would be used in an AI transformer 
architecture
## bftokenizer.ijs
This is a brute force word piece tokenizer. Since it is only proof of concept I do not
use a hashmap type lookup to speed access. I only use it to show big O complexity. 
You will notice the smoutput statement where I print intermediate results. This provides
a nice output of how the nested loops work together and how you process the string to 
split it up into tokens. 
### usage:
NB. it only tokenizes one word: 'snowboarding' <br>
   tokenize 'snowboarding' 
   
   tokenize 'slowboarding'
