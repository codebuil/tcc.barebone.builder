print ("\x1bc\x1b[43;37m")
files="/tmp/null"
f1=open(files,"r")
files=f1.read()
f1.close()
fill=files.split("\n")
fff=False
for n in fill:
    f=n.find(">:")
   
    if f>-1 or fff:
        n=n.replace(">:",":")
        nn=n.split("<");
        print(f"{nn[1]}")
    else:
        nn=n.split(":")
        if len(nn)>1:
            nnn=nn[1]
            nnn=nnn[22:]
            print(f"{nnn}")
