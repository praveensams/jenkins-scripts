#!/bin/bash


uploads()
    {

    if [ `echo $1 | wc -c ` -gt 1 ]
    then
		version=$1
	else
	    version=$(cat /hybris/new_jenkins/workspace/hybris-package-dev/temp/hybris/hybrisServer/version)
	fi
    
    if [ $( grep $version /etc/prod | wc -c ) -gt 4  ]
    then
        echo "veron is already there"
    else 
        cd /hybris/play_prod
        rm -rf /hybris/play_prod/*
        cp -rvf /hybris/new_jenkins/packages/*${version}* /hybris/play_prod/
		unzip /hybris/play_prod/*.zip
        #cp /hybris/new_jenkins/workspace/hybris-package-dev/temp/hybris/hybrisServer/hybrisServer-AllExtensions.zip /hybris/play_prod/
		cp  /hybris/play_prod/extra-ws_v*/hybris/bin/hybrisServer-AllExtensions.zip /hybris/play_prod/
        unzip /hybris/play_prod/hybrisServer-AllExtensions.zip
       #(
       #cd /hybris/play_prod/hybris/bin/custom/extrastorefront/web/webroot/_ui/responsive/theme-extra
       #azcopy --source . --destination https://exprdstrgcdn.blob.core.windows.net/exprdeccdn01/ImagesSections/hybris/ --dest-key zqireCeb6SebWU1xS9uleijwSnE+Sf0JCwqrBIKx44DxEpAnDpp0yZdLenN6rojte/58/aS0gQ6toi/fL80NSg== --quiet --recursive   --resume "/mnt/myjournal"
       #ls -l 
       #)
        (
        cd /hybris/play_prod/hybris/bin/custom/extrastorefront/web/webroot/_ui
        azcopy --source . --destination https://exprdstrgcdn.blob.core.windows.net/exprdeccdn01/ImagesSections/hybris/cdn/prod/_ui/ --dest-key zqireCeb6SebWU1xS9uleijwSnE+Sf0JCwqrBIKx44DxEpAnDpp0yZdLenN6rojte/58/aS0gQ6toi/fL80NSg== --quiet --recursive   --resume "/mnt/myjournal"
       ls -l 
       )

       (
		cd /hybris/play_prod/hybris/bin/custom/extrastorefront/web/webroot/_ui/responsive/theme-extra/css

azcopy --set-content-type 'text/css'  --source .  --destination  https://exprdstrgcdn.blob.core.windows.net/exprdeccdn01/ImagesSections/hybris/cdn/prod/_ui/responsive/theme-extra/css --dest-key zqireCeb6SebWU1xS9uleijwSnE+Sf0JCwqrBIKx44DxEpAnDpp0yZdLenN6rojte/58/aS0gQ6toi/fL80NSg== --quiet   --resume "/mnt/myjournal" --recursive
       )

       (
		cd /hybris/play_prod/hybris/bin/custom/extrastorefront/web/webroot/_ui/responsive/common/js

azcopy --set-content-type 'application/javascript'  --source .  --destination  https://exprdstrgcdn.blob.core.windows.net/exprdeccdn01/ImagesSections/hybris/cdn/prod/_ui/responsive/common/js --dest-key zqireCeb6SebWU1xS9uleijwSnE+Sf0JCwqrBIKx44DxEpAnDpp0yZdLenN6rojte/58/aS0gQ6toi/fL80NSg== --quiet   --resume "/mnt/myjournal" --recursive
       )
       echo $version >> /etc/prod
    fi
    }



stat=$(curl -I -s  http://51.136.48.111:3000/feature-new/hybrisServer/version  | perl -ane 'if(/HTTP\/1.1\s(\d+)/) {print $1}')

 if  [ $stat -eq 200 ]
 then
     uploads
 else
    echo "error in loading the files"
 fi

