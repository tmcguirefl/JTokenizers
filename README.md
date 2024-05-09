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
NB. it only tokenizes one word: 'snowboardin' <br>
   tokenize 'snowboarding'
snowboarding
snowboardin
snowboardi
snowboard
snowboar
snowboa
snowbo
snowb
snow
boarding
boardin
boardi
board
ing
┌────┬───────┬─────┐
│snow│##board│##ing│
└────┴───────┴─────┘
   
   tokenize 'slowboarding'
slowboarding
slowboardin
slowboardi
slowboard
slowboar
slowboa
slowbo
slowb
slow
slo
sl
s
lowboarding
lowboardin
lowboardi
lowboard
lowboar
lowboa
lowbo
lowb
low
lo
l
owboarding
owboardin
owboardi
owboard
owboar
owboa
owbo
owb
ow
o
wboarding
wboardin
wboardi
wboard
wboar
wboa
wbo
wb
w
boarding
boardin
boardi
board
ing
┌─────┬─────┬─────┬─────┬───────┬─────┐
│[UNK]│[UNK]│[UNK]│[UNK]│##board│##ing│
└─────┴─────┴─────┴─────┴───────┴─────┘
