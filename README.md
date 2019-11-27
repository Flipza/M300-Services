# M300-Services
Modul 300 Dokumentation von Philipp Zahner

### Inhaltsverzeichnis

* 01 - [LB2](#-01---LB2)
* 02 - [LB3](#-02---LB3)

## 1. Vorbereitungen

Um mit dem Arbeiten überhaupt beginnen zu können, müsssen zuerst einige Tools installiert werden. Unter anderem sind dies folgende;

- Git Client / Git Account
- Visual Studio Code
- VirtualBox
- Vagrant






### 2.1 Git

Um mit Git arbeiten zu können, laden wir den Git-Client herunter und erstellen einen neuen Ordner, in welches wir unsere Repository herunterladen:

$ git clone https://github.com/Flipza/M300-Services.git

Nun können wir das Repository aktualisieren:

$ git pull

Um das lokale Repository hochzuladen führen wir folgende Schritte, bei jedem Upload wieder, durch:

Git Befehl | Erklärung
-----------|----------
 $  cd Pfad/zu/meinem/Repository   | # Zum lokalen GitHub-Repository wechseln
 $  git status                     | # Geänderte Datei(en) werden rot aufgelistet
 $  git add -A                     | # Fügt alle Dateien zum "Upload" hinzu
 $  git status                     | # Der Status ist nun grün > Dateien sind Upload-bereit (Optional) 
 $  git commit -m "Mein Kommentar" |# Upload wird "commited" > Kommentar zu Dokumentationszwecken ist                                          dafür notwendig
 $  git status                     | # Dateien werden nun als "zum Pushen bereit" angezeigt
 $  git push                        |#Upload bzw. Push wird durchgeführt


### 2.2 Visual Studio Code installieren

1. Unter https://code.visualstudio.com/ lässt sich der Installer (Version 1.26.1) herunterladen.
2. Auf "Download for Mac" klicken und warten, bis das Fenster zum Herunterladen erscheint. Anschliessend den Download des Installers starten
3. Die Installation erfolgt auch hier GUI-basiert. Wiederum aber Standard (ohne spezielle Anpassungen), sodass an dieser Stelle auf eine Erklärung ebenfalls verzichtet wird.
4. Sobald der Vorgang abgeschlossen wurde, kann mit dem Herunterladen der ISO-Datei und der VM-Erstellung fortgefahren werden.


#### Extensions installieren


Wir fügen dem Editor drei wichtige Extensions hinzu:

* Markdown All in One (von Yu Zhang)
* Vagrant Extension (von Marco Stanzi)
* vscode-pdf Extension (von tomiko1207)

Dazu müssen folgende Anweisungen befolgt werden: 

1. Visual Studio Code öffnen
2. Die Tastenkombination `CTRL` + `SHIFT` + `X` drücken und in der Suchleiste die erwähnten Extensions suchen
3. Auf `Install` klicken und anschliessend auf `Reload`, um die Extension in den Arbeitsbereich zu laden.
4. Nun können die Extensions angewendet werden. Für Markdown ist [diese Liste](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet/"github.com") sehr hilfreich.


### 2.3 Vagrant installieren

Vagrant ist ein Programm zur Erstellung und Verwaltung virtueller Maschinen und ermöglicht einfache Softwareverteilung.
Vagrant kann auf der offiziellen Website heruntergeladen werden:
https://www.vagrantup.com/
Die installation ist GUI-Basiert und kann einfach auf den Standardeinstellungen belassen installiert werden.

Die wichtigsten Befehle sind:

| Befehl                    | Beschreibung                                                      |
| ------------------------- | ----------------------------------------------------------------- | 
| `vagrant init`            | Initialisiert im aktuellen Verzeichnis eine Vagrant-Umgebung und erstellt, falls nicht vorhanden, ein Vagrantfile |
| `vagrant up`              |  Erzeugt und Konfiguriert eine neue Virtuelle Maschine, basierend auf dem Vagrantfile |
| `vagrant ssh`             | Baut eine SSH-Verbindung zur gewünschten VM auf                   |
| `vagrant status`          | Zeigt den aktuellen Status der VM an                              |
| `vagrant port`            | Zeigt die Weitergeleiteten Ports der VM an                        |
| `vagrant halt`            | Stoppt die laufende Virtuelle Maschine                            |
| `vagrant destroy`         | Stoppt die Virtuelle Maschine und zerstört sie.                   |

Weitere Befehle unter: https://www.vagrantup.com/docs/cli/

### Virtuelle Maschine erstellen
***
1. Terminal (*Bash*) öffnen
2. In gewünschtem Verzeichnis einen neuen Ordner für die VM anlegen:
    ```Shell
      $ cd Wohin/auch/immer
      $ mkdir VagrantVM1
      $ cd VagrantVM1
    ``` 
3. Vagrantfile erzeugen, VM erstellen und entsprechend starten:
    ```Shell
      $ vagrant init ubuntu/xenial64        #Vagrantfile erzeugen
      $ vagrant up --provider virtualbox    #Virtuelle Maschine erstellen & starten
    ``` 
4. Die VM ist nun in Betrieb (erscheint auch in der Übersicht innerhalb von VirtualBox) und kann via SSH-Zugriff bedient werden:
    ```Shell
      $ cd Pfad/zu/meiner/Vagrant-VM      #Zum Verzeichnis der VM wechseln
      $ vagrant ssh                       #SSH-Verbindung zur VM aufbauen

      #Anschliessend können ganz normale Bash-Befehle abgesetzt werden:

      $ ls -l /bin  #Bin-Verzeichnis anzeigen
      $ df -h       #Freier Festplattenspeicher
      $ free -m     #Freier Arbeitsspeicher
    ``` 
    ### Apache Webserver automatisiert aufsetzen
***
Um den Automatisierungsgrad von Vagrant im Rahmen dieser Dokumentation etwas besser hervorzuheben, richten wir eine VM, dass sie direkt mit einem vorinstallierten Apache-Webserver startet. Dazu können wir im Vagrantfile den Code etwas leicht abändern und direkt auf Bash-Ebene mit einfachen Befehlen arbeiten. 

Nachfolgend wird die VM mit einem bereits abgeänderten File bzw. VM aus dem M300-Repository erstellt:

1. Terminal (*Bash*) öffnen
2. In das M300-Verzeichnis (/M300/vagrant/web) wechseln:
    ```Shell
      $ cd Pfad/zum-M300-Verzeichnis/vagrant/web
    ``` 
3. VM erstellen und starten:
    ```Shell
      $ vagrant up
    ``` 
4. Webbrowser in der VM öffnen und prüfen, ob der Standard-Content des Webservers unter "http://127.0.0.01:8080" (localhost) erreichbar ist
5. Im Ordner `/web` die Hauptseite `index.html` editieren bzw. durch eine andere ersetzen (z.B. HTML5up-Themplate) und das Resultat überprüfen
6. Abschliessend kann die VM wieder gelöscht werden:
    ```Shell
      $ vagrant destroy -f
    ```
7. Vagrant ist nun komplett einsatzfähig!

## 2.4 Sicherheit in virtuellen Maschinen implementieren
**

### UFW Firewall
***
UFW steht für `Uncomplicated Firewall`. Ziel von UFW ist es, ein unkompliziertes Kommandozeilen-basiertes Frontend für das sehr leistungsfähige, aber nicht gerade einfach zu konfigurierende iptables zu bieten. UFW unterstützt sowohl IPv4 als auch IPv6.

**Ausgabe der offenen Ports**
```Shell
    $ netstat -tulpen
```

**Installation**
```Shell
    $ sudo apt-get install ufw
```

**Start / Stop**
```Shell
    $ sudo ufw status
    $ sudo ufw enable
    $ sudo ufw disable
```

**Firewall-Regeln**
```Shell
    # Port 80 (HTTP) öffnen für alle
    vagrant ssh web
    sudo ufw allow 80/tcp
    exit

    # Port 22 (SSH) nur für den Host (wo die VM laufen) öffnen
    vagrant ssh web
    w
    sudo ufw allow from [Meine-IP] to any port 22
    exit

    # Port 3306 (MySQL) nur für den web Server öffnen
    vagrant ssh database
    sudo ufw allow from [IP der Web-VM] to any port 3306
    exit
```

**Zugriff testen**
```Shell
    $ curl -f 192.168.55.101
    $ curl -f 192.168.55.100:3306
```

**Löschen von Regeln**
```Shell
    $ sudo ufw status numbered
    $ sudo ufw delete 1
```

**Ausgehende Verbindungen** <br>
Ausgehende Verbindungen werden standardmässig erlaubt.

Werden keine Ausgehenden Verbindungen benötigt oder nur bestimmte (z.B. ssh) können zuerst alle geschlossen und dann einzelne Freigeschaltet werden.

```Shell
    $ sudo ufw deny out to any
    $ sudo ufw allow out 22/tcp 
```


### Reverse Proxy
***
Der Apache-Webserver kann auch als Reverse Proxy eingerichtet werden. 

**Installation**
Dazu müssen folgende Module installiert werden:
```Shell
    $ sudo apt-get install libapache2-mod-proxy-html
    $ sudo apt-get install libxml2-dev
```

Anschliessend die Module in Apache aktivieren:
```Shell
    $ sudo a2enmod proxy
    $ sudo a2enmod proxy_html
    $ sudo a2enmod proxy_http 
```

Die Datei /etc/apache2/apache2.conf wie folgt ergänzen:
```Shell
    ServerName localhost 
```

Apache-Webserver neu starten:
```Shell
    $ sudo service apache2 restart
```

**Konfiguration** <br>
Die Weiterleitungen sind z.B. in `sites-enabled/001-reverseproxy.conf` eingetragen:
```Shell
    # Allgemeine Proxy Einstellungen
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    # Weiterleitungen master
    ProxyPass /master http://master
    ProxyPassReverse /master http://master
```

! 01 - LB2
===

### Vorgabe

Das Ziel ist die Erstellung eines Vagrantfiles, welches automatisiert die Ansible AWX Umgebung via Nginx reverse proxy auf Ubuntu 18.04 installiert. Dafür wird folgendes benötigt:

* Vagrant auf Hostsystem installiert.
* Konfiguriertes Vagrantfile mit allen Angaben für die Installation.
* Shared Folder für die Berteitstellung der im Vagrantfile für die Installation der AWX Umgebung benötigten Dateien.
* Portweiterleitung.

Als Vorlage für diese Installation diente mir nachfolgende Website. Allerdings funktionierte diese nicht so wie beschrieben. Deshalb habe ich sie für meine Anforderungen angepasst:
https://www.howtoforge.com/tutorial/how-to-install-ansible-awx-with-nginx-reverse-proxy-on-ubuntu-1804/

Aufgrund dieser Vorlage habe ich ein Vagrantfile erstellt, welches im Ordner LB02 abgelegt ist und betrachtet werden kann:

```Shell
    Vagrant.configure("2") do |config|

  config.vm.define "control" do |control|
    control.vm.box = "ubuntu/bionic64"
    control.vm.network "private_network", ip: "10.0.2.15"
    control.vm.network "forwarded_port", guest_ip: "10.0.2.15", guest: 8080, host_ip:"127.0.0.1", host: 80
    control.vm.hostname = "control"
    control.vm.synced_folder ".", "/vagrant", type: "nfs"
      control.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--name", "control"]
      vb.memory = "4096"
      vb.cpus = "4"
    end
       control.vm.provision :shell, path: "./install.sh"
  end
end
```

Wie wir hier sehen wird in der Konfig die Portweiterleitung aktiviert, damit der Host auf die VM per Webbrowser zugreifen kann.
Für das provisioning habe ich ein Shellscript geschrieben, welches vollautomatisch die Arbeitsumgebung aufsetzt:

```Shell
    sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="ch"/g' /etc/default/locale
    sudo apt-get update -y
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update -y
    sudo apt-get install ansible -y
    sudo apt-get install docker.io -y
    sudo apt-get install python-pip -y
    sudo apt-get install docker-compose -y
    pip install docker-compose 
    pip install docker 
    sudo apt-get install nodejs npm -y
    sudo npm install npm --global
    cd /home/vagrant 
    git clone https://github.com/ansible/awx.git
    cd awx/installer
    rm -f inventory
    cp /vagrant/inventory /home/vagrant/awx/installer/
    sudo ansible-playbook -i inventory install.yml
    sudo apt-get install nginx -y
    sudo mkdir /etc/nginx/ssl
    sudo openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
    sudo cp /vagrant/awx /etc/nginx/sites-available/
    sudo ln -s /etc/nginx/sites-available/awx /etc/nginx/sites-enabled/
    sudo nginx -t
    sudo systemctl restart nginx
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow https
    sudo ufw --force enable
```

! 02 - LB3
===

In dieser Arbeit geht es darum, mithilfe von Vagrant 4 Virtuelle Maschinen aufzusetzen und anschliessend mit Ansible die Softwareverteilung zu steuern. Im wesentlichen setzen wir zwei Webserver auf, welche mit einem Loadbalancer ausgestattet werden.

Wir benötigen für diese Aufgabe folgende VM's:
* Controller Node (Ansible)
* Loadbalancer Node (Nginx Round-Robin Loadbalancer)
* Webserver 1 (Apache Webserver 1)
* Webserver 2 (Apache Webserver 2)

Alle VM's basieren auf Ubuntu 18.04 Server und werden mit Vagrant aufgesetzt. 
Das Vagrantfile sieht folgendermassen aus:
```Shell
    $ docker run --name logtest ubuntu bash -c 'echo "stdout"; echo "stderr" >>2'
    $ docker logs logtest
    $ docker rm logtest
```

Damit sich Ansible auf alle VM's einloggen kann, müssen wir auf der Acontrol-Node einen public-Key generieren, welchen wir auf alle anderen VM's kopieren:
```Shell
    $ ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
    $ sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant
```
Damit wir diesen Public-Key auf die verschiedenen VM's bekommen, loggen wir uns auf jedem Gerät ein, und kopieren den Key in das "authorized_keys"-File.
```Shell
    $ vagrant ssh LoadBalancer
    $ cat /vagrant/id_rsa.pub >>/home/vagrant/.ssh/authorized_keys
```
Jetzt loggen wir uns nochmal auf die Control-Node ein, auf welcher Ansible läuft und verbinden uns mit jeder VM einmal, um zu bestätigen, dass diese Verbindung sicher ist und wir uns damit verbinden wollen. Somit ist es Ansible nun möglich, auf die verschiedenen Nodes eine SSH-Verbindung aufzubauen.

