import re
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
            n=nn[1]
            m=re.search(r"\s{2}[a-zA-Z].*",n)
            if m!=None:
                n=m[0]
                f=n.find(">")
                if f>-1:
                    n=n.replace(">","")
                    
                    #try:
                     
                    mm=re.search(r"[a-zA-Z]{2,}(.*\s<).*$",n)
                    if mm!=None:
                        n=n.replace(mm[1]," ")
                        print(f"{n}")
                else:
                    pass
                    print(f"{n}")
                
