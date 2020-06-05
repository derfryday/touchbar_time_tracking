# Touchbar Zeittracker
## Einrichtung
### Was ihr braucht:
Dieses wundervolle Projekt namens [MTMR](https://github.com/Toxblh/MTMR)
Und das config file aus meiner Repo (dafür hab ich nen mini installer geschrieben)

### Installation:

1. MTMR kann ganz einfach mit brew installiert werden `brew cask install mtmr`
2. MTMR starten und Sicherheitsfreigaben für Automatisierung ersteilen (im [Confluence](https://adup-tech.atlassian.net/wiki/spaces/UA/pages/1635155969/Zeiterfassung) näher beschrieben)
3. Die Repo hier klonen `git clone git@gitlab.adup.euc1.lan:e.freitag/touchbar-zeittracking.git` und das `install.sh` file ausführen. Das Passwort wird im code gehashed und nur der Hash wird gespeichert.

## Layout
```
[ ESC ] [ Display dunkler ] [ Display heller ] [ Spotify ]                          [ Lautsärke - ] [ Lautstärke + ] [ Multimedia play/pause ] [ Akku %] [ Zeittracking status ] [ Lock button ]
```

## Warnung
MTMR ersetzt die gesamte existierende Touchbar.
Die "alte" Touchbar ist noch da und unverändert aber nicht Aktiv, ihr müsst MTMR nur beenden wenn ihr die alte Touchbar zurück haben wollt.
Falls ihr versuchen wollte eure Änderungen zu der neuen Touchbar zu portieren empfehle ich das [MTMR Repo](https://github.com/Toxblh/MTMR) als Dokumentation.
