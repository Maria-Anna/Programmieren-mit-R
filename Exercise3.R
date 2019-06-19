# In Aufgabe 3 sollen weiterhin Datensätze aus dem Paket *nycflights13* verwendet werden.

library(nycflights13)

flights<-flights
weather<-weather
planes<-planes
airports<-airports
airlines<-airlines

# Aufgabe 3a:
# Erstellen Sie eine Funktion `fix_manufacturer`, welche als Ausgabe ein `tibble` (Klasse `tbl_df`)
# ausgibt.
# Als Input soll die Funktion den **planes** Datensatz erhalten.
# Der Output soll dem originalen Datensatz bis auf die folgende Veränderungen der `manufacturer`-Variable entsprechen:
# Verändern Sie die `manufacturer`-Variable, indem Sie
#   - `manufacturer` zu einer Faktor-Variable konvertieren.
#   - AIRBUS und AIRBUS INDUSTRIE zu einer Kategorie zusammenfassen.
#   - alle übrigen `manufacturer`zu einer Kateogrie "Other" zusammenfassen.
#   - Zeilen mit einem unbekannten `manufacturer`-Wert löschen (das
#     beeinflusst auch die anderen Variablen)
## Tipp: Vielleicht kann das Paket *forcats* dafür nützlich sein. Verwenden Sie in dem Fall
#       `forcats::<Funktion>`

library(forcats)

fix_manufactured<-function(planes){
  
 planes$manufacturer<- as.factor(planes$manufacturer)%>%
     fct_other(keep=c("AIRBUS","AIRBUS INDUSTRIE","BOEING"))%>%
    replace(planes$manufacturer=="AIRBUS INDUSTRIE","AIRBUS")%>%
    na.omit()
 
 tbl_df<-planes
 
  return(tbl_df)   
 
}

fix_manufactured(planes)



# Aufgabe 3b:
# Erstellen Sie eine Funktion `plot_seats_histogram`, welche ein Histogramm der Sitzverteilung ausgibt.
# Als Input soll die Funktion den **planes** Datensatz erhalten.
# Der Output der Funktion soll ein `ggplot`-Objekt sein.
# - Verwenden Sie die in 3a) definierte Funktion, um die `manufacturer`-Spalte zusammenzufassen.
# - Unterteilen Sie den Plot sinnvoll nach der neuen `manufacturer`-Spalte.

plot_seats_histogram<-function(planes){
  planes<-fix_manufactured(planes)
  Histogramm<-ggplot(planes,aes(planes$seats))+geom_histogram(binwidth = 30)
  
  return(Histogramm)
}

plot_seats_histogram(planes)

