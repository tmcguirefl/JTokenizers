NB. BFtokenizer.ijs - brute force word-piece tokenizer usable but
NB.                   meant for demonstration purposes only
NB.
NB. The algorithm looks up all substrings trying to find the largest
NB. substrings in the vocabulary that make up the word.


NB. white space and punctuation routines
NB. the whitespace routines dealing with spaces
NB. are transcribed from APL code found on stack exchange

NB. Remove leading spaces
leadws =: {{(+/*/\' '=y)}. y}}

NB. Remove trailing spaces
trailws =: {{|. leadws |.y}}

NB. consolidate spaces
consolidatews =: {{(-.'  'E.y)#y}}

NB. the following make use of stringreplace routine in JAL
NB. convert other whitespace to spaces
cvtws =: {{ (TAB;' ';LF;' ';CR;' ') stringreplace y}}

NB. separate punctuation
seppunct =: {{('.';' . ';',';' , ';'?';' ? ';':';' : ';'!';' ! ') stringreplace y}}

NB. run the above like this
NB. cut trailws@leadws@consolidatews cvtws seppunct '  hello	thomas! how are you   today? I hope you are doing fine. I know I am.'

lookup =: 3 : 0
 if. y -: 'snow' do.
   1
   return.
 end.
 if. y -: '##board' do. 
   2 
   return.
 end.
 if. y -: '##ing' do.
   3
   return.
 end.
 0
) 

NB. generate substring indexes
sseq =: [ + [: i. -~

NB. Brute force wordpiece tokenization tranlated to J from Julia implementation at:
NB. https://github.com/SeanLee97/BertWordPieceTokenizer.jl/blob/main/src/BertWordPieceTokenizer.jl
tokenize =: 3 : 0
word =. y

tokens =: <''
'i j' =. 0 0
while. i < #y do.
  j =. #y
  sub =. ''
  while. j > i do. 
    sub =. (i sseq j){word
smoutput sub
    if. i > 0 do.
      sub =. '##',sub
    end. 
    tokenid =. lookup sub
    if. tokenid ~: 0 do.
      break.
    else.
      sub =. ''
    end.
    j =. j - 1
  end.
  if. i = j do. 
    j =. j + 1
  end.
  if. 0 < #sub do. 
    tokens =. tokens,<sub
  else.
    NB. if I get here it means we didn't recognize part of the front 
    NB. of the word. Append an [UNK] token
    tokens =. tokens,<'[UNK]'
  end.
  i =. j
end.
 }. tokens
)
