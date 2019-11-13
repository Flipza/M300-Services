# M300-Services
Modul 300 Dokumentation von Philipp Zahner

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


### Extensions installieren
***

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
