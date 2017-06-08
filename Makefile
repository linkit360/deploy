update:
	scp -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201:/home/centos/linkit/*prod.yml mobilink
	scp -i ~/.ssh/yondu.pem  centos@52.76.153.135:/home/centos/linkit/*prod.yml yondu
	scp -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67:/home/centos/linkit/*.prod.yml cheese
	scp -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67:/home/centos/qrtech/*.prod.yml qrtech
#	scp -i ~/.ssh/beeline.pem centos@52.59.112.128:/home/centos/linkit/*.prod.yml beeline

build:
	cd contentd/server; make rm; make build; cd - ; \
	cd dispatcherd; make rm; make build; cd - ; \
	cd inmem/server; make rm; make build; cd - ; \
	cd jobs; make rm; make build; cd - ; \
	cd mt; make rm; make build; cd - ;
	cd operator/pk/mobilink; make rm; make build; cd - ;
	cd pixels; make rm; make build; cd - ;
	cd qlistener; make rm; make build; cd - ;\

br:
	cd contentd;  git checkout -b $1; cd - ; \
	cd dispatcherd; git checkout -b $1;  cd - ; \
	cd inmem; git checkout -b $1; cd - ; \
	cd jobs; git checkout -b $1; cd - ; \
	cd mt; git checkout -b $1; cd - ;
	cd operator; git checkout -b $1;  cd - ;
	cd pixels; git checkout -b $1; cd - ;
	cd pixels; git checkout -b $1; cd - ;
	cd qlistener; git checkout -b $1; cd - ;\

co:
	if [ -z "$1" ] then echo "branch name required"; exit; fi ; \
	cd contentd;  git checkout $1; cd - ; \
	cd dispatcherd; git checkout $1;  cd - ; \
	cd inmem; git checkout $1; cd - ; \
	cd jobs; git checkout $1; cd - ; \
	cd mt; git checkout $1; cd - ;
	cd operator; git checkout $1;  cd - ;
	cd pixels; git checkout $1; cd - ;
	cd pixels; git checkout $1; cd - ;
	cd qlistener; git checkout $1; cd - ;\

tag:
	cd db; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd deploy; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd go-acceptor-structs; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd go-contentd; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd go-dispatcherd; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags;  cd - ; \
	cd go-inmem;  git commit -a -m 'inmem: no operator, no ips'; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd go-jobs; git commit -a -m 'inmem: no operator, no ips' ; git push; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ; \
	cd go-mt;  git commit -a -m 'inmem: no operator, no ips'; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ;
	cd go-operator; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags;cd - ;
	cd go-partners; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags;cd - ;
	cd go-pixel; git commit -a -m 'inmem: no operator, no ips' ; git push; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags;cd - ;
	cd go-qlistener; git commit -a -m 'inmem: no operator, no ips' ; git push; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ;\
	cd go-reporter; git commit -a -m 'inmem: no operator, no ips' ; git push ; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags;cd - ;
	cd go-utils;  git commit -a -m 'inmem: no operator, no ips' ; git push; git tag -a 1.8 -m "inmem: no operator, no ips"; git push --tags; cd - ;\

push:
	cd contentd;  git push; cd - ; \
	cd dispatcherd; git push;  cd - ; \
	cd inmem; git push; cd - ; \
	cd jobs; git push; cd - ; \
	cd mt; git push; cd - ;
	cd operator; git push;  cd - ;
	cd pixels; git push; cd - ;
	cd pixels; git push; cd - ;
	cd qlistener; git push; cd - ;\
	cd utils; git push; cd - ;\


c:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/contentd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/contentd-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
d:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/dispatcherd-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
q:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/qlistener-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/qlistener-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
p:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/pixel-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/pixel-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
pa:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/partners-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/partners-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

o:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mobilink-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mobilink-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
i:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/inmem-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
mi:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mid-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mid-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

r:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/reporter-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/reporter-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
m:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mt-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mt-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

j:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/jobs-linux-amd64 centos@52.66.23.201:/home/centos/linkit/


mobilink:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/*-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
	# ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 cd /home/centos/linkit/ ; rm acceptor* cheese* beeline* yondu* qrtech* stat_complaints* retries

yondu:
	# ssh -i ~/.ssh/yondu.pem centos@52.76.153.135  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/*-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yonduop:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/yondu-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/yondu-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondum:
	# ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/mt-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/mt-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondud:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/dispatcherd-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yonduj:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/jobs-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondur:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/reporter-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/reporter-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondui:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/inmem-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

cheese:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*-linux-amd64 centos@52.220.98.67:/home/centos/linkit/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*yml centos@52.220.98.67:/home/centos/linkit/
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  cd /home.centos/linkit; rm acceptor* mobilink* beeline* yondu* qrtech* stat_complaints* retries;

cheeseop:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/cheese-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/cheese-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesei:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/inmem-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesep:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/pixel-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/pixel-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesem:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/mt-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mt-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesej:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/jobs-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesed:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/dispatcherd-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheeseq:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/qlistener-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/qlistener-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheeser:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/reporter-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/reporter-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesec:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/contentd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/contentd-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesei:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/mid-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mid-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

qrtech:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/*-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*yml centos@52.220.98.67:/home/centos/qrtech/
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 cd /home/centos/qrtech/ ; rm acceptor* cheese* beeline* yondu* mobilink*

qrtechop:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/qrtech-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/qrtech-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechi:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/inmem-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/inmem-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechp:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/pixels-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/pixels-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechm:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/mt-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mt-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechmi:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/mid-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mid-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechj:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/jobs-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/jobs-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechd:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/dispatcherd-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/dispatcherd-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechq:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/qlistener-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/qlistener-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechr:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/reporter-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/reporter-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/


beeline:
	# ssh -i ~/.ssh/beeline.pem centos@52.59.112.128  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/*-linux-amd64 centos@52.59.112.128:/home/centos/linkit/
	scp -i ~/.ssh/beeline.pem ~/linkit/*yml centos@52.59.112.128:/home/centos/linkit/;
	# rm acceptor* mobilink* cheese* yondu* qrtech* stat_complaints* retries;

beelineop:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/beeline-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/beeline-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelinem:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/mt-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/mt-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelined:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/dispatcherd-linux-amd64 centos@52.59.112.128:/home/centos/linkit/
beelineq:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/qlistener-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/qlistener-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelinei:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/inmem-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beeliner:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/reporter-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/reporter-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelinej:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/jobs-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

.PHONY: build tag commit yondu cheese beeline qrtech mobilink

diffconfig:
#     diff -u contentd.prod.yml contentd.yml
#     diff -u dispatcherd.prod.yml dispatcherd.yml
#     diff -u jobs.prod.yml jobs.yml
#     diff -u beeline.prod.yml beeline.yml
#     diff -u cheese.prod.yml cheese.yml
#     diff -u mobilink.prod.yml mobilink.yml
#     diff -u qrtech.prod.yml qrtech.yml
#     diff -u mt.yml mt.prod.yml
#     diff -u mid.yml mid.prod.yml
#     diff -u inmem.prod.yml inmem.yml
#     diff -u pixel.prod.yml pixel.yml
#     diff -u qlistener.prod.yml qlistener.yml

#Индонезия
#Таиланд
#Пакистан
#Турция
#Филиппины
#Бразилия
#Венесуэла
#Египет
#Италия
#Россия
#Марокко
#Бангладеш
#Вьетнам
#Франция
#Индия
