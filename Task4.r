letters
sample(letters)
text=sample(letters, size = 10000, replace = TRUE)
text== "a"
lv=text=="a"
lv[lv==TRUE]=1
sum(lv)
text== "e"
lv=text=="e"
lv[lv==TRUE]=1
sum(lv)
text== "i"
lv=text=="i"
lv[lv==TRUE]=1
sum(lv)
text== "u"
lv=text=="u"
lv[lv==TRUE]=1
sum(lv)
text== "y"
lv=text=="y"
lv[lv==TRUE]=1
sum(lv)
text== "o"
lv=text=="o"
lv[lv==TRUE]=1
sum(lv)