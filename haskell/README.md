# Instalacja narzędzi

Linux: 

0 Zainstalować potrzebne pakiety

`sudo apt install libgmp-dev`
* dla czystego kontenera mogą być dodatkow potrzbne* `build-essential`, `curl`, `libffi-dev`, `libffi8`, `libgmp-dev`, `libgmp10`, `libncurses-dev`, `pkg-config`


1 Wpisać polecenie 
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
(ze strony https://www.haskell.org/ghcup/)

2 Przeklikać się przez setup (poklikać enter kilka razy, zajmuje to parę minut)

3 Dodać potrzebne polecenia do zmiennej PATH:
- jednorazowo: polecenie `source /root/.ghcup/env`
- na stałe: dodać polecenie wyżej do pliku ~/.bashrc (lub odpowiedniego pliku .rc dla używanej powłoki)
    - i polecenie `source ~/.bashrc` aby działało od razu

# Budowa i uruchomienie

Budowa : `cabal build`

Uruchomienie (automatycznie buduje) : `cabal run`

Uruchomienie w trybie interaktywnym : `cabal repl`

Aplikacja "standalone" jest w `dist-newstyle/build`








