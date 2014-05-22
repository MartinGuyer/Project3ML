mushroom = read.csv("MushroomData.txt", header=TRUE)
head(mushroom)

mushroom.poison = mushroom %.%
  filter(poison=="p")


names = colnames(mushroom.poison)
for(i in 2:23){
  print(unique(mushroom.poison[,i]))
  print(names[i])
}


#Note: No poison with "s" for capShape 
  #or no "r", "u" in capColor
  #or "a", "l" in oder
  #or "e", "o" in gillColor
  #or "e" in stalkRoot
  #or "e", "g", "o" in stalkColorAbove
  #or "e", "g", "o" in stalkColorBelow
  #or "n", "o" in veil color
  #or "f" in ring type
  #or "b", "o", "u", "y" in sporeColor
  #or "a", "n" in population
  #or "w" in habitat

attempt_cap.color = mushroom %.%
  filter(capColor !="r" & capColor !="u")
#cap.color alone failes!

attempt_gill.color = mushroom %.%
  filter(gillColor!="e" & gillColor!="o")
#better, but no cigar

attempt_capAndgill.color = mushroom %.%
  filter(gillColor!="r" & gillColor!="o" & capColor!="r" & capColor!="u")
#a tiny bit better than gill alone!

attempt_stalk.colorAB = mushroom %.%
  filter(stalkColorAbove!="e" & stalkColorAbove!="g" & stalkColorAbove!="o")%.%
  filter(stalkColorBelow!="e" & stalkColorBelow!="g" & stalkColorBelow!="o")

#adding gill colors
and.gill = attempt_stalk.colorAB %.%
  filter(gillColor!="e" & gillColor!="o")

#adding cap color
and.cap = and.gill %.% 
  filter(capColor !="r" & capColor !="u")

#adding veil color
and.veil = and.cap %.%
  filter(veilColor!="n" & veilColor!="o") #does nothing!!!!

#adding spore color
and.spore = and.cap %.%
  filter(sporeColor!="b" & sporeColor!="o" & sporeColor!="u" & sporeColor!="y")

#By colors alone, you cannot figure out if the a mushroom is poisonous

#adding habitat
and.habitat = and.spore %.%
  filter(habitat!="w")

#adding population
and.population = and.habitat %.%
  filter(population!="a"&population!="n")

########################################################################
#Not working out too well when looking at what the poisonous are NOT #
#Therefore, I am going to look at what only the poisonous ones are #
########################################################################

non.poison = mushroom %.%
  filter(poison!="p")

for(i in 2:23){
  print(unique(non.poison[,i]))
  print(names[i])
}

#The nonpoisonous mushrooms do not have the following charateristics:
#cap shape of "c"
#cap surface of "g"
#gill color of "b" or "r"
#stalkColorAbove & Below of "b" "c" or "y"
#veilColor "y"
#ringNumber "n"
#ringType of "l" or "n"
#sporeColor of "r"

attempt.apear1 = mushroom %.%
  filter(capShape=="c") #capShape stinks

attempt2 = mushroom %.%
  filter(capSurface=="g"|capShape=="c") #7 observations!!

attempt3 = mushroom %.% 
  filter(gillColor=="b"|gillColor=="r") #Gill Color helps a TON! (1752 obs)

attempt4 = mushroom %.%
  filter(stalkColorAbove=="b"|stalkColorAbove=="c"|stalkColorAbove=="y") #ok

attempt5 = mushroom %.%
  filter(stalkColorAbove=="b"|stalkColorAbove=="c"|stalkColorAbove=="y" |
           stalkColorBelow=="b"|stalkColorBelow=="c"|stalkColorBelow=="y")
#clost to doubled attempt 5

attempt6 = mushroom %.%
  filter(veilColor=="y") #terrible

attempt7 = mushroom %.%
  filter(ringNumber=="n" | ringType=="l" | ringType=="n") #pretty good (1332obs)

attempt8 = mushroom %.%
  filter(sporeColor=="r") #72 obs

#putting attempts together
ringAndGill = mushroom %.%
  filter(gillColor=="b"| gillColor=="r" | ringNumber=="n" | ringType=="l" |
           ringType=="n") #3084 obs of the 3916 poisonous mushrooms!!
