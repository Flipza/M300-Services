# M300-Services
Modul 300 Dokumentation von Philipp Zahner

1. Vorbereitungen

Um mit dem Arbeiten überhaupt beginnen zu können, müsssen zuerst einige Tools installiert werden. Unter anderem sind dies folgende;

- Git Client / Git Account
- Visual Studio Code
- VirtualBox
- Vagrant






2.1 Git

Um mit Git arbeiten zu können, laden wir den Git-Client herunter und erstellen einen neuen Ordner, in welches wir unsere Repository herunterladen:

$ git clone https://github.com/Flipza/M300-Services.git

Nun können wir das Repository aktualisieren:

$ git pull

Um das lokale Repository hochzuladen führen wir folgende Schritte, bei jedem Upload wieder, durch:

$  cd Pfad/zu/meinem/Repository    # Zum lokalen GitHub-Repository wechseln

$  git status                      # Geänderte Datei(en) werden rot aufgelistet

$  git add -A                      # Fügt alle Dateien zum "Upload" hinzu

$  git status                      # Der Status ist nun grün > Dateien sind Upload-bereit (Optional) 

$  git commit -m "Mein Kommentar"  # Upload wird "commited" > Kommentar zu Dokumentationszwecken ist                                          dafür notwendig

$  git status                      # Dateien werden nun als "zum Pushen bereit" angezeigt

$  git push                        #Upload bzw. Push wird durchgeführt
