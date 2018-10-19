#!/bin/sh

echo "--- Installing on `hostname`"
umask 027

if [ -f /tmp/cassrv-files.tgz ]
then
    brew services stop tomcat

    tmpd=`date |md5 | head -c8`
    mkdir /tmp/${tmpd}
    cd /tmp/${tmpd}

    
    tar xzf /tmp/cassrv-files.tgz

    rm -rf /etc/cas/config

    cp -r /tmp/${tmpd}/etc/cas/* /etc/cas/

    cd /usr/local/Cellar/tomcat/9.0.12/libexec/
    rm -rf webapps/cas work/Catalina/localhost/cas
    cd /usr/local/Cellar/tomcat/9.0.12/libexec/webapps

    cp -r /tmp/${tmpd}/cas cas

    brew services start tomcat

    rm -fr /tmp/cassrv-install.sh /tmp/${tmpd} #/tmp/cassrv-files.tgz
    echo "Installation complete."
else
    echo "Cannot find /tmp/cassrv-files.tgz; nothing installed."
    exit 1
fi

exit 0