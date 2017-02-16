.PHONY: build tag commit yondu cheese beeline qrtech

# yondu 52.66.23.201
# mobilink 52.66.23.201

build:
	cd contentd/server; make rm; make build; cd - ; \
	cd dispatcherd; make rm; make build; cd - ; \
	cd inmem/server; make rm; make build; cd - ; \
	cd jobs; make rm; make build; cd - ; \
	cd mt_manager; make rm; make build; cd - ;
	cd operator/pk/mobilink; make rm; make build; cd - ;
	cd pixels; make rm; make build; cd - ;
	cd qlistener; make rm; make build; cd - ;\

br:
	cd contentd;  git checkout -b $1; cd - ; \
	cd dispatcherd; git checkout -b $1;  cd - ; \
	cd inmem; git checkout -b $1; cd - ; \
	cd jobs; git checkout -b $1; cd - ; \
	cd mt_manager; git checkout -b $1; cd - ;
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
	cd mt_manager; git checkout $1; cd - ;
	cd operator; git checkout $1;  cd - ;
	cd pixels; git checkout $1; cd - ;
	cd pixels; git checkout $1; cd - ;
	cd qlistener; git checkout $1; cd - ;\

tag:
	cd contentd; git commit -a -m 'before qrtech' ; git push ; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ; \
	cd dispatcherd; git commit -a -m 'before qrtech' ; git push ; git tag -a v1.7 -m "before qrtech"; git push --tags;  cd - ; \
	cd inmem;  git commit -a -m 'before qrtech'; git push ; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ; \
	cd jobs; git commit -a -m 'before qrtech' ; git push; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ; \
	cd mt_manager;  git commit -a -m 'before qrtech'; git push ; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ;
	cd operator; git commit -a -m 'before qrtech' ; git push ; git tag -a v1.7 -m "before qrtech"; git push --tags;cd - ;
	cd pixels; git commit -a -m 'before qrtech' ; git push; git tag -a v1.7 -m "before qrtech"; git push --tags;cd - ;
	cd qlistener; git commit -a -m 'before qrtech' ; git push; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ;\
	cd utils;  git commit -a -m 'before qrtech' ; git push; git tag -a v1.7 -m "before qrtech"; git push --tags; cd - ;\

push:
	cd contentd;  git push; cd - ; \
	cd dispatcherd; git push;  cd - ; \
	cd inmem; git push; cd - ; \
	cd jobs; git push; cd - ; \
	cd mt_manager; git push; cd - ;
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
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/pixels-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/pixels-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
pa:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/partners-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/partners-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

o:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mobilink-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mobilink-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
i:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/inmem-linux-amd64 centos@52.66.23.201:/home/centos/linkit/
m:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mt_manager-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mt_manager-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

j:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/jobs-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

mobilink:
	# ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/*-linux-amd64 centos@52.66.23.201:/home/centos/linkit/

mobilinkm:
	ssh -i ~/.ssh/mobilink_centos.pem centos@52.66.23.201 mv /home/centos/linkit/mt_manager-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/mobilink_centos.pem ~/linkit/mt_manager-linux-amd64 centos@52.66.23.201:/home/centos/linkit/




yondu:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/*-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yonduop:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/yondu-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/yondu-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondum:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/mt_manager-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/mt_manager-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yondud:
	# ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/dispatcherd-linux-amd64 centos@52.76.153.135:/home/centos/linkit/

yonduj:
	ssh -i ~/.ssh/yondu.pem centos@52.76.153.135 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/yondu.pem ~/linkit/jobs-linux-amd64 centos@52.76.153.135:/home/centos/linkit/


cheese:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheeseop:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/cheese-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/cheese-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesei:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/inmem-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/inmem-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesep:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/pixels-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/pixels-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesem:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/mt_manager-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mt_manager-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesej:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/jobs-linux-amd64 centos@52.220.98.67:/home/centos/linkit/

cheesed:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/dispatcherd-linux-amd64 centos@52.220.98.67:/home/centos/linkit/


qrtech:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/*-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/*-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechop:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/cheese-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/cheese-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechi:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/inmem-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/inmem-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechp:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/pixels-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/pixels-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechm:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/mt_manager-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/mt_manager-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechj:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/jobs-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/jobs-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/

qrtechd:
	ssh -i ~/.ssh/cheese_mobile_v2.pem centos@52.220.98.67  mv /home/centos/qrtech/dispatcherd-linux-amd64 /home/centos/qrtech/prev/
	scp -i ~/.ssh/cheese_mobile_v2.pem ~/linkit/dispatcherd-linux-amd64 centos@52.220.98.67:/home/centos/qrtech/





beeline:
	ssh -i ~/.ssh/beeline.pem centos@52.76.153.135  mv /home/centos/linkit/*-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/*-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelineop:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/beeline-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/beeline-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelinem:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/mt_manager-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/mt_manager-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelined:
	# ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/dispatcherd-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/dispatcherd-linux-amd64 centos@52.59.112.128:/home/centos/linkit/

beelinej:
	ssh -i ~/.ssh/beeline.pem centos@52.59.112.128 mv /home/centos/linkit/jobs-linux-amd64 /home/centos/linkit/prev/
	scp -i ~/.ssh/beeline.pem ~/linkit/jobs-linux-amd64 centos@52.59.112.128:/home/centos/linkit/
