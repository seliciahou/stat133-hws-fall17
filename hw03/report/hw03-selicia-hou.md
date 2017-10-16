hw03-selicia-hou
================

``` r
library(readr)    # importing data
```

    ## Warning: package 'readr' was built under R version 3.4.2

``` r
library(dplyr)    # data wrangling
```

    ## Warning: package 'dplyr' was built under R version 3.4.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)
```

    ## Warning: package 'ggplot2' was built under R version 3.4.2

``` r
teams1 <- read.csv("/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/data/nba2017-roster.csv", stringsAsFactors = FALSE)
teams1
```

    ##                       player team position height weight age experience
    ## 1               A.J. Hammons  DAL        C     84    260  24          0
    ## 2               Aaron Brooks  IND       PG     72    161  32          8
    ## 3               Aaron Gordon  ORL       SF     81    220  21          2
    ## 4              Adreian Payne  MIN       PF     82    237  25          2
    ## 5                 Al Horford  BOS        C     82    245  30          9
    ## 6               Al Jefferson  IND        C     82    289  32         12
    ## 7            Al-Farouq Aminu  POR       SF     81    220  26          6
    ## 8              Alan Anderson  LAC       SF     78    220  34          7
    ## 9              Alan Williams  PHO        C     80    260  24          1
    ## 10                Alec Burks  UTA       SG     78    214  25          5
    ## 11              Alex Abrines  OKC       SG     78    190  23          0
    ## 12                  Alex Len  PHO        C     85    260  23          3
    ## 13            Alex Poythress  PHI       PF     79    238  23          0
    ## 14             Alexis Ajinca  NOP        C     86    248  28          6
    ## 15              Allen Crabbe  POR       SG     78    210  24          3
    ## 16              Amir Johnson  BOS       PF     81    240  29         11
    ## 17            Andre Drummond  DET        C     83    279  23          4
    ## 18            Andre Iguodala  GSW       SF     78    215  33         12
    ## 19            Andre Roberson  OKC       SF     79    210  25          3
    ## 20           Andrew Harrison  MEM       PG     78    213  22          0
    ## 21          Andrew Nicholson  BRK       PF     81    250  27          4
    ## 22            Andrew Wiggins  MIN       SF     80    199  21          2
    ## 23             Anthony Davis  NOP        C     82    253  23          4
    ## 24            Anthony Morrow  CHI       SG     77    210  31          8
    ## 25          Anthony Tolliver  SAC       PF     80    240  31          8
    ## 26            Archie Goodwin  BRK       SG     77    200  22          3
    ## 27               Aron Baynes  DET        C     82    260  30          4
    ## 28             Arron Afflalo  SAC       SG     77    210  31          9
    ## 29             Austin Rivers  LAC       SG     76    200  24          4
    ## 30             Avery Bradley  BOS       SG     74    180  26          6
    ## 31              Axel Toupane  NOP       SF     79    197  24          1
    ## 32              Ben McLemore  SAC       SG     77    195  23          3
    ## 33                Beno Udrih  DET       PG     75    205  34         12
    ## 34           Bismack Biyombo  ORL        C     81    255  24          5
    ## 35             Blake Griffin  LAC       PF     82    251  27          6
    ## 36          Boban Marjanovic  DET        C     87    290  28          1
    ## 37               Bobby Brown  HOU       PG     74    175  32          2
    ## 38              Bobby Portis  CHI       PF     83    230  21          1
    ## 39          Bojan Bogdanovic  WAS       SF     80    216  27          2
    ## 40                Boris Diaw  UTA       PF     80    250  34         13
    ## 41              Bradley Beal  WAS       SG     77    207  23          4
    ## 42            Brandan Wright  MEM       PF     82    210  29          8
    ## 43              Brandon Bass  LAC       PF     80    250  31         11
    ## 44            Brandon Ingram  LAL       SF     81    190  19          0
    ## 45          Brandon Jennings  WAS       PG     73    170  27          7
    ## 46            Brandon Knight  PHO       SG     75    189  25          5
    ## 47              Brandon Rush  MIN       SG     78    220  31          8
    ## 48             Brian Roberts  CHO       PG     73    173  31          4
    ## 49             Briante Weber  CHO       PG     74    165  24          1
    ## 50             Brice Johnson  LAC       PF     82    230  22          0
    ## 51               Brook Lopez  BRK        C     84    275  28          8
    ## 52             Bruno Caboclo  TOR       SF     81    218  21          2
    ## 53               Bryn Forbes  SAS       SG     75    190  23          0
    ## 54               Buddy Hield  SAC       SG     76    214  23          0
    ## 55             C.J. McCollum  POR       SG     76    200  25          3
    ## 56                C.J. Miles  IND       SF     78    225  29         11
    ## 57               C.J. Watson  ORL       PG     74    175  32          9
    ## 58             Cameron Payne  CHI       PG     75    185  22          1
    ## 59              Caris LeVert  BRK       SF     79    203  22          0
    ## 60           Carmelo Anthony  NYK       SF     80    240  32         13
    ## 61          Chandler Parsons  MEM       SF     82    230  28          5
    ## 62             Channing Frye  CLE        C     83    255  33         10
    ## 63            Chasson Randle  NYK       PG     74    185  23          0
    ## 64             Cheick Diallo  NOP       PF     81    220  20          0
    ## 65            Chinanu Onuaku  HOU        C     82    245  20          0
    ## 66          Chris McCullough  WAS       PF     83    200  21          1
    ## 67                Chris Paul  LAC       PG     72    175  31         11
    ## 68            Christian Wood  CHO       PF     83    220  21          1
    ## 69              Clint Capela  HOU        C     82    240  22          2
    ## 70               Cody Zeller  CHO       PF     84    240  24          3
    ## 71              Cole Aldrich  MIN        C     83    250  28          6
    ## 72              Corey Brewer  LAL       SF     81    186  30          9
    ## 73               Cory Joseph  TOR       SG     75    193  25          5
    ## 74              Courtney Lee  NYK       SG     77    200  31          8
    ## 75         Cristiano Felicio  CHI        C     82    275  24          1
    ## 76             D.J. Augustin  ORL       PG     72    183  29          8
    ## 77          D'Angelo Russell  LAL       PG     77    195  20          1
    ## 78             Dahntay Jones  CLE       SF     78    225  36         12
    ## 79              Damian Jones  GSW        C     84    245  21          0
    ## 80            Damian Lillard  POR       PG     75    195  26          4
    ## 81              Damjan Rudez  ORL       SF     82    228  30          2
    ## 82             Daniel Ochefu  WAS        C     83    245  23          0
    ## 83          Danilo Gallinari  DEN       SF     82    225  28          7
    ## 84               Danny Green  SAS       SG     78    215  29          7
    ## 85          Dante Cunningham  NOP       SF     80    230  29          7
    ## 86                Dante Exum  UTA       PG     78    190  21          1
    ## 87               Dario Saric  PHI       PF     82    223  22          0
    ## 88            Darrell Arthur  DEN       PF     81    235  28          7
    ## 89           Darren Collison  SAC       PG     72    175  29          7
    ## 90           Darrun Hilliard  DET       SG     78    205  23          1
    ## 91                 David Lee  SAS       PF     81    245  33         11
    ## 92               David Nwaba  LAL       SG     76    209  24          0
    ## 93                David West  GSW        C     81    250  36         13
    ## 94             Davis Bertans  SAS       PF     82    210  24          0
    ## 95            DeAndre Jordan  LAC        C     83    265  28          8
    ## 96           DeAndre Liggins  DAL       SG     78    209  28          3
    ## 97           DeAndre' Bembry  ATL       SF     78    210  22          0
    ## 98           Dejounte Murray  SAS       PG     77    170  20          0
    ## 99              Delon Wright  TOR       PG     77    183  24          1
    ## 100            DeMar DeRozan  TOR       SG     79    221  27          7
    ## 101         DeMarcus Cousins  NOP        C     83    270  26          6
    ## 102          DeMarre Carroll  TOR       SF     80    215  30          7
    ## 103        Demetrius Jackson  BOS       PG     73    201  22          0
    ## 104          Dennis Schroder  ATL       PG     73    172  23          3
    ## 105         Denzel Valentine  CHI       SG     78    212  23          0
    ## 106           Deron Williams  CLE       PG     75    200  32         11
    ## 107           Derrick Favors  UTA       PF     82    265  25          6
    ## 108            Derrick Jones  PHO       SF     79    190  19          0
    ## 109             Derrick Rose  NYK       PG     75    190  28          7
    ## 110         Derrick Williams  CLE       PF     80    240  25          5
    ## 111             Devin Booker  PHO       SG     78    206  20          1
    ## 112             Devin Harris  DAL       PG     75    192  33         12
    ## 113           Dewayne Dedmon  SAS        C     84    245  27          3
    ## 114            Deyonta Davis  MEM        C     83    237  20          0
    ## 115            Diamond Stone  LAC        C     83    255  19          0
    ## 116             Dion Waiters  MIA       SG     76    225  25          4
    ## 117            Dirk Nowitzki  DAL       PF     84    245  38         18
    ## 118         Domantas Sabonis  OKC       PF     83    240  20          0
    ## 119       Donatas Motiejunas  NOP       PF     84    222  26          4
    ## 120      Dorian Finney-Smith  DAL       PF     80    220  23          0
    ## 121           Doug McDermott  OKC       SF     80    225  25          2
    ## 122            Dragan Bender  PHO       PF     85    225  19          0
    ## 123           Draymond Green  GSW       PF     79    230  26          4
    ## 124            Dwight Howard  ATL        C     83    265  31         12
    ## 125            Dwight Powell  DAL        C     83    240  25          2
    ## 126              Dwyane Wade  CHI       SG     76    220  35         13
    ## 127            E'Twaun Moore  NOP       SG     76    191  27          5
    ## 128                 Ed Davis  POR       PF     82    240  27          6
    ## 129              Edy Tavares  CLE        C     87    260  24          1
    ## 130            Elfrid Payton  ORL       PG     76    185  22          2
    ## 131           Elijah Millsap  PHO       SG     78    225  29          2
    ## 132          Emmanuel Mudiay  DEN       PG     77    200  20          1
    ## 133              Enes Kanter  OKC        C     83    245  24          5
    ## 134             Eric Bledsoe  PHO       PG     73    190  27          6
    ## 135              Eric Gordon  HOU       SG     76    215  28          8
    ## 136           Ersan Ilyasova  ATL       PF     82    235  29          8
    ## 137            Evan Fournier  ORL       SG     79    205  24          4
    ## 138              Evan Turner  POR       SF     79    220  28          6
    ## 139           Frank Kaminsky  CHO        C     84    242  23          1
    ## 140            Fred VanVleet  TOR       PG     72    195  22          0
    ## 141           Garrett Temple  SAC       SG     78    195  30          6
    ## 142              Gary Harris  DEN       SG     76    210  22          2
    ## 143              George Hill  UTA       PG     75    188  30          8
    ## 144            Georges Niang  IND       PF     80    230  23          0
    ## 145     Georgios Papagiannis  SAC        C     85    240  19          0
    ## 146             Gerald Green  BOS       SF     79    205  31          9
    ## 147         Gerald Henderson  PHI       SG     77    215  29          7
    ## 148    Giannis Antetokounmpo  MIL       SF     83    222  22          3
    ## 149             Goran Dragic  MIA       PG     75    190  30          8
    ## 150           Gordon Hayward  UTA       SF     80    226  26          6
    ## 151             Gorgui Dieng  MIN       PF     83    241  27          3
    ## 152              Greg Monroe  MIL        C     83    265  26          6
    ## 153          Harrison Barnes  DAL       PF     80    210  24          4
    ## 154         Hassan Whiteside  MIA        C     84    265  27          4
    ## 155           Henry Ellenson  DET       PF     83    245  20          0
    ## 156                Ian Clark  GSW       SG     75    175  25          3
    ## 157              Ian Mahinmi  WAS        C     83    250  30          8
    ## 158            Iman Shumpert  CLE       SG     77    220  26          5
    ## 159            Isaiah Canaan  CHI       SG     72    201  25          3
    ## 160            Isaiah Taylor  HOU       PG     75    170  22          0
    ## 161            Isaiah Thomas  BOS       PG     69    185  27          5
    ## 162         Isaiah Whitehead  BRK       PG     76    213  21          0
    ## 163                Ish Smith  DET       PG     72    175  28          6
    ## 164              Ivica Zubac  LAL        C     85    265  19          0
    ## 165               J.J. Barea  DAL       PG     72    185  32         10
    ## 166              J.J. Redick  LAC       SG     76    190  32         10
    ## 167               J.R. Smith  CLE       SG     78    225  31         12
    ## 168            Jabari Parker  MIL       PF     80    250  21          2
    ## 169              Jae Crowder  BOS       SF     78    235  26          4
    ## 170            Jahlil Okafor  PHI        C     83    275  21          1
    ## 171              Jake Layman  POR       SF     81    210  22          0
    ## 172             Jakob Poeltl  TOR        C     84    248  21          0
    ## 173           Jamal Crawford  LAC       SG     77    200  36         16
    ## 174             Jamal Murray  DEN       SG     76    207  19          0
    ## 175            Jameer Nelson  DEN       PG     72    190  34         12
    ## 176              James Ennis  MEM       SF     79    210  26          2
    ## 177             James Harden  HOU       PG     77    220  27          7
    ## 178            James Johnson  MIA       PF     81    250  29          7
    ## 179              James Jones  CLE       SF     80    218  36         13
    ## 180     James Michael McAdoo  GSW       PF     81    230  24          2
    ## 181              James Young  BOS       SG     78    215  21          2
    ## 182           JaMychal Green  MEM       PF     81    227  26          2
    ## 183             Jared Dudley  PHO       PF     79    225  31          9
    ## 184            Jarell Martin  MEM       PF     82    239  22          1
    ## 185            Jarrod Uthoff  DAL       PF     81    221  23          0
    ## 186              Jason Smith  WAS        C     84    245  30          8
    ## 187              Jason Terry  MIL       SG     74    185  39         17
    ## 188             JaVale McGee  GSW        C     84    270  29          8
    ## 189             Jaylen Brown  BOS       SF     79    225  20          0
    ## 190               Jeff Green  ORL       PF     81    235  30          8
    ## 191              Jeff Teague  IND       PG     74    186  28          7
    ## 192              Jeff Withey  UTA        C     84    231  26          3
    ## 193             Jerami Grant  OKC       SF     80    210  22          2
    ## 194              Jeremy Lamb  CHO       SG     77    185  24          4
    ## 195               Jeremy Lin  BRK       PG     75    200  28          6
    ## 196             Jerian Grant  CHI       PG     76    195  24          1
    ## 197           Jerryd Bayless  PHI       PG     75    200  28          8
    ## 198             Jimmy Butler  CHI       SF     79    220  27          5
    ## 199              Joakim Noah  NYK        C     83    230  31          9
    ## 200              Jodie Meeks  ORL       SG     76    210  29          7
    ## 201               Joe Harris  BRK       SG     78    219  25          2
    ## 202               Joe Ingles  UTA       SF     80    226  29          2
    ## 203              Joe Johnson  UTA       SF     79    240  35         15
    ## 204                Joe Young  IND       PG     74    180  24          1
    ## 205             Joel Anthony  SAS        C     81    245  34          9
    ## 206            Joel Bolomboy  UTA       PF     81    235  23          0
    ## 207              Joel Embiid  PHI        C     84    250  22          0
    ## 208        Joffrey Lauvergne  CHI        C     83    220  25          2
    ## 209              John Henson  MIL        C     83    229  26          4
    ## 210                John Wall  WAS       PG     76    195  26          6
    ## 211          Johnny O'Bryant  CHO       PF     81    257  23          2
    ## 212                Jon Leuer  DET       PF     82    228  27          5
    ## 213            Jonas Jerebko  BOS       PF     82    231  29          6
    ## 214        Jonas Valanciunas  TOR        C     84    265  24          4
    ## 215         Jonathon Simmons  SAS       SG     78    195  27          1
    ## 216          Jordan Clarkson  LAL       SG     77    194  24          2
    ## 217          Jordan Crawford  NOP       SG     76    195  28          4
    ## 218              Jordan Hill  MIN        C     82    235  29          7
    ## 219            Jordan Mickey  BOS       PF     80    235  22          1
    ## 220            Jose Calderon  ATL       PG     75    200  35         11
    ## 221             Josh Huestis  OKC       PF     79    230  25          1
    ## 222           Josh McRoberts  MIA       PF     82    240  29          9
    ## 223          Josh Richardson  MIA       SG     78    200  23          1
    ## 224             Jrue Holiday  NOP       PG     76    205  26          7
    ## 225         Juan Hernangomez  DEN       PF     81    230  21          0
    ## 226            Julius Randle  LAL       PF     81    250  22          2
    ## 227          Justin Anderson  PHI       SF     78    228  23          1
    ## 228          Justin Hamilton  BRK        C     84    260  26          2
    ## 229           Justin Holiday  NYK       SG     78    185  27          3
    ## 230          Justise Winslow  MIA       SF     79    225  20          1
    ## 231             Jusuf Nurkic  POR        C     84    280  22          2
    ## 232           K.J. McDaniels  BRK       SF     78    205  23          2
    ## 233       Karl-Anthony Towns  MIN        C     84    244  21          1
    ## 234            Kawhi Leonard  SAS       SF     79    230  25          5
    ## 235               Kay Felder  CLE       PG     69    176  21          0
    ## 236             Kelly Olynyk  BOS        C     84    238  25          3
    ## 237             Kemba Walker  CHO       PG     73    172  26          5
    ## 238           Kenneth Faried  DEN       PF     80    228  27          5
    ## 239            Kent Bazemore  ATL       SF     77    201  27          4
    ## 240 Kentavious Caldwell-Pope  DET       SG     77    205  23          3
    ## 241             Kevin Durant  GSW       SF     81    240  28          9
    ## 242               Kevin Love  CLE       PF     82    251  28          8
    ## 243           Kevin Seraphin  IND       PF     81    285  27          6
    ## 244             Kevon Looney  GSW        C     81    220  20          1
    ## 245          Khris Middleton  MIL       SF     80    234  25          4
    ## 246            Klay Thompson  GSW       SG     79    215  26          5
    ## 247             Kosta Koufos  SAC        C     84    265  27          8
    ## 248                Kris Dunn  MIN       PG     76    210  22          0
    ## 249           Kris Humphries  ATL       PF     81    235  31         12
    ## 250       Kristaps Porzingis  NYK       PF     87    240  21          1
    ## 251            Kyle Anderson  SAS       SG     81    230  23          2
    ## 252              Kyle Korver  CLE       SG     79    212  35         13
    ## 253               Kyle Lowry  TOR       PG     72    205  30         10
    ## 254             Kyle O'Quinn  NYK        C     82    250  26          4
    ## 255             Kyle Singler  OKC       SF     80    228  28          4
    ## 256             Kyle Wiltjer  HOU       PF     82    240  24          0
    ## 257             Kyrie Irving  CLE       PG     75    193  24          5
    ## 258        LaMarcus Aldridge  SAS       PF     83    260  31         10
    ## 259         Lance Stephenson  IND       SG     77    230  26          6
    ## 260             Lance Thomas  NYK       PF     80    235  28          5
    ## 261        Langston Galloway  SAC       PG     74    200  25          2
    ## 262          Larry Nance Jr.  LAL       PF     81    230  24          1
    ## 263              Lavoy Allen  IND       PF     81    260  27          5
    ## 264          Leandro Barbosa  PHO       SG     75    194  34         13
    ## 265             LeBron James  CLE       SF     80    250  32         13
    ## 266             Lou Williams  HOU       SG     73    175  30         11
    ## 267         Luc Mbah a Moute  LAC       SF     80    230  30          8
    ## 268           Lucas Nogueira  TOR        C     84    241  24          2
    ## 269             Luke Babbitt  MIA       SF     81    225  27          6
    ## 270                Luol Deng  LAL       SF     81    220  31         12
    ## 271       Malachi Richardson  SAC       SG     78    205  21          0
    ## 272          Malcolm Brogdon  MIL       SG     77    215  24          0
    ## 273          Malcolm Delaney  ATL       PG     75    190  27          0
    ## 274            Malik Beasley  DEN       SG     77    196  20          0
    ## 275            Manu Ginobili  SAS       SG     78    205  39         14
    ## 276               Marc Gasol  MEM        C     85    255  32          8
    ## 277            Marcin Gortat  WAS        C     83    240  32          9
    ## 278          Marco Belinelli  CHO       SG     77    210  30          9
    ## 279      Marcus Georges-Hunt  ORL       SG     77    216  22          0
    ## 280            Marcus Morris  DET       SF     81    235  27          5
    ## 281             Marcus Smart  BOS       SG     76    220  22          2
    ## 282            Mario Hezonja  ORL       SF     80    215  21          1
    ## 283          Markieff Morris  WAS       PF     82    245  27          5
    ## 284          Marquese Chriss  PHO       PF     82    233  19          0
    ## 285        Marreese Speights  LAC        C     82    255  29          8
    ## 286         Marshall Plumlee  NYK        C     84    250  24          0
    ## 287          Marvin Williams  CHO       PF     81    237  30         11
    ## 288            Mason Plumlee  DEN        C     83    245  26          3
    ## 289              Matt Barnes  GSW       SF     79    226  36         13
    ## 290      Matthew Dellavedova  MIL       PG     76    198  26          3
    ## 291         Maurice Harkless  POR       SF     81    215  23          4
    ## 292            Maurice Ndour  NYK       PF     81    200  24          0
    ## 293        Metta World Peace  LAL       SF     78    260  37         16
    ## 294           Meyers Leonard  POR       PF     85    245  24          4
    ## 295          Michael Beasley  MIL       PF     81    235  28          8
    ## 296  Michael Carter-Williams  CHI       PG     78    190  25          3
    ## 297          Michael Gbinije  DET       SG     79    200  24          0
    ## 298   Michael Kidd-Gilchrist  CHO       SF     79    232  23          4
    ## 299              Mike Conley  MEM       PG     73    175  29          9
    ## 300            Mike Dunleavy  ATL       SF     81    230  36         14
    ## 301              Mike Miller  DEN       SF     80    218  36         16
    ## 302             Mike Muscala  ATL        C     83    240  25          3
    ## 303            Miles Plumlee  CHO        C     83    249  28          4
    ## 304     Mindaugas Kuzminskas  NYK       SF     81    215  27          0
    ## 305          Mirza Teletovic  MIL       PF     81    242  31          4
    ## 306              Monta Ellis  IND       SG     75    185  31         11
    ## 307         Montrezl Harrell  HOU        C     80    240  23          1
    ## 308             Myles Turner  IND        C     83    243  20          1
    ## 309          Nemanja Bjelica  MIN       PF     82    240  28          1
    ## 310             Nerlens Noel  DAL        C     83    228  22          2
    ## 311            Nick Collison  OKC       PF     82    255  36         12
    ## 312               Nick Young  LAL       SG     79    210  31          9
    ## 313            Nicolas Batum  CHO       SG     80    200  28          8
    ## 314         Nicolas Brussino  DAL       SF     79    195  23          0
    ## 315             Nik Stauskas  PHI       SG     78    205  23          2
    ## 316             Nikola Jokic  DEN        C     82    250  21          1
    ## 317           Nikola Mirotic  CHI       PF     82    220  25          2
    ## 318           Nikola Vucevic  ORL        C     84    260  26          5
    ## 319              Noah Vonleh  POR       PF     82    240  21          2
    ## 320            Norman Powell  TOR       SG     76    215  23          1
    ## 321              Norris Cole  OKC       PG     74    175  28          5
    ## 322              Okaro White  MIA       PF     80    204  24          0
    ## 323                Omer Asik  NOP        C     84    255  30          6
    ## 324              Omri Casspi  MIN       SF     81    225  28          7
    ## 325              Otto Porter  WAS       SF     80    198  23          3
    ## 326              P.J. Tucker  TOR       SF     78    245  31          5
    ## 327            Pascal Siakam  TOR       PF     81    230  22          0
    ## 328          Pat Connaughton  POR       SG     77    206  24          1
    ## 329          Patricio Garino  ORL       SG     78    210  23          0
    ## 330         Patrick Beverley  HOU       SG     73    185  28          4
    ## 331            Patrick McCaw  GSW       SG     79    185  21          0
    ## 332        Patrick Patterson  TOR       PF     81    230  27          6
    ## 333              Patty Mills  SAS       PG     72    185  28          7
    ## 334                Pau Gasol  SAS        C     84    250  36         15
    ## 335              Paul George  IND       SF     81    220  26          6
    ## 336             Paul Millsap  ATL       PF     80    246  31         10
    ## 337              Paul Pierce  LAC       SF     79    235  39         18
    ## 338              Paul Zipser  CHI       SF     80    215  22          0
    ## 339               Quincy Acy  BRK       PF     79    240  26          4
    ## 340               Quinn Cook  NOP       PG     74    184  23          0
    ## 341              Rajon Rondo  CHI       PG     73    186  30         10
    ## 342         Rakeem Christmas  IND       PF     81    250  25          1
    ## 343           Ramon Sessions  CHO       PG     75    190  30          9
    ## 344               Randy Foye  BRK       SG     76    213  33         10
    ## 345            Rashad Vaughn  MIL       SG     78    202  20          1
    ## 346                Raul Neto  UTA       PG     73    179  24          1
    ## 347           Raymond Felton  LAC       PG     73    205  32         11
    ## 348           Reggie Bullock  DET       SF     79    205  25          3
    ## 349           Reggie Jackson  DET       PG     75    208  26          5
    ## 350        Richard Jefferson  CLE       SF     79    233  36         15
    ## 351           Richaun Holmes  PHI        C     82    245  23          1
    ## 352              Ricky Rubio  MIN       PG     76    194  26          5
    ## 353         Robert Covington  PHI       SF     81    215  26          3
    ## 354              Robin Lopez  CHI        C     84    255  28          8
    ## 355              Rodney Hood  UTA       SG     80    206  24          2
    ## 356          Rodney McGruder  MIA       SG     76    205  25          0
    ## 357                Ron Baker  NYK       SG     76    220  23          0
    ## 358  Rondae Hollis-Jefferson  BRK       SF     79    220  22          1
    ## 359             Ronnie Price  PHO       PG     74    190  33         11
    ## 360              Roy Hibbert  DEN        C     86    270  30          8
    ## 361                 Rudy Gay  SAC       SF     80    230  30         10
    ## 362              Rudy Gobert  UTA        C     85    245  24          3
    ## 363        Russell Westbrook  OKC       PG     75    200  28          8
    ## 364            Ryan Anderson  HOU       PF     82    240  28          8
    ## 365               Ryan Kelly  ATL       PF     83    230  25          3
    ## 366              Salah Mejri  DAL        C     85    245  30          1
    ## 367               Sam Dekker  HOU       SF     81    230  22          1
    ## 368            Sasha Vujacic  NYK       SG     79    195  32          9
    ## 369          Sean Kilpatrick  BRK       SG     76    210  27          2
    ## 370           Semaj Christon  OKC       PG     75    190  24          0
    ## 371              Serge Ibaka  TOR       PF     82    235  27          7
    ## 372         Sergio Rodriguez  PHI       PG     75    176  30          4
    ## 373               Seth Curry  DAL       PG     74    185  26          3
    ## 374         Shabazz Muhammad  MIN       SF     78    223  24          3
    ## 375           Shabazz Napier  POR       PG     73    175  25          2
    ## 376         Shaun Livingston  GSW       PG     79    192  31         11
    ## 377               Shawn Long  PHI        C     81    255  24          0
    ## 378        Sheldon McClellan  WAS       SG     77    200  24          0
    ## 379             Shelvin Mack  UTA       PG     75    203  26          5
    ## 380          Skal Labissiere  SAC       PF     83    225  20          0
    ## 381             Solomon Hill  NOP       SF     79    225  25          3
    ## 382        Spencer Dinwiddie  BRK       PG     78    200  23          2
    ## 383            Spencer Hawes  MIL       PF     85    245  28          9
    ## 384          Stanley Johnson  DET       SF     79    245  20          1
    ## 385            Stephen Curry  GSW       PG     75    190  28          7
    ## 386        Stephen Zimmerman  ORL        C     84    240  20          0
    ## 387             Steven Adams  OKC        C     84    255  23          3
    ## 388           T.J. McConnell  PHI       PG     74    200  24          1
    ## 389              T.J. Warren  PHO       SF     80    230  23          2
    ## 390               Taj Gibson  OKC       PF     81    225  31          7
    ## 391              Tarik Black  LAL        C     81    250  25          2
    ## 392            Terrence Ross  ORL       SF     79    206  25          4
    ## 393             Terry Rozier  BOS       PG     74    190  22          1
    ## 394          Thabo Sefolosha  ATL       SF     79    220  32         10
    ## 395           Thaddeus Young  IND       PF     80    221  28          9
    ## 396          Thomas Robinson  LAL       PF     82    237  25          4
    ## 397               Thon Maker  MIL        C     85    216  19          0
    ## 398           Tiago Splitter  PHI        C     83    245  32          6
    ## 399              Tim Frazier  NOP       PG     73    170  26          2
    ## 400             Tim Hardaway  ATL       SG     78    205  24          3
    ## 401           Tim Quarterman  POR       SG     78    195  22          0
    ## 402           Timofey Mozgov  LAL        C     85    275  30          6
    ## 403  Timothe Luwawu-Cabarrot  PHI       SF     78    205  21          0
    ## 404            Tobias Harris  DET       PF     81    235  24          5
    ## 405         Tomas Satoransky  WAS       SG     79    210  25          0
    ## 406               Tony Allen  MEM       SG     76    213  35         12
    ## 407              Tony Parker  SAS       PG     74    185  34         15
    ## 408               Tony Snell  MIL       SG     79    200  25          3
    ## 409           Treveon Graham  CHO       SG     78    220  23          0
    ## 410             Trevor Ariza  HOU       SF     80    215  31         12
    ## 411            Trevor Booker  BRK       PF     80    228  29          6
    ## 412               Trey Burke  WAS       PG     73    191  24          3
    ## 413               Trey Lyles  UTA       PF     82    234  21          1
    ## 414         Tristan Thompson  CLE        C     81    238  25          5
    ## 415             Troy Daniels  MEM       SG     76    205  25          3
    ## 416            Troy Williams  HOU       SF     79    218  22          0
    ## 417                Ty Lawson  SAC       PG     71    195  29          7
    ## 418              Tyler Ennis  LAL       PG     75    194  22          2
    ## 419            Tyler Johnson  MIA       PG     76    186  24          2
    ## 420               Tyler Ulis  PHO       PG     70    150  21          0
    ## 421             Tyler Zeller  BOS        C     84    253  27          4
    ## 422             Tyreke Evans  SAC       SF     78    220  27          7
    ## 423           Tyson Chandler  PHO        C     85    240  34         15
    ## 424               Tyus Jones  MIN       PG     74    195  20          1
    ## 425            Udonis Haslem  MIA        C     80    235  36         13
    ## 426           Victor Oladipo  OKC       SG     76    210  24          3
    ## 427             Vince Carter  MEM       SF     78    220  40         18
    ## 428             Wade Baldwin  MEM       PG     76    202  20          0
    ## 429          Wayne Ellington  MIA       SG     76    200  29          7
    ## 430             Wayne Selden  MEM       SG     77    230  22          0
    ## 431           Wesley Johnson  LAC       SF     79    215  29          6
    ## 432          Wesley Matthews  DAL       SG     77    220  30          7
    ## 433              Will Barton  DEN       SG     78    175  26          4
    ## 434      Willie Cauley-Stein  SAC        C     84    240  23          1
    ## 435              Willie Reed  MIA        C     82    220  26          1
    ## 436        Willy Hernangomez  NYK        C     83    240  22          0
    ## 437          Wilson Chandler  DEN       SF     80    225  29          8
    ## 438             Yogi Ferrell  DAL       PG     72    180  23          0
    ## 439              Zach LaVine  MIN       SG     77    189  21          2
    ## 440            Zach Randolph  MEM       PF     81    260  35         15
    ## 441            Zaza Pachulia  GSW        C     83    270  32         13
    ##       salary
    ## 1     650000
    ## 2    2700000
    ## 3    4351320
    ## 4    2022240
    ## 5   26540100
    ## 6   10230179
    ## 7    7680965
    ## 8    1315448
    ## 9     874636
    ## 10  10154495
    ## 11   5994764
    ## 12   4823621
    ## 13     31969
    ## 14   4600000
    ## 15  18500000
    ## 16  12000000
    ## 17  22116750
    ## 18  11131368
    ## 19   2183072
    ## 20    945000
    ## 21   6088993
    ## 22   6006600
    ## 23  22116750
    ## 24   3488000
    ## 25   8000000
    ## 26    119494
    ## 27   6500000
    ## 28  12500000
    ## 29  11000000
    ## 30   8269663
    ## 31     20580
    ## 32   4008882
    ## 33   1551659
    ## 34  17000000
    ## 35  20140838
    ## 36   7000000
    ## 37    680534
    ## 38   1453680
    ## 39   3730653
    ## 40   7000000
    ## 41  22116750
    ## 42   5700000
    ## 43   1551659
    ## 44   5281680
    ## 45   1200000
    ## 46  12606250
    ## 47   3500000
    ## 48   1050961
    ## 49    102898
    ## 50   1273920
    ## 51  21165675
    ## 52   1589640
    ## 53    543471
    ## 54   3517200
    ## 55   3219579
    ## 56   4583450
    ## 57   5000000
    ## 58   2112480
    ## 59   1562280
    ## 60  24559380
    ## 61  22116750
    ## 62   7806971
    ## 63    143860
    ## 64    543471
    ## 65    543471
    ## 66   1191480
    ## 67  22868828
    ## 68    874636
    ## 69   1296240
    ## 70   5318313
    ## 71   7643979
    ## 72   7600000
    ## 73   7330000
    ## 74  11242000
    ## 75    874636
    ## 76   7250000
    ## 77   5332800
    ## 78     18255
    ## 79   1171560
    ## 80  24328425
    ## 81    980431
    ## 82    543471
    ## 83  15050000
    ## 84  10000000
    ## 85   2978250
    ## 86   3940320
    ## 87   2318280
    ## 88   8070175
    ## 89   5229454
    ## 90    874060
    ## 91   1551659
    ## 92     73528
    ## 93   1551659
    ## 94    543471
    ## 95  21165675
    ## 96   1015696
    ## 97   1499760
    ## 98   1180080
    ## 99   1577280
    ## 100 26540100
    ## 101 16957900
    ## 102 14200000
    ## 103  1450000
    ## 104  2708582
    ## 105  2092200
    ## 106   259626
    ## 107 11050000
    ## 108   543471
    ## 109 21323250
    ## 110   268029
    ## 111  2223600
    ## 112  4228000
    ## 113  2898000
    ## 114  1369229
    ## 115   543471
    ## 116  2898000
    ## 117 25000000
    ## 118  2440200
    ## 119   576724
    ## 120   543471
    ## 121  2483040
    ## 122  4276320
    ## 123 15330435
    ## 124 23180275
    ## 125  8375000
    ## 126 23200000
    ## 127  8081363
    ## 128  6666667
    ## 129     5145
    ## 130  2613600
    ## 131    23069
    ## 132  3241800
    ## 133 17145838
    ## 134 14000000
    ## 135 12385364
    ## 136  8400000
    ## 137 17000000
    ## 138 16393443
    ## 139  2730000
    ## 140   543471
    ## 141  8000000
    ## 142  1655880
    ## 143  8000000
    ## 144   650000
    ## 145  2202240
    ## 146  1410598
    ## 147  9000000
    ## 148  2995421
    ## 149 15890000
    ## 150 16073140
    ## 151  2348783
    ## 152 17100000
    ## 153 22116750
    ## 154 22116750
    ## 155  1704120
    ## 156  1015696
    ## 157 15944154
    ## 158  9700000
    ## 159  1015696
    ## 160   255000
    ## 161  6587132
    ## 162  1074145
    ## 163  6000000
    ## 164  1034956
    ## 165  4096950
    ## 166  7377500
    ## 167 12800000
    ## 168  5374320
    ## 169  6286408
    ## 170  4788840
    ## 171   600000
    ## 172  2703960
    ## 173 13253012
    ## 174  3210840
    ## 175  4540525
    ## 176  2898000
    ## 177 26540100
    ## 178  4000000
    ## 179  1551659
    ## 180   980431
    ## 181  1825200
    ## 182   980431
    ## 183 10470000
    ## 184  1286160
    ## 185    63938
    ## 186  5000000
    ## 187  1551659
    ## 188  1403611
    ## 189  4743000
    ## 190 15000000
    ## 191  8800000
    ## 192  1015696
    ## 193   980431
    ## 194  6511628
    ## 195 11483254
    ## 196  1643040
    ## 197  9424084
    ## 198 17552209
    ## 199 17000000
    ## 200  6540000
    ## 201   980431
    ## 202  2250000
    ## 203 11000000
    ## 204  1052342
    ## 205   165952
    ## 206   600000
    ## 207  4826160
    ## 208  1709720
    ## 209 12517606
    ## 210 16957900
    ## 211   161483
    ## 212 10991957
    ## 213  5000000
    ## 214 14382022
    ## 215   874636
    ## 216 12500000
    ## 217   173094
    ## 218  3911380
    ## 219  1223653
    ## 220   392478
    ## 221  1191480
    ## 222  5782450
    ## 223   874636
    ## 224 11286518
    ## 225  1987440
    ## 226  3267120
    ## 227  1514160
    ## 228  3000000
    ## 229  1015696
    ## 230  2593440
    ## 231  1921320
    ## 232  3333333
    ## 233  5960160
    ## 234 17638063
    ## 235   543471
    ## 236  3094014
    ## 237 12000000
    ## 238 12078652
    ## 239 15730338
    ## 240  3678319
    ## 241 26540100
    ## 242 21165675
    ## 243  1800000
    ## 244  1182840
    ## 245 15200000
    ## 246 16663575
    ## 247  8046500
    ## 248  3872520
    ## 249  4000000
    ## 250  4317720
    ## 251  1192080
    ## 252  5239437
    ## 253 12000000
    ## 254  3900000
    ## 255  4837500
    ## 256   543471
    ## 257 17638063
    ## 258 20575005
    ## 259  4000000
    ## 260  6191000
    ## 261  5200000
    ## 262  1207680
    ## 263  4000000
    ## 264  4000000
    ## 265 30963450
    ## 266  7000000
    ## 267  2203000
    ## 268  1921320
    ## 269  1227000
    ## 270 18000000
    ## 271  1439880
    ## 272   925000
    ## 273  2500000
    ## 274  1627320
    ## 275 14000000
    ## 276 21165675
    ## 277 12000000
    ## 278  6333333
    ## 279    31969
    ## 280  4625000
    ## 281  3578880
    ## 282  3909840
    ## 283  7400000
    ## 284  2941440
    ## 285  1403611
    ## 286   543471
    ## 287 12250000
    ## 288  2328530
    ## 289   383351
    ## 290  9607500
    ## 291  8988764
    ## 292   543471
    ## 293  1551659
    ## 294  9213484
    ## 295  1403611
    ## 296  3183526
    ## 297   650000
    ## 298 13000000
    ## 299 26540100
    ## 300  4837500
    ## 301  3500000
    ## 302  1015696
    ## 303 12500000
    ## 304  2898000
    ## 305 10500000
    ## 306 10770000
    ## 307  1000000
    ## 308  2463840
    ## 309  3800000
    ## 310  4384490
    ## 311  3750000
    ## 312  5443918
    ## 313 20869566
    ## 314   543471
    ## 315  2993040
    ## 316  1358500
    ## 317  5782450
    ## 318 11750000
    ## 319  2751360
    ## 320   874636
    ## 321   247991
    ## 322   210995
    ## 323  9904494
    ## 324   138414
    ## 325  5893981
    ## 326  5300000
    ## 327  1196040
    ## 328   874636
    ## 329    31969
    ## 330  6000000
    ## 331   543471
    ## 332  6050000
    ## 333  3578948
    ## 334 15500000
    ## 335 18314532
    ## 336 20072033
    ## 337  3500000
    ## 338   750000
    ## 339  1790902
    ## 340    63938
    ## 341 14000000
    ## 342  1052342
    ## 343  6000000
    ## 344  2500000
    ## 345  1811040
    ## 346   937800
    ## 347  1551659
    ## 348  2255644
    ## 349 14956522
    ## 350  2500000
    ## 351  1025831
    ## 352 13550000
    ## 353  1015696
    ## 354 13219250
    ## 355  1406520
    ## 356   543471
    ## 357   543471
    ## 358  1395600
    ## 359   282595
    ## 360  5000000
    ## 361 13333333
    ## 362  2121288
    ## 363 26540100
    ## 364 18735364
    ## 365   418228
    ## 366   874636
    ## 367  1720560
    ## 368  1410598
    ## 369   980431
    ## 370   543471
    ## 371 12250000
    ## 372  8000000
    ## 373  2898000
    ## 374  3046299
    ## 375  1350120
    ## 376  5782450
    ## 377    89513
    ## 378   543471
    ## 379  2433334
    ## 380  1188840
    ## 381 11241218
    ## 382   726672
    ## 383  6348759
    ## 384  2969880
    ## 385 12112359
    ## 386   950000
    ## 387  3140517
    ## 388   874636
    ## 389  2128920
    ## 390  8950000
    ## 391  6191000
    ## 392 10000000
    ## 393  1906440
    ## 394  3850000
    ## 395 14153652
    ## 396  1050961
    ## 397  2568600
    ## 398  8550000
    ## 399  2090000
    ## 400  2281605
    ## 401   543471
    ## 402 16000000
    ## 403  1326960
    ## 404 17200000
    ## 405  2870813
    ## 406  5505618
    ## 407 14445313
    ## 408  2368327
    ## 409   543471
    ## 410  7806971
    ## 411  9250000
    ## 412  3386598
    ## 413  2340600
    ## 414 15330435
    ## 415  3332940
    ## 416   150000
    ## 417  1315448
    ## 418  1733880
    ## 419  5628000
    ## 420   918369
    ## 421  8000000
    ## 422 10661286
    ## 423 12415000
    ## 424  1339680
    ## 425  4000000
    ## 426  6552960
    ## 427  4264057
    ## 428  1793760
    ## 429  6000000
    ## 430    83119
    ## 431  5628000
    ## 432 17100000
    ## 433  3533333
    ## 434  3551160
    ## 435  1015696
    ## 436  1375000
    ## 437 11200000
    ## 438   207798
    ## 439  2240880
    ## 440 10361445
    ## 441  2898000

``` r
new = summarise(group_by(teams1, team), salary = sum(salary)/1000000)
```

    ## Warning: package 'bindrcpp' was built under R version 3.4.2

``` r
new
```

    ## # A tibble: 30 x 2
    ##     team    salary
    ##    <chr>     <dbl>
    ##  1   ATL  90.88649
    ##  2   BOS  91.91509
    ##  3   BRK  65.45121
    ##  4   CHI  92.07689
    ##  5   CHO 100.24629
    ##  6   CLE 125.79022
    ##  7   DAL  92.09820
    ##  8   DEN  78.38299
    ##  9   DET 103.07391
    ## 10   GSW  98.69091
    ## # ... with 20 more rows

``` r
newer = arrange(new, desc(salary))
newer
```

    ## # A tibble: 30 x 2
    ##     team    salary
    ##    <chr>     <dbl>
    ##  1   CLE 125.79022
    ##  2   LAC 114.77662
    ##  3   TOR 108.45847
    ##  4   MEM 108.34228
    ##  5   SAS 104.68668
    ##  6   DET 103.07391
    ##  7   POR 103.03223
    ##  8   ORL 102.40913
    ##  9   CHO 100.24629
    ## 10   WAS  98.77927
    ## # ... with 20 more rows

``` r
ggplot(newer, aes(x = reorder(team, salary), y = salary)) + geom_bar(stat='identity') + labs(title = "NBA Teams ranked by Total Salary", x="Team", y="Salary (in millions)") + coord_flip() + geom_hline(aes(yintercept = mean(salary), color="red"))
```

![](hw03-selicia-hou_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-1.png)

``` r
stats <- read.csv("/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/data/nba2017-stats.csv", stringsAsFactors = FALSE)
stats
```

    ##                       player games_played minutes field_goals_made
    ## 1                 Al Horford           68    2193              379
    ## 2               Amir Johnson           80    1608              213
    ## 3              Avery Bradley           55    1835              359
    ## 4          Demetrius Jackson            5      17                3
    ## 5               Gerald Green           47     538               95
    ## 6              Isaiah Thomas           76    2569              682
    ## 7                Jae Crowder           72    2335              333
    ## 8                James Young           29     220               25
    ## 9               Jaylen Brown           78    1341              192
    ## 10             Jonas Jerebko           78    1232              114
    ## 11             Jordan Mickey           25     141               15
    ## 12              Kelly Olynyk           75    1538              260
    ## 13              Marcus Smart           79    2399              269
    ## 14              Terry Rozier           74    1263              151
    ## 15              Tyler Zeller           51     525               78
    ## 16             Channing Frye           74    1398              238
    ## 17             Dahntay Jones            1      12                3
    ## 18            Deron Williams           24     486               68
    ## 19          Derrick Williams           25     427               54
    ## 20               Edy Tavares            1      24                3
    ## 21             Iman Shumpert           76    1937              201
    ## 22                J.R. Smith           41    1187              123
    ## 23               James Jones           48     381               44
    ## 24                Kay Felder           42     386               62
    ## 25                Kevin Love           60    1885              370
    ## 26               Kyle Korver           35     859              131
    ## 27              Kyrie Irving           72    2525              671
    ## 28              LeBron James           74    2794              736
    ## 29         Richard Jefferson           79    1614              153
    ## 30          Tristan Thompson           78    2336              262
    ## 31             Bruno Caboclo            9      40                6
    ## 32               Cory Joseph           80    2003              299
    ## 33              Delon Wright           27     446               49
    ## 34             DeMar DeRozan           74    2620              721
    ## 35           DeMarre Carroll           72    1882              220
    ## 36             Fred VanVleet           37     294               39
    ## 37              Jakob Poeltl           54     626               67
    ## 38         Jonas Valanciunas           80    2066              391
    ## 39                Kyle Lowry           60    2244              426
    ## 40            Lucas Nogueira           57    1088              103
    ## 41             Norman Powell           76    1368              227
    ## 42               P.J. Tucker           24     609               52
    ## 43             Pascal Siakam           55     859              103
    ## 44         Patrick Patterson           65    1599              154
    ## 45               Serge Ibaka           23     712              128
    ## 46          Bojan Bogdanovic           26     601              107
    ## 47              Bradley Beal           77    2684              637
    ## 48          Brandon Jennings           23     374               29
    ## 49          Chris McCullough            2       8                0
    ## 50             Daniel Ochefu           19      75               12
    ## 51               Ian Mahinmi           31     555               65
    ## 52               Jason Smith           74    1068              174
    ## 53                 John Wall           78    2836              647
    ## 54             Marcin Gortat           82    2556              390
    ## 55           Markieff Morris           76    2374              406
    ## 56               Otto Porter           80    2605              414
    ## 57         Sheldon McClellan           30     287               30
    ## 58          Tomas Satoransky           57     719               61
    ## 59                Trey Burke           57     703              116
    ## 60           DeAndre' Bembry           38     371               47
    ## 61           Dennis Schroder           79    2485              548
    ## 62             Dwight Howard           74    2199              388
    ## 63            Ersan Ilyasova           26     633               93
    ## 64             Jose Calderon           17     247               23
    ## 65             Kent Bazemore           73    1963              295
    ## 66            Kris Humphries           56     689               87
    ## 67           Malcolm Delaney           73    1248              145
    ## 68             Mike Dunleavy           30     475               57
    ## 69              Mike Muscala           70    1237              170
    ## 70              Paul Millsap           69    2343              430
    ## 71                Ryan Kelly           16     110                8
    ## 72           Thabo Sefolosha           62    1596              174
    ## 73              Tim Hardaway           79    2154              415
    ## 74     Giannis Antetokounmpo           80    2845              656
    ## 75               Greg Monroe           81    1823              387
    ## 76             Jabari Parker           51    1728              399
    ## 77               Jason Terry           74    1365              105
    ## 78               John Henson           58    1123              159
    ## 79           Khris Middleton           29     889              150
    ## 80           Malcolm Brogdon           75    1982              290
    ## 81       Matthew Dellavedova           76    1986              208
    ## 82           Michael Beasley           56     935              216
    ## 83           Mirza Teletovic           70    1133              156
    ## 84             Rashad Vaughn           41     458               57
    ## 85             Spencer Hawes           19     171               30
    ## 86                Thon Maker           57     562               83
    ## 87                Tony Snell           80    2336              246
    ## 88              Aaron Brooks           65     894              121
    ## 89              Al Jefferson           66     931              235
    ## 90                C.J. Miles           76    1776              281
    ## 91             Georges Niang           23      93                9
    ## 92               Jeff Teague           82    2657              402
    ## 93                 Joe Young           33     135               26
    ## 94            Kevin Seraphin           49     559              109
    ## 95          Lance Stephenson            6     132               18
    ## 96               Lavoy Allen           61     871               77
    ## 97               Monta Ellis           74    1998              247
    ## 98              Myles Turner           81    2541              444
    ## 99               Paul George           75    2689              622
    ## 100         Rakeem Christmas           29     219               19
    ## 101           Thaddeus Young           74    2237              362
    ## 102           Anthony Morrow            9      87               12
    ## 103             Bobby Portis           64    1000              183
    ## 104            Cameron Payne           11     142               21
    ## 105        Cristiano Felicio           66    1040              128
    ## 106         Denzel Valentine           57     976              102
    ## 107              Dwyane Wade           60    1792              414
    ## 108            Isaiah Canaan           39     592               63
    ## 109             Jerian Grant           63    1028              128
    ## 110             Jimmy Butler           76    2809              570
    ## 111        Joffrey Lauvergne           20     241               37
    ## 112  Michael Carter-Williams           45     846              112
    ## 113           Nikola Mirotic           70    1679              258
    ## 114              Paul Zipser           44     843               88
    ## 115              Rajon Rondo           69    1843              229
    ## 116              Robin Lopez           81    2271              382
    ## 117             Dion Waiters           46    1384              281
    ## 118             Goran Dragic           73    2459              534
    ## 119         Hassan Whiteside           77    2513              542
    ## 120            James Johnson           76    2085              368
    ## 121           Josh McRoberts           22     381               44
    ## 122          Josh Richardson           53    1614              202
    ## 123          Justise Winslow           18     625               80
    ## 124             Luke Babbitt           68    1065              113
    ## 125              Okaro White           35     471               33
    ## 126          Rodney McGruder           78    1966              190
    ## 127            Tyler Johnson           73    2178              357
    ## 128            Udonis Haslem           17     130               11
    ## 129          Wayne Ellington           62    1500              231
    ## 130              Willie Reed           71    1031              162
    ## 131           Andre Drummond           81    2409              483
    ## 132              Aron Baynes           75    1163              143
    ## 133               Beno Udrih           39     560               92
    ## 134         Boban Marjanovic           35     293               72
    ## 135          Darrun Hilliard           39     381               47
    ## 136           Henry Ellenson           19     146               23
    ## 137                Ish Smith           81    1955              329
    ## 138                Jon Leuer           75    1944              310
    ## 139 Kentavious Caldwell-Pope           76    2529              370
    ## 140            Marcus Morris           79    2565              421
    ## 141          Michael Gbinije            9      32                1
    ## 142           Reggie Bullock           31     467               54
    ## 143           Reggie Jackson           52    1424              284
    ## 144          Stanley Johnson           77    1371              129
    ## 145            Tobias Harris           82    2567              511
    ## 146            Brian Roberts           41     416               46
    ## 147            Briante Weber           13     159               20
    ## 148           Christian Wood           13     107               12
    ## 149              Cody Zeller           62    1725              253
    ## 150           Frank Kaminsky           75    1954              320
    ## 151              Jeremy Lamb           62    1143              226
    ## 152          Johnny O'Bryant            4      34                8
    ## 153             Kemba Walker           79    2739              643
    ## 154          Marco Belinelli           74    1778              264
    ## 155          Marvin Williams           76    2295              297
    ## 156   Michael Kidd-Gilchrist           81    2349              295
    ## 157            Miles Plumlee           13     174               14
    ## 158            Nicolas Batum           77    2617              393
    ## 159           Ramon Sessions           50     811              100
    ## 160           Treveon Graham           27     189               19
    ## 161          Carmelo Anthony           74    2538              602
    ## 162           Chasson Randle           18     225               28
    ## 163             Courtney Lee           77    2459              321
    ## 164             Derrick Rose           64    2082              460
    ## 165              Joakim Noah           46    1015               99
    ## 166           Justin Holiday           82    1639              233
    ## 167       Kristaps Porzingis           66    2164              443
    ## 168             Kyle O'Quinn           79    1229              215
    ## 169             Lance Thomas           46     968               97
    ## 170         Marshall Plumlee           21     170               16
    ## 171            Maurice Ndour           32     331               39
    ## 172     Mindaugas Kuzminskas           68    1016              158
    ## 173                Ron Baker           52     857               82
    ## 174            Sasha Vujacic           42     408               42
    ## 175        Willy Hernangomez           72    1324              246
    ## 176             Aaron Gordon           80    2298              393
    ## 177          Bismack Biyombo           81    1793              179
    ## 178              C.J. Watson           62    1012               96
    ## 179            D.J. Augustin           78    1538              195
    ## 180             Damjan Rudez           45     314               31
    ## 181            Elfrid Payton           82    2412              430
    ## 182            Evan Fournier           68    2234              408
    ## 183               Jeff Green           69    1534              220
    ## 184              Jodie Meeks           36     738              103
    ## 185      Marcus Georges-Hunt            5      48                2
    ## 186            Mario Hezonja           65     960              117
    ## 187           Nikola Vucevic           75    2163              483
    ## 188          Patricio Garino            5      43                0
    ## 189        Stephen Zimmerman           19     108               10
    ## 190            Terrence Ross           24     748              115
    ## 191           Alex Poythress            6     157               25
    ## 192              Dario Saric           81    2129              381
    ## 193         Gerald Henderson           72    1667              234
    ## 194            Jahlil Okafor           50    1134              242
    ## 195           Jerryd Bayless            3      71               11
    ## 196              Joel Embiid           31     786              200
    ## 197          Justin Anderson           24     518               75
    ## 198             Nik Stauskas           80    2188              251
    ## 199           Richaun Holmes           57    1193              230
    ## 200         Robert Covington           67    2119              292
    ## 201         Sergio Rodriguez           68    1518              210
    ## 202               Shawn Long           18     234               61
    ## 203           T.J. McConnell           81    2133              236
    ## 204           Tiago Splitter            8      76               14
    ## 205  Timothe Luwawu-Cabarrot           69    1190              145
    ## 206         Andrew Nicholson           10     111               13
    ## 207           Archie Goodwin           12     184               34
    ## 208              Brook Lopez           75    2222              555
    ## 209             Caris LeVert           57    1237              171
    ## 210         Isaiah Whitehead           73    1643              204
    ## 211               Jeremy Lin           36     883              175
    ## 212               Joe Harris           52    1138              154
    ## 213          Justin Hamilton           64    1177              174
    ## 214           K.J. McDaniels           20     293               46
    ## 215               Quincy Acy           32     510               65
    ## 216               Randy Foye           69    1284              118
    ## 217  Rondae Hollis-Jefferson           78    1761              235
    ## 218          Sean Kilpatrick           70    1754              305
    ## 219        Spencer Dinwiddie           59    1334              134
    ## 220            Trevor Booker           71    1754              305
    ## 221           Andre Iguodala           76    1998              219
    ## 222             Damian Jones           10      85                8
    ## 223               David West           68     854              135
    ## 224           Draymond Green           76    2471              272
    ## 225                Ian Clark           77    1137              211
    ## 226     James Michael McAdoo           52     457               62
    ## 227             JaVale McGee           77     739              208
    ## 228             Kevin Durant           62    2070              551
    ## 229             Kevon Looney           53     447               56
    ## 230            Klay Thompson           78    2649              644
    ## 231              Matt Barnes           20     410               38
    ## 232            Patrick McCaw           71    1074              106
    ## 233         Shaun Livingston           76    1345              173
    ## 234            Stephen Curry           79    2638              675
    ## 235            Zaza Pachulia           70    1268              164
    ## 236              Bryn Forbes           36     285               36
    ## 237              Danny Green           68    1807              176
    ## 238                David Lee           79    1477              248
    ## 239            Davis Bertans           67     808              103
    ## 240          Dejounte Murray           38     322               50
    ## 241           Dewayne Dedmon           76    1330              161
    ## 242             Joel Anthony           19     122               10
    ## 243         Jonathon Simmons           78    1392              177
    ## 244            Kawhi Leonard           74    2474              636
    ## 245            Kyle Anderson           72    1020               93
    ## 246        LaMarcus Aldridge           72    2335              500
    ## 247            Manu Ginobili           69    1291              171
    ## 248              Patty Mills           80    1754              273
    ## 249                Pau Gasol           64    1627              303
    ## 250              Tony Parker           63    1587              265
    ## 251              Bobby Brown           25     123               23
    ## 252           Chinanu Onuaku            5      52                5
    ## 253             Clint Capela           65    1551              362
    ## 254              Eric Gordon           75    2323              412
    ## 255            Isaiah Taylor            4      52                1
    ## 256             James Harden           81    2947              674
    ## 257             Kyle Wiltjer           14      44                4
    ## 258             Lou Williams           23     591              102
    ## 259         Montrezl Harrell           58    1064              225
    ## 260         Patrick Beverley           67    2058              228
    ## 261            Ryan Anderson           72    2116              323
    ## 262               Sam Dekker           77    1419              203
    ## 263             Trevor Ariza           80    2773              326
    ## 264            Troy Williams            6     139               22
    ## 265            Alan Anderson           30     308               30
    ## 266            Austin Rivers           74    2054              323
    ## 267            Blake Griffin           61    2076              479
    ## 268             Brandon Bass           52     577              107
    ## 269            Brice Johnson            3       9                2
    ## 270               Chris Paul           61    1921              374
    ## 271           DeAndre Jordan           81    2570              412
    ## 272            Diamond Stone            7      24                3
    ## 273              J.J. Redick           78    2198              396
    ## 274           Jamal Crawford           82    2157              359
    ## 275         Luc Mbah a Moute           80    1787              191
    ## 276        Marreese Speights           82    1286              244
    ## 277              Paul Pierce           25     277               28
    ## 278           Raymond Felton           80    1700              221
    ## 279           Wesley Johnson           68     810               73
    ## 280               Alec Burks           42     653               99
    ## 281               Boris Diaw           73    1283              146
    ## 282               Dante Exum           66    1228              155
    ## 283           Derrick Favors           50    1186              203
    ## 284              George Hill           49    1544              289
    ## 285           Gordon Hayward           73    2516              545
    ## 286              Jeff Withey           51     432               55
    ## 287               Joe Ingles           82    1972              204
    ## 288              Joe Johnson           78    1843              273
    ## 289            Joel Bolomboy           12      53                9
    ## 290                Raul Neto           40     346               41
    ## 291              Rodney Hood           59    1593              272
    ## 292              Rudy Gobert           81    2744              413
    ## 293             Shelvin Mack           55    1205              170
    ## 294               Trey Lyles           71    1158              159
    ## 295             Alex Abrines           68    1055              134
    ## 296           Andre Roberson           79    2376              215
    ## 297         Domantas Sabonis           81    1632              192
    ## 298           Doug McDermott           22     430               56
    ## 299              Enes Kanter           72    1533              402
    ## 300             Jerami Grant           78    1490              146
    ## 301             Josh Huestis            2      31                6
    ## 302             Kyle Singler           32     385               34
    ## 303            Nick Collison           20     128               14
    ## 304              Norris Cole           13     125               16
    ## 305        Russell Westbrook           81    2802              824
    ## 306           Semaj Christon           64     973               77
    ## 307             Steven Adams           80    2389              374
    ## 308               Taj Gibson           23     487               89
    ## 309           Victor Oladipo           67    2222              412
    ## 310          Andrew Harrison           72    1474              117
    ## 311           Brandan Wright           28     447               83
    ## 312         Chandler Parsons           34     675               75
    ## 313            Deyonta Davis           36     238               24
    ## 314              James Ennis           64    1501              146
    ## 315           JaMychal Green           77    2101              250
    ## 316            Jarell Martin           42     558               58
    ## 317               Marc Gasol           74    2531              532
    ## 318              Mike Conley           69    2292              464
    ## 319               Tony Allen           71    1914              274
    ## 320             Troy Daniels           67    1183              185
    ## 321             Vince Carter           73    1799              193
    ## 322             Wade Baldwin           33     405               36
    ## 323             Wayne Selden           11     189               20
    ## 324            Zach Randolph           73    1786              433
    ## 325          Al-Farouq Aminu           61    1773              183
    ## 326             Allen Crabbe           79    2254              303
    ## 327            C.J. McCollum           80    2796              692
    ## 328           Damian Lillard           75    2694              661
    ## 329                 Ed Davis           46     789               75
    ## 330              Evan Turner           65    1658              235
    ## 331              Jake Layman           35     249               26
    ## 332             Jusuf Nurkic           20     584              120
    ## 333         Maurice Harkless           77    2223              314
    ## 334           Meyers Leonard           74    1222              146
    ## 335              Noah Vonleh           74    1265              130
    ## 336          Pat Connaughton           39     316               37
    ## 337           Shabazz Napier           53     512               73
    ## 338           Tim Quarterman           16      80               13
    ## 339         Danilo Gallinari           63    2134              335
    ## 340           Darrell Arthur           41     639               95
    ## 341          Emmanuel Mudiay           55    1406              208
    ## 342              Gary Harris           57    1782              320
    ## 343             Jamal Murray           82    1764              295
    ## 344            Jameer Nelson           75    2045              268
    ## 345         Juan Hernangomez           62     842              101
    ## 346           Kenneth Faried           61    1296              228
    ## 347            Malik Beasley           22     165               33
    ## 348            Mason Plumlee           27     632               99
    ## 349              Mike Miller           20     151                9
    ## 350             Nikola Jokic           73    2038              494
    ## 351              Roy Hibbert            6      11                2
    ## 352              Will Barton           60    1705              295
    ## 353          Wilson Chandler           71    2197              433
    ## 354            Alexis Ajinca           39     584               89
    ## 355            Anthony Davis           75    2708              770
    ## 356             Axel Toupane            2      41                5
    ## 357            Cheick Diallo           17     199               36
    ## 358         Dante Cunningham           66    1649              174
    ## 359         DeMarcus Cousins           17     574              142
    ## 360       Donatas Motiejunas           34     479               57
    ## 361            E'Twaun Moore           73    1820              283
    ## 362          Jordan Crawford           19     442              105
    ## 363             Jrue Holiday           67    2190              405
    ## 364                Omer Asik           31     482               31
    ## 365               Quinn Cook            9     111               22
    ## 366             Solomon Hill           80    2374              183
    ## 367              Tim Frazier           65    1525              163
    ## 368             A.J. Hammons           22     163               17
    ## 369          DeAndre Liggins            1      25                3
    ## 370             Devin Harris           65    1087              136
    ## 371            Dirk Nowitzki           54    1424              296
    ## 372      Dorian Finney-Smith           81    1642              124
    ## 373            Dwight Powell           77    1333              194
    ## 374          Harrison Barnes           79    2803              599
    ## 375               J.J. Barea           35     771              142
    ## 376            Jarrod Uthoff            9     115               16
    ## 377             Nerlens Noel           22     483               77
    ## 378         Nicolas Brussino           54     521               52
    ## 379              Salah Mejri           73     905               88
    ## 380               Seth Curry           70    2029              338
    ## 381          Wesley Matthews           73    2495              333
    ## 382             Yogi Ferrell           36    1046              142
    ## 383         Anthony Tolliver           65    1477              155
    ## 384            Arron Afflalo           61    1580              185
    ## 385             Ben McLemore           61    1176              180
    ## 386              Buddy Hield           25     727              142
    ## 387          Darren Collison           68    2063              340
    ## 388           Garrett Temple           65    1728              183
    ## 389     Georgios Papagiannis           22     355               56
    ## 390             Kosta Koufos           71    1419              216
    ## 391        Langston Galloway           19     375               42
    ## 392       Malachi Richardson           22     198               28
    ## 393                 Rudy Gay           30    1013              201
    ## 394          Skal Labissiere           33     612              117
    ## 395                Ty Lawson           69    1732              237
    ## 396             Tyreke Evans           14     314               59
    ## 397      Willie Cauley-Stein           75    1421              255
    ## 398            Adreian Payne           18     135               23
    ## 399           Andrew Wiggins           82    3048              709
    ## 400             Brandon Rush           47    1030               70
    ## 401             Cole Aldrich           62     531               45
    ## 402             Gorgui Dieng           82    2653              332
    ## 403              Jordan Hill            7      47                5
    ## 404       Karl-Anthony Towns           82    3030              802
    ## 405                Kris Dunn           78    1333              118
    ## 406          Nemanja Bjelica           65    1190              151
    ## 407              Omri Casspi           13     222               19
    ## 408              Ricky Rubio           75    2469              261
    ## 409         Shabazz Muhammad           78    1516              288
    ## 410               Tyus Jones           60     774               75
    ## 411              Zach LaVine           47    1749              326
    ## 412           Brandon Ingram           79    2279              276
    ## 413             Corey Brewer           24     358               53
    ## 414         D'Angelo Russell           63    1811              351
    ## 415              David Nwaba           20     397               47
    ## 416              Ivica Zubac           38     609              126
    ## 417          Jordan Clarkson           82    2397              477
    ## 418            Julius Randle           74    2132              377
    ## 419          Larry Nance Jr.           63    1442              190
    ## 420                Luol Deng           56    1486              164
    ## 421        Metta World Peace           25     160               19
    ## 422               Nick Young           60    1556              272
    ## 423              Tarik Black           67    1091              150
    ## 424          Thomas Robinson           48     560              105
    ## 425           Timofey Mozgov           54    1104              169
    ## 426              Tyler Ennis           22     392               65
    ## 427            Alan Williams           47     708              138
    ## 428                 Alex Len           77    1560              230
    ## 429           Brandon Knight           54    1140              209
    ## 430            Derrick Jones           32     545               68
    ## 431             Devin Booker           78    2730              606
    ## 432            Dragan Bender           43     574               57
    ## 433           Elijah Millsap            2      23                1
    ## 434             Eric Bledsoe           66    2176              449
    ## 435             Jared Dudley           64    1362              157
    ## 436          Leandro Barbosa           67     963              172
    ## 437          Marquese Chriss           82    1743              284
    ## 438             Ronnie Price           14     134                4
    ## 439              T.J. Warren           66    2048              403
    ## 440               Tyler Ulis           61    1123              184
    ## 441           Tyson Chandler           47    1298              153
    ##     field_goals_atts field_goals_perc points3_made points3_atts
    ## 1                801            0.473           86          242
    ## 2                370            0.576           27           66
    ## 3                775            0.463          108          277
    ## 4                  4            0.750            1            1
    ## 5                232            0.409           39          111
    ## 6               1473            0.463          245          646
    ## 7                720            0.463          157          394
    ## 8                 58            0.431           12           35
    ## 9                423            0.454           46          135
    ## 10               262            0.435           45          130
    ## 11                34            0.441            0            1
    ## 12               508            0.512           68          192
    ## 13               749            0.359           94          332
    ## 14               411            0.367           57          179
    ## 15               158            0.494            0            1
    ## 16               520            0.458          137          335
    ## 17                 8            0.375            0            2
    ## 18               147            0.463           22           53
    ## 19               107            0.505           21           52
    ## 20                 4            0.750            0            0
    ## 21               489            0.411           94          261
    ## 22               356            0.346           95          271
    ## 23                92            0.478           31           66
    ## 24               158            0.392            7           22
    ## 25               867            0.427          145          389
    ## 26               269            0.487           97          200
    ## 27              1420            0.473          177          441
    ## 28              1344            0.548          124          342
    ## 29               343            0.446           62          186
    ## 30               437            0.600            0            3
    ## 31                16            0.375            2            6
    ## 32               661            0.452           48          135
    ## 33               116            0.422           10           30
    ## 34              1545            0.467           33          124
    ## 35               549            0.401          109          320
    ## 36               111            0.351           11           29
    ## 37               115            0.583            0            0
    ## 38               702            0.557            1            2
    ## 39               918            0.464          193          468
    ## 40               156            0.660            3           12
    ## 41               506            0.449           56          173
    ## 42               128            0.406           24           60
    ## 43               205            0.502            1            7
    ## 44               384            0.401           94          253
    ## 45               279            0.459           41          103
    ## 46               234            0.457           45          115
    ## 47              1322            0.482          223          552
    ## 48               106            0.274           11           52
    ## 49                 1            0.000            0            1
    ## 50                27            0.444            0            0
    ## 51               111            0.586            0            0
    ## 52               329            0.529           37           78
    ## 53              1435            0.451           89          272
    ## 54               674            0.579            0            2
    ## 55               889            0.457           71          196
    ## 56               803            0.516          148          341
    ## 57                75            0.400            7           30
    ## 58               146            0.418            9           37
    ## 59               255            0.455           31           70
    ## 60                98            0.480            1           18
    ## 61              1215            0.451          100          294
    ## 62               613            0.633            0            2
    ## 63               226            0.412           32           92
    ## 64                57            0.404            8           30
    ## 65               721            0.409           92          266
    ## 66               214            0.407           19           54
    ## 67               388            0.374           26          110
    ## 68               130            0.438           33           77
    ## 69               337            0.504           46          110
    ## 70               972            0.442           75          241
    ## 71                28            0.286            4           10
    ## 72               395            0.441           41          120
    ## 73               912            0.455          149          417
    ## 74              1259            0.521           49          180
    ## 75               726            0.533            0            4
    ## 76               814            0.490           65          178
    ## 77               243            0.432           73          171
    ## 78               309            0.515            0            1
    ## 79               333            0.450           45          104
    ## 80               635            0.457           78          193
    ## 81               534            0.390           79          215
    ## 82               406            0.532           18           43
    ## 83               418            0.373          104          305
    ## 84               156            0.365           26           81
    ## 85                59            0.508            9           26
    ## 86               181            0.459           28           74
    ## 87               541            0.455          144          355
    ## 88               300            0.403           48          128
    ## 89               471            0.499            0            1
    ## 90               647            0.434          169          409
    ## 91                36            0.250            1           12
    ## 92               909            0.442           90          252
    ## 93                72            0.361            5           23
    ## 94               198            0.551            0            2
    ## 95                44            0.409            5            8
    ## 96               168            0.458            0            1
    ## 97               557            0.443           43          135
    ## 98               869            0.511           40          115
    ## 99              1349            0.461          195          496
    ## 100               43            0.442            0            0
    ## 101              687            0.527           45          118
    ## 102               29            0.414            6           14
    ## 103              375            0.488           32           96
    ## 104               63            0.333           11           34
    ## 105              222            0.577            0            0
    ## 106              288            0.354           73          208
    ## 107              955            0.434           45          145
    ## 108              173            0.364           25           94
    ## 109              301            0.425           49          134
    ## 110             1252            0.455           91          248
    ## 111               92            0.402            6           20
    ## 112              306            0.366           15           64
    ## 113              625            0.413          129          377
    ## 114              221            0.398           33           99
    ## 115              561            0.408           50          133
    ## 116              775            0.493            0            2
    ## 117              663            0.424           85          215
    ## 118             1124            0.475          117          289
    ## 119              973            0.557            0            0
    ## 120              769            0.479           87          256
    ## 121              118            0.373           13           31
    ## 122              513            0.394           75          227
    ## 123              225            0.356            7           35
    ## 124              281            0.402           87          210
    ## 125               87            0.379           12           34
    ## 126              460            0.413           73          220
    ## 127              824            0.433           93          250
    ## 128               23            0.478            0            3
    ## 129              555            0.416          149          394
    ## 130              285            0.568            1            4
    ## 131              911            0.530            2            7
    ## 132              279            0.513            0            0
    ## 133              197            0.467           11           32
    ## 134              132            0.545            0            0
    ## 135              126            0.373           12           46
    ## 136               64            0.359           10           35
    ## 137              749            0.439           28          105
    ## 138              646            0.480           49          167
    ## 139              928            0.399          153          437
    ## 140             1007            0.418          118          357
    ## 141               10            0.100            0            4
    ## 142              128            0.422           28           73
    ## 143              677            0.419           66          184
    ## 144              365            0.353           45          154
    ## 145             1063            0.481          109          314
    ## 146              122            0.377           17           44
    ## 147               46            0.435            1            7
    ## 148               23            0.522            0            5
    ## 149              443            0.571            0            1
    ## 150              802            0.399          116          354
    ## 151              491            0.460           41          146
    ## 152               15            0.533            1            3
    ## 153             1449            0.444          240          602
    ## 154              615            0.429          102          283
    ## 155              704            0.422          124          354
    ## 156              618            0.477            1            9
    ## 157               24            0.583            0            0
    ## 158              975            0.403          135          405
    ## 159              263            0.380           21           62
    ## 160               40            0.475            9           15
    ## 161             1389            0.433          151          421
    ## 162               72            0.389           10           32
    ## 163              704            0.456          108          269
    ## 164              977            0.471           13           60
    ## 165              201            0.493            0            1
    ## 166              538            0.433           97          273
    ## 167              985            0.450          112          314
    ## 168              413            0.521            2           17
    ## 169              244            0.398           38           85
    ## 170               30            0.533            0            0
    ## 171               86            0.453            1            7
    ## 172              369            0.428           54          168
    ## 173              217            0.378           23           86
    ## 174              136            0.309           23           74
    ## 175              465            0.529            4           15
    ## 176              865            0.454           77          267
    ## 177              339            0.528            0            0
    ## 178              248            0.387           32          105
    ## 179              517            0.377           95          274
    ## 180               88            0.352           20           64
    ## 181              912            0.471           40          146
    ## 182              930            0.439          128          360
    ## 183              558            0.394           53          193
    ## 184              256            0.402           56          137
    ## 185                7            0.286            1            2
    ## 186              330            0.355           43          144
    ## 187             1031            0.468           23           75
    ## 188                7            0.000            0            5
    ## 189               31            0.323            0            0
    ## 190              267            0.431           46          135
    ## 191               54            0.463            6           19
    ## 192              927            0.411          106          341
    ## 193              553            0.423           61          173
    ## 194              471            0.514            0            0
    ## 195               32            0.344            2            5
    ## 196              429            0.466           36           98
    ## 197              162            0.463           21           72
    ## 198              634            0.396          132          359
    ## 199              412            0.558           27           77
    ## 200              732            0.399          137          412
    ## 201              536            0.392           92          252
    ## 202              109            0.560            7           19
    ## 203              512            0.461           11           55
    ## 204               31            0.452            2            6
    ## 205              361            0.402           50          161
    ## 206               34            0.382            2           11
    ## 207               61            0.557            4           13
    ## 208             1172            0.474          134          387
    ## 209              380            0.450           59          184
    ## 210              508            0.402           44          149
    ## 211              400            0.438           58          156
    ## 212              362            0.425           85          221
    ## 213              379            0.459           55          181
    ## 214              101            0.455           11           39
    ## 215              153            0.425           36           83
    ## 216              325            0.363           67          203
    ## 217              542            0.434           15           67
    ## 218              735            0.415          105          308
    ## 219              302            0.444           38          101
    ## 220              591            0.516           25           78
    ## 221              415            0.528           64          177
    ## 222               16            0.500            0            0
    ## 223              252            0.536            3            8
    ## 224              650            0.418           81          263
    ## 225              433            0.487           61          163
    ## 226              117            0.530            2            8
    ## 227              319            0.652            0            4
    ## 228             1026            0.537          117          312
    ## 229              107            0.523            2            9
    ## 230             1376            0.468          268          647
    ## 231               90            0.422           18           52
    ## 232              245            0.433           41          123
    ## 233              316            0.547            1            3
    ## 234             1443            0.468          324          789
    ## 235              307            0.534            0            2
    ## 236               99            0.364           17           53
    ## 237              449            0.392          118          311
    ## 238              420            0.590            0            0
    ## 239              234            0.440           69          173
    ## 240              116            0.431            9           23
    ## 241              259            0.622            0            0
    ## 242               16            0.625            0            0
    ## 243              421            0.420           30          102
    ## 244             1311            0.485          147          386
    ## 245              209            0.445           15           40
    ## 246             1049            0.477           23           56
    ## 247              439            0.390           89          227
    ## 248              622            0.439          147          356
    ## 249              604            0.502           56          104
    ## 250              569            0.466           23           69
    ## 251               60            0.383           14           35
    ## 252                7            0.714            0            0
    ## 253              563            0.643            0            0
    ## 254             1016            0.406          246          661
    ## 255                7            0.143            0            2
    ## 256             1533            0.440          262          756
    ## 257               14            0.286            4           13
    ## 258              264            0.386           41          129
    ## 259              345            0.652            1            7
    ## 260              543            0.420          110          288
    ## 261              773            0.418          204          506
    ## 262              429            0.473           60          187
    ## 263              798            0.409          191          555
    ## 264               44            0.500            8           21
    ## 265               80            0.375           14           44
    ## 266              731            0.442          111          299
    ## 267              971            0.493           38          113
    ## 268              186            0.575            1            3
    ## 269                7            0.286            0            0
    ## 270              785            0.476          124          302
    ## 271              577            0.714            0            2
    ## 272               13            0.231            0            0
    ## 273              890            0.445          201          468
    ## 274              869            0.413          116          322
    ## 275              378            0.505           43          110
    ## 276              548            0.445          103          277
    ## 277               70            0.400           15           43
    ## 278              514            0.430           46          144
    ## 279              200            0.365           29          118
    ## 280              248            0.399           25           76
    ## 281              327            0.446           20           81
    ## 282              364            0.426           44          149
    ## 283              417            0.487            3           10
    ## 284              606            0.477           94          233
    ## 285             1156            0.471          149          374
    ## 286              103            0.534            0            1
    ## 287              451            0.452          123          279
    ## 288              626            0.436          106          258
    ## 289               16            0.563            1            4
    ## 290               91            0.451           10           31
    ## 291              666            0.408          114          306
    ## 292              623            0.663            0            1
    ## 293              381            0.446           37          120
    ## 294              439            0.362           65          204
    ## 295              341            0.393           94          247
    ## 296              463            0.464           45          184
    ## 297              481            0.399           51          159
    ## 298              124            0.452           21           58
    ## 299              737            0.545            5           38
    ## 300              311            0.469           43          114
    ## 301               11            0.545            2            4
    ## 302               83            0.410            7           37
    ## 303               23            0.609            0            1
    ## 304               52            0.308            3           13
    ## 305             1941            0.425          200          583
    ## 306              223            0.345           12           63
    ## 307              655            0.571            0            1
    ## 308              179            0.497            1            1
    ## 309              932            0.442          127          352
    ## 310              360            0.325           43          156
    ## 311              135            0.615            0            1
    ## 312              222            0.338           25           93
    ## 313               47            0.511            0            0
    ## 314              321            0.455           51          137
    ## 315              500            0.500           55          145
    ## 316              151            0.384            9           25
    ## 317             1160            0.459          104          268
    ## 318             1009            0.460          171          419
    ## 319              595            0.461           15           54
    ## 320              495            0.374          138          355
    ## 321              490            0.394          112          296
    ## 322              115            0.313            3           22
    ## 323               50            0.400            3           21
    ## 324              964            0.449           21           94
    ## 325              466            0.393           70          212
    ## 326              647            0.468          134          302
    ## 327             1441            0.480          185          440
    ## 328             1488            0.444          214          578
    ## 329              142            0.528            0            0
    ## 330              552            0.426           31          118
    ## 331               89            0.292           13           51
    ## 332              236            0.508            0            1
    ## 333              624            0.503           68          194
    ## 334              378            0.386           74          213
    ## 335              270            0.481            7           20
    ## 336               72            0.514           17           33
    ## 337              183            0.399           34           92
    ## 338               29            0.448            5           13
    ## 339              750            0.447          126          325
    ## 340              215            0.442           53          117
    ## 341              551            0.377           56          177
    ## 342              636            0.503          107          255
    ## 343              729            0.405          115          344
    ## 344              604            0.444          106          273
    ## 345              223            0.453           46          112
    ## 346              415            0.549            0            6
    ## 347               73            0.452            9           28
    ## 348              181            0.547            0            1
    ## 349               23            0.391            8           20
    ## 350              856            0.577           45          139
    ## 351                3            0.667            0            0
    ## 352              667            0.442           87          235
    ## 353              940            0.461          110          326
    ## 354              178            0.500            0            4
    ## 355             1527            0.504           40          134
    ## 356                8            0.625            1            3
    ## 357               76            0.474            0            0
    ## 358              359            0.485           71          181
    ## 359              314            0.452           36           96
    ## 360              138            0.413           11           47
    ## 361              619            0.457           77          208
    ## 362              218            0.482           37           95
    ## 363              894            0.453          100          281
    ## 364               65            0.477            0            0
    ## 365               41            0.537            6           12
    ## 366              477            0.384           94          270
    ## 367              404            0.403           40          128
    ## 368               42            0.405            5           10
    ## 369                6            0.500            0            1
    ## 370              341            0.399           58          177
    ## 371              678            0.437           79          209
    ## 372              333            0.372           56          191
    ## 373              377            0.515           21           74
    ## 374             1280            0.468           78          222
    ## 375              343            0.414           53          148
    ## 376               38            0.421            3            9
    ## 377              134            0.575            0            0
    ## 378              141            0.369           29           95
    ## 379              137            0.642            1            3
    ## 380              703            0.481          137          322
    ## 381              847            0.393          174          479
    ## 382              345            0.412           60          149
    ## 383              351            0.442           90          230
    ## 384              420            0.440           62          151
    ## 385              419            0.430           65          170
    ## 386              296            0.480           59          138
    ## 387              714            0.476           73          175
    ## 388              432            0.424           82          220
    ## 389              102            0.549            0            2
    ## 390              392            0.551            0            1
    ## 391              104            0.404           19           40
    ## 392               68            0.412            8           28
    ## 393              442            0.455           42          113
    ## 394              218            0.537            3            8
    ## 395              522            0.454           34          118
    ## 396              143            0.413           21           48
    ## 397              481            0.530            0            2
    ## 398               54            0.426            3           15
    ## 399             1570            0.452          103          289
    ## 400              187            0.374           44          114
    ## 401               86            0.523            0            0
    ## 402              661            0.502           16           43
    ## 403               13            0.385            0            0
    ## 404             1479            0.542          101          275
    ## 405              313            0.377           21           73
    ## 406              356            0.424           56          177
    ## 407               39            0.487            2           10
    ## 408              650            0.402           60          196
    ## 409              598            0.482           49          146
    ## 410              181            0.414           26           73
    ## 411              710            0.459          120          310
    ## 412              686            0.402           55          187
    ## 413              121            0.438            5           24
    ## 414              867            0.405          135          384
    ## 415               81            0.580            1            5
    ## 416              238            0.529            0            3
    ## 417             1071            0.445          117          356
    ## 418              773            0.488           17           63
    ## 419              361            0.526           10           36
    ## 420              424            0.387           51          165
    ## 421               68            0.279            9           38
    ## 422              633            0.430          170          421
    ## 423              294            0.510            1            2
    ## 424              196            0.536            0            1
    ## 425              328            0.515            0            1
    ## 426              144            0.451           21           54
    ## 427              267            0.517            0            1
    ## 428              463            0.497            3           12
    ## 429              525            0.398           45          139
    ## 430              121            0.562            3           11
    ## 431             1431            0.423          147          405
    ## 432              161            0.354           28          101
    ## 433                7            0.143            0            2
    ## 434             1034            0.434          104          310
    ## 435              346            0.454           77          203
    ## 436              392            0.439           35           98
    ## 437              632            0.449           72          224
    ## 438               24            0.167            3           17
    ## 439              814            0.495           26           98
    ## 440              437            0.421           21           79
    ## 441              228            0.671            0            0
    ##     points3_perc points2_made points2_atts points2_perc points1_made
    ## 1          0.355          293          559        0.524          108
    ## 2          0.409          186          304        0.612           67
    ## 3          0.390          251          498        0.504           68
    ## 4          1.000            2            3        0.667            3
    ## 5          0.351           56          121        0.463           33
    ## 6          0.379          437          827        0.528          590
    ## 7          0.398          176          326        0.540          176
    ## 8          0.343           13           23        0.565            6
    ## 9          0.341          146          288        0.507           85
    ## 10         0.346           69          132        0.523           26
    ## 11         0.000           15           33        0.455            8
    ## 12         0.354          192          316        0.608           90
    ## 13         0.283          175          417        0.420          203
    ## 14         0.318           94          232        0.405           51
    ## 15         0.000           78          157        0.497           22
    ## 16         0.409          101          185        0.546           63
    ## 17         0.000            3            6        0.500            3
    ## 18         0.415           46           94        0.489           21
    ## 19         0.404           33           55        0.600           27
    ## 20            NA            3            4        0.750            0
    ## 21         0.360          107          228        0.469           71
    ## 22         0.351           28           85        0.329           10
    ## 23         0.470           13           26        0.500           13
    ## 24         0.318           55          136        0.404           35
    ## 25         0.373          225          478        0.471          257
    ## 26         0.485           34           69        0.493           14
    ## 27         0.401          494          979        0.505          297
    ## 28         0.363          612         1002        0.611          358
    ## 29         0.333           91          157        0.580           80
    ## 30         0.000          262          434        0.604          106
    ## 31         0.333            4           10        0.400            0
    ## 32         0.356          251          526        0.477           94
    ## 33         0.333           39           86        0.453           42
    ## 34         0.266          688         1421        0.484          545
    ## 35         0.341          111          229        0.485           89
    ## 36         0.379           28           82        0.341           18
    ## 37            NA           67          115        0.583           31
    ## 38         0.500          390          700        0.557          176
    ## 39         0.412          233          450        0.518          299
    ## 40         0.250          100          144        0.694           44
    ## 41         0.324          171          333        0.514          126
    ## 42         0.400           28           68        0.412           11
    ## 43         0.143          102          198        0.515           22
    ## 44         0.372           60          131        0.458           43
    ## 45         0.398           87          176        0.494           30
    ## 46         0.391           62          119        0.521           71
    ## 47         0.404          414          770        0.538          282
    ## 48         0.212           18           54        0.333           12
    ## 49         0.000            0            0           NA            1
    ## 50            NA           12           27        0.444            0
    ## 51            NA           65          111        0.586           43
    ## 52         0.474          137          251        0.546           35
    ## 53         0.327          558         1163        0.480          422
    ## 54         0.000          390          672        0.580          103
    ## 55         0.362          335          693        0.483          180
    ## 56         0.434          266          462        0.576           99
    ## 57         0.233           23           45        0.511           23
    ## 58         0.243           52          109        0.477           23
    ## 59         0.443           85          185        0.459           22
    ## 60         0.056           46           80        0.575            6
    ## 61         0.340          448          921        0.486          218
    ## 62         0.000          388          611        0.635          226
    ## 63         0.348           61          134        0.455           52
    ## 64         0.267           15           27        0.556            7
    ## 65         0.346          203          455        0.446          119
    ## 66         0.352           68          160        0.425           64
    ## 67         0.236          119          278        0.428           75
    ## 68         0.429           24           53        0.453           22
    ## 69         0.418          124          227        0.546           49
    ## 70         0.311          355          731        0.486          311
    ## 71         0.400            4           18        0.222            5
    ## 72         0.342          133          275        0.484           55
    ## 73         0.357          266          495        0.537          164
    ## 74         0.272          607         1079        0.563          471
    ## 75         0.000          387          722        0.536          177
    ## 76         0.365          334          636        0.525          162
    ## 77         0.427           32           72        0.444           24
    ## 78         0.000          159          308        0.516           74
    ## 79         0.433          105          229        0.459           81
    ## 80         0.404          212          442        0.480          109
    ## 81         0.367          129          319        0.404           82
    ## 82         0.419          198          363        0.545           78
    ## 83         0.341           52          113        0.460           35
    ## 84         0.321           31           75        0.413            2
    ## 85         0.346           21           33        0.636           14
    ## 86         0.378           55          107        0.514           32
    ## 87         0.406          102          186        0.548           47
    ## 88         0.375           73          172        0.424           32
    ## 89         0.000          235          470        0.500           65
    ## 90         0.413          112          238        0.471           84
    ## 91         0.083            8           24        0.333            2
    ## 92         0.357          312          657        0.475          360
    ## 93         0.217           21           49        0.429           11
    ## 94         0.000          109          196        0.556           14
    ## 95         0.625           13           36        0.361            2
    ## 96         0.000           77          167        0.461           23
    ## 97         0.319          204          422        0.483           93
    ## 98         0.348          404          754        0.536          245
    ## 99         0.393          427          853        0.501          336
    ## 100           NA           19           43        0.442           21
    ## 101        0.381          317          569        0.557           45
    ## 102        0.429            6           15        0.400           11
    ## 103        0.333          151          279        0.541           39
    ## 104        0.324           10           29        0.345            1
    ## 105           NA          128          222        0.577           60
    ## 106        0.351           29           80        0.363           14
    ## 107        0.310          369          810        0.456          223
    ## 108        0.266           38           79        0.481           30
    ## 109        0.366           79          167        0.473           65
    ## 110        0.367          479         1004        0.477          585
    ## 111        0.300           31           72        0.431            9
    ## 112        0.234           97          242        0.401           58
    ## 113        0.342          129          248        0.520           99
    ## 114        0.333           55          122        0.451           31
    ## 115        0.376          179          428        0.418           30
    ## 116        0.000          382          773        0.494           75
    ## 117        0.395          196          448        0.438           82
    ## 118        0.405          417          835        0.499          298
    ## 119           NA          542          973        0.557          225
    ## 120        0.340          281          513        0.548          152
    ## 121        0.419           31           87        0.356            6
    ## 122        0.330          127          286        0.444           60
    ## 123        0.200           73          190        0.384           29
    ## 124        0.414           26           71        0.366           11
    ## 125        0.353           21           53        0.396           20
    ## 126        0.332          117          240        0.488           44
    ## 127        0.372          264          574        0.460          195
    ## 128        0.000           11           20        0.550            9
    ## 129        0.378           82          161        0.509           37
    ## 130        0.250          161          281        0.573           49
    ## 131        0.286          481          904        0.532          137
    ## 132           NA          143          279        0.513           79
    ## 133        0.344           81          165        0.491           32
    ## 134           NA           72          132        0.545           47
    ## 135        0.261           35           80        0.438           21
    ## 136        0.286           13           29        0.448            4
    ## 137        0.267          301          644        0.467           72
    ## 138        0.293          261          479        0.545           98
    ## 139        0.350          217          491        0.442          154
    ## 140        0.331          303          650        0.466          145
    ## 141        0.000            1            6        0.167            2
    ## 142        0.384           26           55        0.473            5
    ## 143        0.359          218          493        0.442          118
    ## 144        0.292           84          211        0.398           36
    ## 145        0.347          402          749        0.537          190
    ## 146        0.386           29           78        0.372           33
    ## 147        0.143           19           39        0.487            9
    ## 148        0.000           12           18        0.667           11
    ## 149        0.000          253          442        0.572          133
    ## 150        0.328          204          448        0.455          118
    ## 151        0.281          185          345        0.536          110
    ## 152        0.333            7           12        0.583            1
    ## 153        0.399          403          847        0.476          304
    ## 154        0.360          162          332        0.488          150
    ## 155        0.350          173          350        0.494          131
    ## 156        0.111          294          609        0.483          152
    ## 157           NA           14           24        0.583            3
    ## 158        0.333          258          570        0.453          243
    ## 159        0.339           79          201        0.393           91
    ## 160        0.600           10           25        0.400           10
    ## 161        0.359          451          968        0.466          304
    ## 162        0.313           18           40        0.450           29
    ## 163        0.401          213          435        0.490           85
    ## 164        0.217          447          917        0.487          221
    ## 165        0.000           99          200        0.495           34
    ## 166        0.355          136          265        0.513           66
    ## 167        0.357          331          671        0.493          198
    ## 168        0.118          213          396        0.538           64
    ## 169        0.447           59          159        0.371           43
    ## 170           NA           16           30        0.533            8
    ## 171        0.143           38           79        0.481           19
    ## 172        0.321          104          201        0.517           55
    ## 173        0.267           59          131        0.450           28
    ## 174        0.311           19           62        0.306           17
    ## 175        0.267          242          450        0.538           91
    ## 176        0.288          316          598        0.528          156
    ## 177           NA          179          339        0.528          125
    ## 178        0.305           64          143        0.448           57
    ## 179        0.347          100          243        0.412          131
    ## 180        0.313           11           24        0.458            0
    ## 181        0.274          390          766        0.509          146
    ## 182        0.356          280          570        0.491          223
    ## 183        0.275          167          365        0.458          145
    ## 184        0.409           47          119        0.395           65
    ## 185        0.500            1            5        0.200            9
    ## 186        0.299           74          186        0.398           40
    ## 187        0.307          460          956        0.481          107
    ## 188        0.000            0            2        0.000            0
    ## 189           NA           10           31        0.323            3
    ## 190        0.341           69          132        0.523           23
    ## 191        0.316           19           35        0.543            8
    ## 192        0.311          275          586        0.469          172
    ## 193        0.353          173          380        0.455          133
    ## 194           NA          242          471        0.514          106
    ## 195        0.400            9           27        0.333            9
    ## 196        0.367          164          331        0.495          191
    ## 197        0.292           54           90        0.600           32
    ## 198        0.368          119          275        0.433          122
    ## 199        0.351          203          335        0.606           72
    ## 200        0.333          155          320        0.484          143
    ## 201        0.365          118          284        0.415           18
    ## 202        0.368           54           90        0.600           19
    ## 203        0.200          225          457        0.492           73
    ## 204        0.333           12           25        0.480            9
    ## 205        0.311           95          200        0.475          105
    ## 206        0.182           11           23        0.478            2
    ## 207        0.308           30           48        0.625           23
    ## 208        0.346          421          785        0.536          295
    ## 209        0.321          112          196        0.571           67
    ## 210        0.295          160          359        0.446           91
    ## 211        0.372          117          244        0.480          115
    ## 212        0.385           69          141        0.489           35
    ## 213        0.304          119          198        0.601           39
    ## 214        0.282           35           62        0.565           23
    ## 215        0.434           29           70        0.414           43
    ## 216        0.330           51          122        0.418           54
    ## 217        0.224          220          475        0.463          190
    ## 218        0.341          200          427        0.468          204
    ## 219        0.376           96          201        0.478          126
    ## 220        0.321          280          513        0.546           74
    ## 221        0.362          155          238        0.651           72
    ## 222           NA            8           16        0.500            3
    ## 223        0.375          132          244        0.541           43
    ## 224        0.308          191          387        0.494          151
    ## 225        0.374          150          270        0.556           44
    ## 226        0.250           60          109        0.550           21
    ## 227        0.000          208          315        0.660           56
    ## 228        0.375          434          714        0.608          336
    ## 229        0.222           54           98        0.551           21
    ## 230        0.414          376          729        0.516          186
    ## 231        0.346           20           38        0.526           20
    ## 232        0.333           65          122        0.533           29
    ## 233        0.333          172          313        0.550           42
    ## 234        0.411          351          654        0.537          325
    ## 235        0.000          164          305        0.538           98
    ## 236        0.321           19           46        0.413            5
    ## 237        0.379           58          138        0.420           27
    ## 238           NA          248          420        0.590           80
    ## 239        0.399           34           61        0.557           28
    ## 240        0.391           41           93        0.441           21
    ## 241           NA          161          259        0.622           65
    ## 242           NA           10           16        0.625            5
    ## 243        0.294          147          319        0.461           99
    ## 244        0.381          489          925        0.529          469
    ## 245        0.375           78          169        0.462           45
    ## 246        0.411          477          993        0.480          220
    ## 247        0.392           82          212        0.387           86
    ## 248        0.413          126          266        0.474           66
    ## 249        0.538          247          500        0.494          130
    ## 250        0.333          242          500        0.484           85
    ## 251        0.400            9           25        0.360            2
    ## 252           NA            5            7        0.714            4
    ## 253           NA          362          563        0.643           94
    ## 254        0.372          166          355        0.468          147
    ## 255        0.000            1            5        0.200            1
    ## 256        0.347          412          777        0.530          746
    ## 257        0.308            0            1        0.000            1
    ## 258        0.318           61          135        0.452           98
    ## 259        0.143          224          338        0.663           76
    ## 260        0.382          118          255        0.463           73
    ## 261        0.403          119          267        0.446          129
    ## 262        0.321          143          242        0.591           38
    ## 263        0.344          135          243        0.556           93
    ## 264        0.381           14           23        0.609            6
    ## 265        0.318           16           36        0.444           12
    ## 266        0.371          212          432        0.491          132
    ## 267        0.336          441          858        0.514          320
    ## 268        0.333          106          183        0.579           77
    ## 269           NA            2            7        0.286            0
    ## 270        0.411          250          483        0.518          232
    ## 271        0.000          412          575        0.717          205
    ## 272           NA            3           13        0.231            4
    ## 273        0.429          195          422        0.462          180
    ## 274        0.360          243          547        0.444          174
    ## 275        0.391          148          268        0.552           59
    ## 276        0.372          141          271        0.520          120
    ## 277        0.349           13           27        0.481           10
    ## 278        0.319          175          370        0.473           50
    ## 279        0.246           44           82        0.537           11
    ## 280        0.329           74          172        0.430           60
    ## 281        0.247          126          246        0.512           26
    ## 282        0.295          111          215        0.516           58
    ## 283        0.300          200          407        0.491           67
    ## 284        0.403          195          373        0.523          157
    ## 285        0.398          396          782        0.506          362
    ## 286        0.000           55          102        0.539           36
    ## 287        0.441           81          172        0.471           50
    ## 288        0.411          167          368        0.454           63
    ## 289        0.250            8           12        0.667            3
    ## 290        0.323           31           60        0.517            8
    ## 291        0.373          158          360        0.439           90
    ## 292        0.000          413          622        0.664          311
    ## 293        0.308          133          261        0.510           53
    ## 294        0.319           94          235        0.400           57
    ## 295        0.381           40           94        0.426           44
    ## 296        0.245          170          279        0.609           47
    ## 297        0.321          141          322        0.438           44
    ## 298        0.362           35           66        0.530           12
    ## 299        0.132          397          699        0.568          224
    ## 300        0.377          103          197        0.523           86
    ## 301        0.500            4            7        0.571            0
    ## 302        0.189           27           46        0.587           13
    ## 303        0.000           14           22        0.636            5
    ## 304        0.231           13           39        0.333            8
    ## 305        0.343          624         1358        0.459          710
    ## 306        0.190           65          160        0.406           17
    ## 307        0.000          374          654        0.572          157
    ## 308        1.000           88          178        0.494           28
    ## 309        0.361          285          580        0.491          116
    ## 310        0.276           74          204        0.363          148
    ## 311        0.000           83          134        0.619           23
    ## 312        0.269           50          129        0.388           35
    ## 313           NA           24           47        0.511           10
    ## 314        0.372           95          184        0.516           86
    ## 315        0.379          195          355        0.549          134
    ## 316        0.360           49          126        0.389           40
    ## 317        0.388          428          892        0.480          278
    ## 318        0.408          293          590        0.497          316
    ## 319        0.278          259          541        0.479           80
    ## 320        0.389           47          140        0.336           43
    ## 321        0.378           81          194        0.418           88
    ## 322        0.136           33           93        0.355           31
    ## 323        0.143           17           29        0.586           12
    ## 324        0.223          412          870        0.474          141
    ## 325        0.330          113          254        0.445           96
    ## 326        0.444          169          345        0.490          105
    ## 327        0.420          507         1001        0.506          268
    ## 328        0.370          447          910        0.491          488
    ## 329           NA           75          142        0.528           50
    ## 330        0.263          204          434        0.470           85
    ## 331        0.255           13           38        0.342           13
    ## 332        0.000          120          235        0.511           64
    ## 333        0.351          246          430        0.572           77
    ## 334        0.347           72          165        0.436           35
    ## 335        0.350          123          250        0.492           60
    ## 336        0.515           20           39        0.513            7
    ## 337        0.370           39           91        0.429           38
    ## 338        0.385            8           16        0.500            0
    ## 339        0.388          209          425        0.492          349
    ## 340        0.453           42           98        0.429           19
    ## 341        0.316          152          374        0.406          131
    ## 342        0.420          213          381        0.559          104
    ## 343        0.334          180          385        0.468          106
    ## 344        0.388          162          331        0.489           45
    ## 345        0.411           55          111        0.495           57
    ## 346        0.000          228          409        0.557          131
    ## 347        0.321           24           45        0.533            8
    ## 348        0.000           99          180        0.550           47
    ## 349        0.400            1            3        0.333            2
    ## 350        0.324          449          717        0.626          188
    ## 351           NA            2            3        0.667            0
    ## 352        0.370          208          432        0.481          143
    ## 353        0.337          323          614        0.526          141
    ## 354        0.000           89          174        0.511           29
    ## 355        0.299          730         1393        0.524          519
    ## 356        0.333            4            5        0.800            0
    ## 357           NA           36           76        0.474           15
    ## 358        0.392          103          178        0.579           16
    ## 359        0.375          106          218        0.486           94
    ## 360        0.234           46           91        0.505           25
    ## 361        0.370          206          411        0.501           57
    ## 362        0.389           68          123        0.553           20
    ## 363        0.356          305          613        0.498          119
    ## 364           NA           31           65        0.477           23
    ## 365        0.500           16           29        0.552            2
    ## 366        0.348           89          207        0.430          103
    ## 367        0.313          123          276        0.446           98
    ## 368        0.500           12           32        0.375            9
    ## 369        0.000            3            5        0.600            2
    ## 370        0.328           78          164        0.476          107
    ## 371        0.378          217          469        0.463           98
    ## 372        0.293           68          142        0.479           46
    ## 373        0.284          173          303        0.571          107
    ## 374        0.351          521         1058        0.492          242
    ## 375        0.358           89          195        0.456           44
    ## 376        0.333           13           29        0.448            5
    ## 377           NA           77          134        0.575           34
    ## 378        0.305           23           46        0.500           17
    ## 379        0.333           87          134        0.649           36
    ## 380        0.425          201          381        0.528           85
    ## 381        0.363          159          368        0.432          146
    ## 382        0.403           82          196        0.418           64
    ## 383        0.391           65          121        0.537           61
    ## 384        0.411          123          269        0.457           83
    ## 385        0.382          115          249        0.462           70
    ## 386        0.428           83          158        0.525           35
    ## 387        0.417          267          539        0.495          147
    ## 388        0.373          101          212        0.476           58
    ## 389        0.000           56          100        0.560           12
    ## 390        0.000          216          391        0.552           38
    ## 391        0.475           23           64        0.359           11
    ## 392        0.286           20           40        0.500           15
    ## 393        0.372          159          329        0.483          118
    ## 394        0.375          114          210        0.543           52
    ## 395        0.288          203          404        0.502          173
    ## 396        0.438           38           95        0.400           24
    ## 397        0.000          255          479        0.532          101
    ## 398        0.200           20           39        0.513           14
    ## 399        0.356          606         1281        0.473          412
    ## 400        0.386           26           73        0.356           13
    ## 401           NA           45           86        0.523           15
    ## 402        0.372          316          618        0.511          136
    ## 403           NA            5           13        0.385            2
    ## 404        0.367          701         1204        0.582          356
    ## 405        0.288           97          240        0.404           36
    ## 406        0.316           95          179        0.531           45
    ## 407        0.200           17           29        0.586            5
    ## 408        0.306          201          454        0.443          254
    ## 409        0.336          239          452        0.529          147
    ## 410        0.356           49          108        0.454           33
    ## 411        0.387          206          400        0.515          117
    ## 412        0.294          221          499        0.443          133
    ## 413        0.208           48           97        0.495           18
    ## 414        0.352          216          483        0.447          147
    ## 415        0.200           46           76        0.605           25
    ## 416        0.000          126          235        0.536           32
    ## 417        0.329          360          715        0.503          134
    ## 418        0.270          360          710        0.507          204
    ## 419        0.278          180          325        0.554           59
    ## 420        0.309          113          259        0.436           46
    ## 421        0.237           10           30        0.333           10
    ## 422        0.404          102          212        0.481           77
    ## 423        0.500          149          292        0.510           82
    ## 424        0.000          105          195        0.538           31
    ## 425        0.000          169          327        0.517           63
    ## 426        0.389           44           90        0.489           19
    ## 427        0.000          138          266        0.519           70
    ## 428        0.250          227          451        0.503          150
    ## 429        0.324          164          386        0.425          132
    ## 430        0.273           65          110        0.591           29
    ## 431        0.363          459         1026        0.447          367
    ## 432        0.277           29           60        0.483            4
    ## 433        0.000            1            5        0.200            1
    ## 434        0.335          345          724        0.477          388
    ## 435        0.379           80          143        0.559           43
    ## 436        0.357          137          294        0.466           40
    ## 437        0.321          212          408        0.520          113
    ## 438        0.176            1            7        0.143            3
    ## 439        0.265          377          716        0.527          119
    ## 440        0.266          163          358        0.455           55
    ## 441           NA          153          228        0.671           91
    ##     points1_atts points1_perc off_rebounds def_rebounds assists steals
    ## 1            135        0.800           95          369     337     52
    ## 2            100        0.670          117          248     140     52
    ## 3             93        0.731           65          269     121     68
    ## 4              6        0.500            2            2       3      0
    ## 5             41        0.805           17           68      33      9
    ## 6            649        0.909           43          162     449     70
    ## 7            217        0.811           48          367     155     72
    ## 8              9        0.667            6           20       4     10
    ## 9            124        0.685           45          175      64     35
    ## 10            37        0.703           60          213      71     26
    ## 11            14        0.571           13           21       7      3
    ## 12           123        0.732           72          288     148     43
    ## 13           250        0.812           78          228     364    125
    ## 14            66        0.773           40          187     131     45
    ## 15            39        0.564           43           81      42      7
    ## 16            74        0.851           37          253      45     33
    ## 17             4        0.750            1            1       1      0
    ## 18            25        0.840            1           44      86      6
    ## 19            39        0.692            3           54      14      5
    ## 20             1        0.000            4            6       1      0
    ## 21            90        0.789           39          180     109     62
    ## 22            15        0.667           17           96      62     40
    ## 23            20        0.650            3           35      14      7
    ## 24            49        0.714            3           38      58     18
    ## 25           295        0.871          148          518     116     53
    ## 26            15        0.933            7           90      35     11
    ## 27           328        0.905           52          178     418     83
    ## 28           531        0.674           97          543     646     92
    ## 29           108        0.741           28          174      78     26
    ## 30           213        0.498          287          429      77     39
    ## 31             0           NA            5            5       4      2
    ## 32           122        0.770           52          184     265     66
    ## 33            55        0.764           16           32      57     27
    ## 34           647        0.842           70          316     290     78
    ## 35           117        0.761           63          212      74     81
    ## 36            22        0.818            4           38      35     17
    ## 37            57        0.544           78           87      12     18
    ## 38           217        0.811          226          533      57     37
    ## 39           365        0.819           48          239     417     88
    ## 40            67        0.657           82          161      42     52
    ## 41           159        0.792           26          142      82     51
    ## 42            16        0.688           23          106      26     31
    ## 43            32        0.688           64          122      17     26
    ## 44            60        0.717           62          229      76     40
    ## 45            34        0.882           29          127      15      7
    ## 46            76        0.934           14           66      21     10
    ## 47           342        0.825           53          186     267     83
    ## 48            17        0.706            8           36     108     15
    ## 49             2        0.500            0            2       0      1
    ## 50             2        0.000            5           17       3      2
    ## 51            75        0.573           47          103      19     33
    ## 52            51        0.686           64          194      37     21
    ## 53           527        0.801           58          268     831    157
    ## 54           159        0.648          238          611     121     40
    ## 55           215        0.837          107          385     126     82
    ## 56           119        0.832          118          397     121    116
    ## 57            27        0.852            4           30      15      8
    ## 58            33        0.697           25           58      92     26
    ## 59            29        0.759            7           40     100     11
    ## 60            16        0.375           14           45      28      8
    ## 61           255        0.855           42          206     499     74
    ## 62           424        0.533          296          644     104     64
    ## 63            65        0.800           42          109      43     22
    ## 64             8        0.875            7           25      37      4
    ## 65           168        0.708           45          186     177     91
    ## 66            82        0.780           60          146      29     15
    ## 67            93        0.806           11          113     193     39
    ## 68            26        0.846           13           55      30      9
    ## 69            64        0.766           76          164      95     30
    ## 70           405        0.768          111          422     252     90
    ## 71             6        0.833            1           17       8      4
    ## 72            75        0.733           54          216     107     96
    ## 73           214        0.766           35          189     182     55
    ## 74           612        0.770          142          558     434    131
    ## 75           239        0.741          167          365     187     92
    ## 76           218        0.743           79          235     142     51
    ## 77            29        0.828           15           91      98     45
    ## 78           107        0.692           92          203      57     29
    ## 79            92        0.880           11          112      99     41
    ## 80           126        0.865           47          166     317     84
    ## 81            96        0.854           24          123     357     53
    ## 82           105        0.743           40          153      53     28
    ## 83            45        0.778           11          151      48     12
    ## 84             5        0.400            4           45      23     19
    ## 85            18        0.778            6           39      19      2
    ## 86            49        0.653           40           74      23     10
    ## 87            58        0.810           22          226      96     54
    ## 88            40        0.800           18           51     125     25
    ## 89            85        0.765           75          203      57     19
    ## 90            93        0.903           30          199      48     46
    ## 91             2        1.000            2           15       5      3
    ## 92           415        0.867           33          298     639    100
    ## 93            15        0.733            1           16      15      4
    ## 94            22        0.636           41          101      23      7
    ## 95             3        0.667            1           23      25      3
    ## 96            33        0.697          105          115      57     18
    ## 97           128        0.727           19          185     236     79
    ## 98           303        0.809          139          448     106     74
    ## 99           374        0.898           58          434     251    117
    ## 100           29        0.724           26           30       4      3
    ## 101           86        0.523          131          318     122    114
    ## 102           11        1.000            1            1       6      2
    ## 103           59        0.661           75          220      35     16
    ## 104            4        0.250            1           16      15      4
    ## 105           93        0.645          124          187      40     25
    ## 106           18        0.778           11          140      63     30
    ## 107          281        0.794           64          207     229     86
    ## 108           33        0.909            6           43      37     22
    ## 109           73        0.890           17           94     120     47
    ## 110          676        0.865          128          342     417    143
    ## 111           15        0.600           21           47      19      7
    ## 112           77        0.753           24          128     113     38
    ## 113          128        0.773           61          323      75     53
    ## 114           40        0.775           15          110      36     15
    ## 115           50        0.600           73          282     461     99
    ## 116          104        0.721          244          276      80     18
    ## 117          127        0.646           18          136     200     41
    ## 118          377        0.790           61          217     423     89
    ## 119          358        0.628          293          795      57     56
    ## 120          215        0.707           66          309     276     76
    ## 121            9        0.667           23           51      50     10
    ## 122           77        0.779           35          133     140     60
    ## 123           47        0.617           23           71      66     27
    ## 124           15        0.733           13          129      36     21
    ## 125           22        0.909           25           57      21     10
    ## 126           71        0.620           95          162     124     45
    ## 127          254        0.768           50          243     233     84
    ## 128           15        0.600            8           28       6      5
    ## 129           43        0.860           18          115      70     35
    ## 130           88        0.557          129          203      26     18
    ## 131          355        0.386          345          771      89    124
    ## 132           94        0.840          111          222      32     17
    ## 133           34        0.941            6           51     131     13
    ## 134           58        0.810           46           84       9      6
    ## 135           28        0.750            2           31      33     11
    ## 136            8        0.500            8           33       7      1
    ## 137          102        0.706           21          214     418     61
    ## 138          113        0.867          102          300     111     31
    ## 139          185        0.832           55          193     193     89
    ## 140          185        0.784           77          289     160     52
    ## 141            2        1.000            2            1       2      0
    ## 142            7        0.714           13           51      29     18
    ## 143          136        0.868           21           92     270     35
    ## 144           53        0.679           36          153     105     56
    ## 145          226        0.841           63          353     142     60
    ## 146           39        0.846            5           34      52      9
    ## 147           13        0.692            8           14      16      9
    ## 148           15        0.733           14           15       2      3
    ## 149          196        0.679          135          270      99     62
    ## 150          156        0.756           57          279     162     47
    ## 151          129        0.853           30          234      75     27
    ## 152            2        0.500            4            4       4      0
    ## 153          359        0.847           45          263     435     85
    ## 154          168        0.893           14          164     147     44
    ## 155          150        0.873           89          409     106     58
    ## 156          194        0.784          156          409     114     81
    ## 157            4        0.750           15           27       3      7
    ## 158          284        0.856           46          435     455     86
    ## 159          118        0.771           11           62     129     26
    ## 160           15        0.667            5           17       6      6
    ## 161          365        0.833           62          374     213     60
    ## 162           31        0.935            6           21      28      6
    ## 163           98        0.867           53          207     179     81
    ## 164          253        0.874           66          180     283     44
    ## 165           78        0.436          161          241     103     30
    ## 166           80        0.825           27          198     102     65
    ## 167          252        0.786          111          364      97     47
    ## 168           83        0.771          157          282     117     36
    ## 169           51        0.843           32          110      35     21
    ## 170           19        0.421           23           28      10      4
    ## 171           26        0.731           22           42       8     15
    ## 172           68        0.809           47           79      69     29
    ## 173           43        0.651           12           86     107     34
    ## 174           24        0.708           12           47      52     13
    ## 175          125        0.728          170          332      96     41
    ## 176          217        0.719          116          289     150     64
    ## 177          234        0.534          157          410      74     25
    ## 178           66        0.864           16           73     114     43
    ## 179          161        0.814           15          102     209     31
    ## 180            0           NA            5           20      20     12
    ## 181          211        0.692           89          298     529     88
    ## 182          277        0.805           44          165     202     66
    ## 183          168        0.863           39          175      81     37
    ## 184           74        0.878            5           72      45     34
    ## 185           10        0.900            1            8       3      1
    ## 186           50        0.800           20          126      62     30
    ## 187          160        0.669          176          603     208     77
    ## 188            0           NA            1            6       0      0
    ## 189            5        0.600           11           24       4      2
    ## 190           27        0.852            4           64      43     34
    ## 191           10        0.800           11           18       5      3
    ## 192          220        0.782          112          402     182     57
    ## 193          165        0.806           34          151     112     41
    ## 194          158        0.671           81          159      58     20
    ## 195           10        0.900            3            9      13      0
    ## 196          244        0.783           61          182      66     27
    ## 197           41        0.780           30           66      34     13
    ## 198          150        0.813           21          205     188     46
    ## 199          103        0.699           94          217      58     42
    ## 200          174        0.822           92          344     102    127
    ## 201           27        0.667           21          136     344     48
    ## 202           35        0.543           41           44      13      9
    ## 203           90        0.811           39          212     534    133
    ## 204           11        0.818            8           14       4      1
    ## 205          123        0.854           25          123      75     32
    ## 206            2        1.000            4           23       3      5
    ## 207           32        0.719            7           21      23      4
    ## 208          364        0.810          121          282     176     38
    ## 209           93        0.720           23          165     110     49
    ## 210          113        0.805           32          152     192     42
    ## 211          141        0.816           11          124     184     41
    ## 212           49        0.714           16          131      54     30
    ## 213           52        0.750           71          191      55     29
    ## 214           28        0.821            9           43       9     12
    ## 215           57        0.754           18           89      18     14
    ## 216           63        0.857            9          146     135     35
    ## 217          253        0.751           96          356     154     82
    ## 218          242        0.843           22          258     157     46
    ## 219          159        0.792           27          137     185     44
    ## 220          110        0.673          142          428     138     76
    ## 221          102        0.706           51          253     262     76
    ## 222           10        0.300            9           14       0      1
    ## 223           56        0.768           47          156     151     42
    ## 224          213        0.709           98          501     533    154
    ## 225           58        0.759           22          100      90     39
    ## 226           42        0.500           34           56      17     18
    ## 227          111        0.505          100          144      17     19
    ## 228          384        0.875           39          474     300     66
    ## 229           34        0.618           44           80      29     14
    ## 230          218        0.853           49          236     160     66
    ## 231           23        0.870           15           76      45     12
    ## 232           37        0.784           22           79      77     32
    ## 233           60        0.700           28          123     139     38
    ## 234          362        0.898           61          292     523    143
    ## 235          126        0.778          140          270     132     59
    ## 236            6        0.833            2           21      23      1
    ## 237           32        0.844           31          193     124     71
    ## 238          113        0.708          148          292     124     31
    ## 239           34        0.824           22           77      46     20
    ## 240           30        0.700            6           36      48      8
    ## 241           93        0.699          129          366      44     37
    ## 242            8        0.625            8           23       3      2
    ## 243          132        0.750           20          140     126     47
    ## 244          533        0.880           80          350     260    132
    ## 245           57        0.789           33          175      91     51
    ## 246          271        0.812          174          350     139     46
    ## 247          107        0.804           28          129     183     82
    ## 248           80        0.825           24          118     280     65
    ## 249          184        0.707          107          394     150     24
    ## 250          117        0.726            9          104     285     33
    ## 251            2        1.000            0            6      14      1
    ## 252            4        1.000            2            8       3      3
    ## 253          177        0.531          178          348      64     34
    ## 254          175        0.840           29          172     188     48
    ## 255            2        0.500            1            2       3      1
    ## 256          881        0.847           95          564     906    120
    ## 257            2        0.500            4            6       2      3
    ## 258          113        0.867           12           58      56     15
    ## 259          121        0.628           81          138      64     20
    ## 260           95        0.768           95          299     281     99
    ## 261          150        0.860          112          218      68     32
    ## 262           68        0.559           94          190      76     38
    ## 263          126        0.738           54          405     175    147
    ## 264            7        0.857            9           15       6      3
    ## 265           16        0.750            3           21      11      3
    ## 266          191        0.691           20          141     204     48
    ## 267          421        0.760          111          385     300     58
    ## 268           88        0.875           43           86      21     14
    ## 269            0           NA            1            2       1      2
    ## 270          260        0.892           41          263     563    118
    ## 271          425        0.482          297          817      96     52
    ## 272            4        1.000            1            5       0      0
    ## 273          202        0.891           11          160     110     55
    ## 274          203        0.857           17          112     213     59
    ## 275           87        0.678           47          127      39     81
    ## 276          137        0.876           88          285      66     23
    ## 277           13        0.769            1           47      10      4
    ## 278           64        0.781           33          184     191     67
    ## 279           17        0.647           26          155      23     29
    ## 280           78        0.769           17          103      30     18
    ## 281           35        0.743           46          112     170     18
    ## 282           73        0.795           30          102     112     21
    ## 283          109        0.615           92          213      56     45
    ## 284          196        0.801           23          144     203     50
    ## 285          429        0.844           49          344     252     73
    ## 286           48        0.750           52           69       7     16
    ## 287           68        0.735           23          237     224     96
    ## 288           77        0.818           33          209     144     35
    ## 289            6        0.500            4           13       2      1
    ## 290            9        0.889            4           26      34     21
    ## 291          115        0.783           16          186      96     39
    ## 292          476        0.653          314          721      97     49
    ## 293           77        0.688           20          108     154     42
    ## 294           79        0.722           48          187      70     26
    ## 295           49        0.898           18           68      40     37
    ## 296          111        0.423           98          304      79     94
    ## 297           67        0.657           45          242      82     39
    ## 298           17        0.706            6           43      13      2
    ## 299          285        0.786          195          287      67     32
    ## 300          139        0.619           38          161      46     33
    ## 301            1        0.000            4            5       3      0
    ## 302           17        0.765            8           40       9      7
    ## 303            8        0.625            9           21      12      2
    ## 304           10        0.800            0           11      14      8
    ## 305          840        0.845          137          727     840    133
    ## 306           31        0.548           19           69     130     28
    ## 307          257        0.611          282          333      86     88
    ## 308           39        0.718           38           65      13     14
    ## 309          154        0.753           39          252     176     78
    ## 310          194        0.763           23          113     198     54
    ## 311           35        0.657           31           47      15     11
    ## 312           43        0.814            6           78      55     20
    ## 313           18        0.556           20           40       2      3
    ## 314          110        0.782           69          190      64     46
    ## 315          167        0.802          167          377      84     46
    ## 316           50        0.800           42          120       8     17
    ## 317          332        0.837           60          402     338     67
    ## 318          368        0.859           31          211     433     92
    ## 319          130        0.615          166          225      98    115
    ## 320           54        0.796           21           79      46     21
    ## 321          115        0.765           36          191     133     60
    ## 322           37        0.838           11           35      61     18
    ## 323           18        0.667            1           10      12      4
    ## 324          193        0.731          182          416     122     38
    ## 325          136        0.706           77          374      99     60
    ## 326          124        0.847           19          206      93     54
    ## 327          294        0.912           60          231     285     72
    ## 328          545        0.895           46          322     439     68
    ## 329           81        0.617           96          147      27     15
    ## 330          103        0.825           36          211     205     53
    ## 331           17        0.765            6           18      11      9
    ## 332           97        0.660           65          142      63     25
    ## 333          124        0.621          125          216      89     85
    ## 334           40        0.875           27          209      71     13
    ## 335           94        0.638          131          256      31     30
    ## 336            9        0.778           10           42      28      6
    ## 337           49        0.776            8           53      67     32
    ## 338            3        0.000            4           10      11      2
    ## 339          387        0.902           39          287     136     41
    ## 340           22        0.864           25           87      42     19
    ## 341          167        0.784           30          150     217     41
    ## 342          134        0.776           48          130     164     71
    ## 343          120        0.883           41          173     170     53
    ## 344           63        0.714           28          164     385     53
    ## 345           76        0.750           43          144      29     29
    ## 346          189        0.693          180          279      55     43
    ## 347           10        0.800            5           12      11      7
    ## 348           76        0.618           50          123      70     19
    ## 349            2        1.000            3           36      22      2
    ## 350          228        0.825          212          503     358     60
    ## 351            0           NA            1            1       1      0
    ## 352          190        0.753           58          201     206     48
    ## 353          194        0.727          104          356     143     52
    ## 354           40        0.725           46          131      12     20
    ## 355          647        0.802          174          712     157     94
    ## 356            0           NA            0            1       0      1
    ## 357           21        0.714           23           50       4      4
    ## 358           27        0.593           56          221      36     39
    ## 359          121        0.777           38          174      66     25
    ## 360           49        0.510           26           75      34     18
    ## 361           74        0.770           33          119     164     50
    ## 362           26        0.769            4           30      57     11
    ## 363          168        0.708           46          218     488    100
    ## 364           39        0.590           48          115      15      5
    ## 365            3        0.667            1            3      14      3
    ## 366          128        0.805           51          256     141     71
    ## 367          129        0.760           34          139     335     56
    ## 368           20        0.450            8           28       4      1
    ## 369            3        0.667            3            4       0      2
    ## 370          129        0.829           11          116     136     43
    ## 371          112        0.875           23          330      82     30
    ## 372           61        0.754           55          166      67     52
    ## 373          141        0.759           94          213      49     61
    ## 374          281        0.861           94          303     117     66
    ## 375           51        0.863            9           75     193     14
    ## 376            7        0.714            8           14       9      2
    ## 377           48        0.708           47          103      20     22
    ## 378           22        0.773           26           69      47     17
    ## 379           61        0.590           97          211      14     32
    ## 380          100        0.850           25          153     188     79
    ## 381          179        0.816           18          241     210     77
    ## 382           73        0.877           16           83     155     40
    ## 383           82        0.744           51          188      77     33
    ## 384           93        0.892            9          116      78     21
    ## 385           93        0.753           19          111      51     29
    ## 386           43        0.814           16           87      44     20
    ## 387          171        0.860           23          130     312     67
    ## 388           74        0.784           32          151     169     84
    ## 389           14        0.857           24           62      20      3
    ## 390           62        0.613          118          285      47     36
    ## 391           12        0.917            7           28      28      6
    ## 392           19        0.789            3           20      11      5
    ## 393          138        0.855           35          155      82     44
    ## 394           74        0.703           51          111      27     16
    ## 395          217        0.797           44          135     335     74
    ## 396           34        0.706            7           44      33     12
    ## 397          151        0.669           85          255      80     53
    ## 398           19        0.737            9           24       7      8
    ## 399          542        0.760          103          226     189     82
    ## 400           18        0.722           16           83      45     22
    ## 401           22        0.682           51          107      25     25
    ## 402          167        0.814          188          459     158     88
    ## 403            2        1.000            8            6       0      1
    ## 404          428        0.832          296          711     220     57
    ## 405           59        0.610           24          142     188     78
    ## 406           61        0.738           57          187      79     40
    ## 407            8        0.625            6           14      11     13
    ## 408          285        0.891           68          237     682    128
    ## 409          190        0.774           84          136      35     22
    ## 410           43        0.767           10           57     156     47
    ## 411          140        0.836           18          141     139     41
    ## 412          214        0.621           60          257     166     50
    ## 413           24        0.750           11           41      36     24
    ## 414          188        0.782           31          191     303     87
    ## 415           39        0.641           16           46      14     13
    ## 416           49        0.653           41          118      30     14
    ## 417          168        0.798           49          197     213     88
    ## 418          282        0.723          151          485     264     49
    ## 419           80        0.738          120          249      96     82
    ## 420           63        0.730           63          232      74     48
    ## 421           16        0.625            5           15      11      9
    ## 422           90        0.856           25          112      58     37
    ## 423          109        0.752          143          199      39     30
    ## 424           66        0.470           84          139      31     26
    ## 425           78        0.808          104          160      43     16
    ## 426           22        0.864            6           21      52     20
    ## 427          112        0.625           94          198      23     27
    ## 428          208        0.721          156          354      44     37
    ## 429          154        0.857           25           93     130     27
    ## 430           41        0.707           39           40      12     14
    ## 431          441        0.832           46          203     268     72
    ## 432           11        0.364           23           80      23     10
    ## 433            2        0.500            3            3       1      0
    ## 434          458        0.847           52          268     418     92
    ## 435           65        0.662           31          194     121     42
    ## 436           45        0.889           15           89      81     31
    ## 437          181        0.624           96          252      60     67
    ## 438            4        0.750            3            8      18     11
    ## 439          154        0.773          125          214      75     76
    ## 440           71        0.775           20           75     226     48
    ## 441          124        0.734          154          385      30     33
    ##     blocks turnovers fouls
    ## 1       87       116   138
    ## 2       62        77   211
    ## 3       11        88   141
    ## 4        0         0     0
    ## 5        7        25    48
    ## 6       13       210   167
    ## 7       23        79   161
    ## 8        2         4    15
    ## 9       18        68   142
    ## 10      17        39   122
    ## 11       6         9    12
    ## 12      29        96   207
    ## 13      34       159   192
    ## 14      11        47    69
    ## 15      21        20    61
    ## 16      37        53   138
    ## 17       0         1     1
    ## 18       6        40    42
    ## 19       2        14    27
    ## 20       6         2     3
    ## 21      27        78   150
    ## 22      11        26    77
    ## 23      10        10    37
    ## 24       7        31    38
    ## 25      22       122   125
    ## 26       8        29    60
    ## 27      25       180   157
    ## 28      44       303   134
    ## 29      10        52   153
    ## 30      84        64   176
    ## 31       1         2     4
    ## 32      13       109   140
    ## 33      11        25    31
    ## 34      13       180   134
    ## 35      27        54   143
    ## 36       2        15    36
    ## 37      20        29   113
    ## 38      63       106   216
    ## 39      19       173   170
    ## 40      90        46   137
    ## 41      14        70   127
    ## 42       5        14    53
    ## 43      45        33   109
    ## 44      23        38   120
    ## 45      33        39    76
    ## 46       4        38    47
    ## 47      21       157   169
    ## 48       0        22    32
    ## 49       0         1     0
    ## 50       0         3    17
    ## 51      24        34    90
    ## 52      55        58   168
    ## 53      49       323   151
    ## 54      65       118   213
    ## 55      42       129   254
    ## 56      41        43   193
    ## 57       2         5    17
    ## 58       6        38    60
    ## 59       5        48    54
    ## 60       5        16    21
    ## 61      16       258   149
    ## 62      92       170   203
    ## 63       8        34    73
    ## 64       0        15    14
    ## 65      52       125   165
    ## 66      21        28    69
    ## 67       1        95   112
    ## 68       5        14    35
    ## 69      41        55    97
    ## 70      62       158   186
    ## 71       5         4     5
    ## 72      31        58    97
    ## 73      15       106   103
    ## 74     151       234   246
    ## 75      38       140   168
    ## 76      22        92   111
    ## 77      20        36    95
    ## 78      78        53   151
    ## 79       7        65    79
    ## 80      12       113   140
    ## 81       0       133   153
    ## 82      27        66    92
    ## 83      13        37   109
    ## 84      10        14    32
    ## 85       4         9    16
    ## 86      26        17    84
    ## 87      14        55   125
    ## 88       9        66    93
    ## 89      16        33   125
    ## 90      25        40   151
    ## 91       0         5     6
    ## 92      32       216   165
    ## 93       0         5     5
    ## 94      20        29    66
    ## 95       2        11    12
    ## 96      24        29    78
    ## 97      27       135   149
    ## 98     173       105   262
    ## 99      27       218   206
    ## 100      6         8    37
    ## 101     30        96   135
    ## 102      0         0     4
    ## 103     11        37    94
    ## 104      0        13    14
    ## 105     16        33   110
    ## 106      7        49    86
    ## 107     41       138   112
    ## 108      1        20    35
    ## 109      8        44    93
    ## 110     32       159   112
    ## 111      0        16    12
    ## 112     23        66   102
    ## 113     56        79   128
    ## 114     16        40    78
    ## 115     11       168   144
    ## 116    117        90   151
    ## 117     20       103    95
    ## 118     13       212   199
    ## 119    161       154   226
    ## 120     86       171   197
    ## 121      4        23    31
    ## 122     39        65   132
    ## 123      6        33    52
    ## 124     11        25   118
    ## 125     10        18    52
    ## 126     18        56   140
    ## 127     44        90   176
    ## 128      1         8    22
    ## 129      4        30    70
    ## 130     47        31   137
    ## 131     89       152   237
    ## 132     39        50   166
    ## 133      0        37    29
    ## 134     12        10    25
    ## 135      2        28    39
    ## 136      1        14     6
    ## 137     33       112   127
    ## 138     26        66   145
    ## 139     12        86   118
    ## 140     25        87   168
    ## 141      0         0     2
    ## 142      3        10    22
    ## 143      5       114   129
    ## 144     24        71   121
    ## 145     39        95   133
    ## 146      1        26    18
    ## 147      0         5    12
    ## 148      6         7    11
    ## 149     58        65   189
    ## 150     34        76   139
    ## 151     23        40    98
    ## 152      0         3     6
    ## 153     22       168   119
    ## 154      9        70    90
    ## 155     53        60   134
    ## 156     77        56   187
    ## 157      4         8    25
    ## 158     29       194   109
    ## 159      3        46    43
    ## 160      1         3    18
    ## 161     34       153   198
    ## 162      1        16    28
    ## 163     23        69   141
    ## 164     17       147    84
    ## 165     37        58   127
    ## 166     31        66   109
    ## 167    130       118   244
    ## 168    104        76   174
    ## 169      5        25    85
    ## 170      4        12    23
    ## 171      8        12    30
    ## 172     11        51    79
    ## 173      8        56    74
    ## 174      2        16    38
    ## 175     36       100   150
    ## 176     40        89   172
    ## 177     91        95   202
    ## 178      2        47    84
    ## 179      1        90   101
    ## 180      1         9    31
    ## 181     40       178   177
    ## 182      4       141   180
    ## 183     13        75   103
    ## 184      4        36    41
    ## 185      0         2     5
    ## 186     14        58    74
    ## 187     74       117   180
    ## 188      0         3     4
    ## 189      5         3    17
    ## 190     13        35    61
    ## 191      2         3    14
    ## 192     30       183   162
    ## 193     15        62   129
    ## 194     49        91   122
    ## 195      0         9     4
    ## 196     76       117   112
    ## 197      7        26    45
    ## 198     32       128   144
    ## 199     55        55   136
    ## 200     69       131   203
    ## 201      4       128    95
    ## 202      9        13    49
    ## 203     10       159   139
    ## 204      1         6     8
    ## 205     10        73   154
    ## 206      0         6    18
    ## 207      4        14     7
    ## 208    124       184   192
    ## 209      8        59    91
    ## 210     36       142   175
    ## 211     14        86    79
    ## 212      8        55   121
    ## 213     43        43    91
    ## 214     10        19    25
    ## 215     15        19    58
    ## 216      9        80    99
    ## 217     44       116   177
    ## 218      6       136   118
    ## 219     23        66   119
    ## 220     28       127   152
    ## 221     39        58    97
    ## 222      4         6    15
    ## 223     48        78   105
    ## 224    106       184   217
    ## 225      8        55    77
    ## 226     29        19    47
    ## 227     67        40   109
    ## 228     99       138   117
    ## 229     17        17    64
    ## 230     40       128   139
    ## 231      9        24    47
    ## 232     15        36    62
    ## 233     20        61   120
    ## 234     17       239   183
    ## 235     33        88   166
    ## 236      0        11    20
    ## 237     58        76   120
    ## 238     40        82   125
    ## 239     28        32    75
    ## 240      6        38    29
    ## 241     61        61   180
    ## 242      6         4    11
    ## 243     25        76   146
    ## 244     55       154   122
    ## 245     26        39    63
    ## 246     89        98   158
    ## 247     16        96   119
    ## 248      3       101   109
    ## 249     70        81   110
    ## 250      2        89    92
    ## 251      0         5     5
    ## 252      1         4     6
    ## 253     80        87   179
    ## 254     40       121   150
    ## 255      1         0     6
    ## 256     37       464   215
    ## 257      1         5     4
    ## 258      9        40    25
    ## 259     42        44   126
    ## 260     25       100   222
    ## 261     14        55   142
    ## 262     21        41    83
    ## 263     20        74   133
    ## 264      1         6    18
    ## 265      0         7    35
    ## 266     10       115   187
    ## 267     23       142   157
    ## 268     11        29    45
    ## 269      1         1     0
    ## 270      8       147   146
    ## 271    135       116   212
    ## 272      1         2     5
    ## 273     13        98   125
    ## 274     14       134   115
    ## 275     35        47   122
    ## 276     41        69   229
    ## 277      5        16    40
    ## 278     22        83   125
    ## 279     30        18    83
    ## 280      5        35    50
    ## 281      9        87    83
    ## 282     12        80   146
    ## 283     40        60   103
    ## 284     11        85   114
    ## 285     20       140   117
    ## 286     32        14    52
    ## 287      8       107   163
    ## 288     18        69    93
    ## 289      2         2     1
    ## 290      5        15    48
    ## 291     11        65   132
    ## 292    214       148   246
    ## 293      3        90   100
    ## 294     20        64    97
    ## 295      8        33   114
    ## 296     79        51   204
    ## 297     32        83   200
    ## 298      1         6    22
    ## 299     38       123   154
    ## 300     75        41   144
    ## 301      3         0     0
    ## 302      5        11    29
    ## 303      2         4    17
    ## 304      0         7    18
    ## 305     31       438   190
    ## 306      6        43    79
    ## 307     78       146   195
    ## 308     15        28    40
    ## 309     21       119   155
    ## 310     20        85   194
    ## 311     20        10    42
    ## 312      5        24    52
    ## 313     17         8    40
    ## 314     19        59   165
    ## 315     34        94   248
    ## 316      9        28    91
    ## 317     99       166   171
    ## 318     19       156   126
    ## 319     29       100   178
    ## 320      4        45    90
    ## 321     36        50   163
    ## 322      7        40    40
    ## 323      1         9    12
    ## 324     10        99   136
    ## 325     44        94   102
    ## 326     20        62   171
    ## 327     42       172   202
    ## 328     20       197   152
    ## 329     22        37   137
    ## 330     24       100   121
    ## 331      3        11    22
    ## 332     38        62    73
    ## 333     70        85   214
    ## 334     28        35   172
    ## 335     27        64   154
    ## 336      2        17    23
    ## 337      2        41    38
    ## 338      3        11     6
    ## 339     15        81    93
    ## 340     21        36    76
    ## 341     13       123    95
    ## 342      8        76    92
    ## 343     24       113   124
    ## 344      8       129   197
    ## 345     12        31    62
    ## 346     40        58   124
    ## 347      0         8    10
    ## 348     29        46    77
    ## 349      0        13     9
    ## 350     55       171   214
    ## 351      2         1     3
    ## 352     28        97   110
    ## 353     30       114   172
    ## 354     22        31    77
    ## 355    167       181   168
    ## 356      1         0     5
    ## 357      7         7    17
    ## 358     28        28   100
    ## 359     19        62    75
    ## 360     11        31    55
    ## 361     32        62   131
    ## 362      2        25    30
    ## 363     43       194   133
    ## 364     10        14    51
    ## 365      0         5     7
    ## 366     32        82   182
    ## 367      6       101   133
    ## 368     13        10    21
    ## 369      0         0     3
    ## 370      7        57   101
    ## 371     38        51   113
    ## 372     25        45   125
    ## 373     39        34   135
    ## 374     15       102   128
    ## 375      1        63    30
    ## 376      4         3     8
    ## 377     25        22    55
    ## 378      8        26    43
    ## 379     61        40   152
    ## 380      7        92   126
    ## 381     16       102   161
    ## 382      7        56    79
    ## 383     20        56   109
    ## 384      7        42   104
    ## 385      6        62   108
    ## 386      2        53    34
    ## 387      9       114   119
    ## 388     28        78   141
    ## 389     17        24    44
    ## 390     48        61   172
    ## 391      1        18    20
    ## 392      1         8    23
    ## 393     26        74    79
    ## 394     13        37    64
    ## 395      6       129   119
    ## 396      5        22    19
    ## 397     45        69   147
    ## 398      7         8    32
    ## 399     30       187   183
    ## 400     23        28    42
    ## 401     23        17    85
    ## 402     95       107   254
    ## 403      0         4     9
    ## 404    103       212   241
    ## 405     36        89   178
    ## 406     20        59   154
    ## 407      2        10    24
    ## 408     10       195   202
    ## 409      6        56    86
    ## 410      5        38    50
    ## 411     10        85   104
    ## 412     36       116   158
    ## 413      8        19    29
    ## 414     16       176   130
    ## 415      7        11    36
    ## 416     33        30    66
    ## 417      8       164   150
    ## 418     37       173   248
    ## 419     40        56   149
    ## 420     20        43    61
    ## 421      2         7    18
    ## 422     14        36   137
    ## 423     44        58   173
    ## 424      9        46    76
    ## 425     31        72   133
    ## 426      2        21    29
    ## 427     32        37   125
    ## 428     98       102   242
    ## 429      5        89    87
    ## 430     13        13    63
    ## 431     21       241   242
    ## 432     22        32    74
    ## 433      0         2     2
    ## 434     31       223   164
    ## 435     16        72   154
    ## 436      8        48    82
    ## 437     70       108   263
    ## 438      1         3    14
    ## 439     39        57   175
    ## 440      5        77    73
    ## 441     24        67   126

``` r
combine = full_join(teams1, stats, by="player")
combine
```

    ##                       player team position height weight age experience
    ## 1               A.J. Hammons  DAL        C     84    260  24          0
    ## 2               Aaron Brooks  IND       PG     72    161  32          8
    ## 3               Aaron Gordon  ORL       SF     81    220  21          2
    ## 4              Adreian Payne  MIN       PF     82    237  25          2
    ## 5                 Al Horford  BOS        C     82    245  30          9
    ## 6               Al Jefferson  IND        C     82    289  32         12
    ## 7            Al-Farouq Aminu  POR       SF     81    220  26          6
    ## 8              Alan Anderson  LAC       SF     78    220  34          7
    ## 9              Alan Williams  PHO        C     80    260  24          1
    ## 10                Alec Burks  UTA       SG     78    214  25          5
    ## 11              Alex Abrines  OKC       SG     78    190  23          0
    ## 12                  Alex Len  PHO        C     85    260  23          3
    ## 13            Alex Poythress  PHI       PF     79    238  23          0
    ## 14             Alexis Ajinca  NOP        C     86    248  28          6
    ## 15              Allen Crabbe  POR       SG     78    210  24          3
    ## 16              Amir Johnson  BOS       PF     81    240  29         11
    ## 17            Andre Drummond  DET        C     83    279  23          4
    ## 18            Andre Iguodala  GSW       SF     78    215  33         12
    ## 19            Andre Roberson  OKC       SF     79    210  25          3
    ## 20           Andrew Harrison  MEM       PG     78    213  22          0
    ## 21          Andrew Nicholson  BRK       PF     81    250  27          4
    ## 22            Andrew Wiggins  MIN       SF     80    199  21          2
    ## 23             Anthony Davis  NOP        C     82    253  23          4
    ## 24            Anthony Morrow  CHI       SG     77    210  31          8
    ## 25          Anthony Tolliver  SAC       PF     80    240  31          8
    ## 26            Archie Goodwin  BRK       SG     77    200  22          3
    ## 27               Aron Baynes  DET        C     82    260  30          4
    ## 28             Arron Afflalo  SAC       SG     77    210  31          9
    ## 29             Austin Rivers  LAC       SG     76    200  24          4
    ## 30             Avery Bradley  BOS       SG     74    180  26          6
    ## 31              Axel Toupane  NOP       SF     79    197  24          1
    ## 32              Ben McLemore  SAC       SG     77    195  23          3
    ## 33                Beno Udrih  DET       PG     75    205  34         12
    ## 34           Bismack Biyombo  ORL        C     81    255  24          5
    ## 35             Blake Griffin  LAC       PF     82    251  27          6
    ## 36          Boban Marjanovic  DET        C     87    290  28          1
    ## 37               Bobby Brown  HOU       PG     74    175  32          2
    ## 38              Bobby Portis  CHI       PF     83    230  21          1
    ## 39          Bojan Bogdanovic  WAS       SF     80    216  27          2
    ## 40                Boris Diaw  UTA       PF     80    250  34         13
    ## 41              Bradley Beal  WAS       SG     77    207  23          4
    ## 42            Brandan Wright  MEM       PF     82    210  29          8
    ## 43              Brandon Bass  LAC       PF     80    250  31         11
    ## 44            Brandon Ingram  LAL       SF     81    190  19          0
    ## 45          Brandon Jennings  WAS       PG     73    170  27          7
    ## 46            Brandon Knight  PHO       SG     75    189  25          5
    ## 47              Brandon Rush  MIN       SG     78    220  31          8
    ## 48             Brian Roberts  CHO       PG     73    173  31          4
    ## 49             Briante Weber  CHO       PG     74    165  24          1
    ## 50             Brice Johnson  LAC       PF     82    230  22          0
    ## 51               Brook Lopez  BRK        C     84    275  28          8
    ## 52             Bruno Caboclo  TOR       SF     81    218  21          2
    ## 53               Bryn Forbes  SAS       SG     75    190  23          0
    ## 54               Buddy Hield  SAC       SG     76    214  23          0
    ## 55             C.J. McCollum  POR       SG     76    200  25          3
    ## 56                C.J. Miles  IND       SF     78    225  29         11
    ## 57               C.J. Watson  ORL       PG     74    175  32          9
    ## 58             Cameron Payne  CHI       PG     75    185  22          1
    ## 59              Caris LeVert  BRK       SF     79    203  22          0
    ## 60           Carmelo Anthony  NYK       SF     80    240  32         13
    ## 61          Chandler Parsons  MEM       SF     82    230  28          5
    ## 62             Channing Frye  CLE        C     83    255  33         10
    ## 63            Chasson Randle  NYK       PG     74    185  23          0
    ## 64             Cheick Diallo  NOP       PF     81    220  20          0
    ## 65            Chinanu Onuaku  HOU        C     82    245  20          0
    ## 66          Chris McCullough  WAS       PF     83    200  21          1
    ## 67                Chris Paul  LAC       PG     72    175  31         11
    ## 68            Christian Wood  CHO       PF     83    220  21          1
    ## 69              Clint Capela  HOU        C     82    240  22          2
    ## 70               Cody Zeller  CHO       PF     84    240  24          3
    ## 71              Cole Aldrich  MIN        C     83    250  28          6
    ## 72              Corey Brewer  LAL       SF     81    186  30          9
    ## 73               Cory Joseph  TOR       SG     75    193  25          5
    ## 74              Courtney Lee  NYK       SG     77    200  31          8
    ## 75         Cristiano Felicio  CHI        C     82    275  24          1
    ## 76             D.J. Augustin  ORL       PG     72    183  29          8
    ## 77          D'Angelo Russell  LAL       PG     77    195  20          1
    ## 78             Dahntay Jones  CLE       SF     78    225  36         12
    ## 79              Damian Jones  GSW        C     84    245  21          0
    ## 80            Damian Lillard  POR       PG     75    195  26          4
    ## 81              Damjan Rudez  ORL       SF     82    228  30          2
    ## 82             Daniel Ochefu  WAS        C     83    245  23          0
    ## 83          Danilo Gallinari  DEN       SF     82    225  28          7
    ## 84               Danny Green  SAS       SG     78    215  29          7
    ## 85          Dante Cunningham  NOP       SF     80    230  29          7
    ## 86                Dante Exum  UTA       PG     78    190  21          1
    ## 87               Dario Saric  PHI       PF     82    223  22          0
    ## 88            Darrell Arthur  DEN       PF     81    235  28          7
    ## 89           Darren Collison  SAC       PG     72    175  29          7
    ## 90           Darrun Hilliard  DET       SG     78    205  23          1
    ## 91                 David Lee  SAS       PF     81    245  33         11
    ## 92               David Nwaba  LAL       SG     76    209  24          0
    ## 93                David West  GSW        C     81    250  36         13
    ## 94             Davis Bertans  SAS       PF     82    210  24          0
    ## 95            DeAndre Jordan  LAC        C     83    265  28          8
    ## 96           DeAndre Liggins  DAL       SG     78    209  28          3
    ## 97           DeAndre' Bembry  ATL       SF     78    210  22          0
    ## 98           Dejounte Murray  SAS       PG     77    170  20          0
    ## 99              Delon Wright  TOR       PG     77    183  24          1
    ## 100            DeMar DeRozan  TOR       SG     79    221  27          7
    ## 101         DeMarcus Cousins  NOP        C     83    270  26          6
    ## 102          DeMarre Carroll  TOR       SF     80    215  30          7
    ## 103        Demetrius Jackson  BOS       PG     73    201  22          0
    ## 104          Dennis Schroder  ATL       PG     73    172  23          3
    ## 105         Denzel Valentine  CHI       SG     78    212  23          0
    ## 106           Deron Williams  CLE       PG     75    200  32         11
    ## 107           Derrick Favors  UTA       PF     82    265  25          6
    ## 108            Derrick Jones  PHO       SF     79    190  19          0
    ## 109             Derrick Rose  NYK       PG     75    190  28          7
    ## 110         Derrick Williams  CLE       PF     80    240  25          5
    ## 111             Devin Booker  PHO       SG     78    206  20          1
    ## 112             Devin Harris  DAL       PG     75    192  33         12
    ## 113           Dewayne Dedmon  SAS        C     84    245  27          3
    ## 114            Deyonta Davis  MEM        C     83    237  20          0
    ## 115            Diamond Stone  LAC        C     83    255  19          0
    ## 116             Dion Waiters  MIA       SG     76    225  25          4
    ## 117            Dirk Nowitzki  DAL       PF     84    245  38         18
    ## 118         Domantas Sabonis  OKC       PF     83    240  20          0
    ## 119       Donatas Motiejunas  NOP       PF     84    222  26          4
    ## 120      Dorian Finney-Smith  DAL       PF     80    220  23          0
    ## 121           Doug McDermott  OKC       SF     80    225  25          2
    ## 122            Dragan Bender  PHO       PF     85    225  19          0
    ## 123           Draymond Green  GSW       PF     79    230  26          4
    ## 124            Dwight Howard  ATL        C     83    265  31         12
    ## 125            Dwight Powell  DAL        C     83    240  25          2
    ## 126              Dwyane Wade  CHI       SG     76    220  35         13
    ## 127            E'Twaun Moore  NOP       SG     76    191  27          5
    ## 128                 Ed Davis  POR       PF     82    240  27          6
    ## 129              Edy Tavares  CLE        C     87    260  24          1
    ## 130            Elfrid Payton  ORL       PG     76    185  22          2
    ## 131           Elijah Millsap  PHO       SG     78    225  29          2
    ## 132          Emmanuel Mudiay  DEN       PG     77    200  20          1
    ## 133              Enes Kanter  OKC        C     83    245  24          5
    ## 134             Eric Bledsoe  PHO       PG     73    190  27          6
    ## 135              Eric Gordon  HOU       SG     76    215  28          8
    ## 136           Ersan Ilyasova  ATL       PF     82    235  29          8
    ## 137            Evan Fournier  ORL       SG     79    205  24          4
    ## 138              Evan Turner  POR       SF     79    220  28          6
    ## 139           Frank Kaminsky  CHO        C     84    242  23          1
    ## 140            Fred VanVleet  TOR       PG     72    195  22          0
    ## 141           Garrett Temple  SAC       SG     78    195  30          6
    ## 142              Gary Harris  DEN       SG     76    210  22          2
    ## 143              George Hill  UTA       PG     75    188  30          8
    ## 144            Georges Niang  IND       PF     80    230  23          0
    ## 145     Georgios Papagiannis  SAC        C     85    240  19          0
    ## 146             Gerald Green  BOS       SF     79    205  31          9
    ## 147         Gerald Henderson  PHI       SG     77    215  29          7
    ## 148    Giannis Antetokounmpo  MIL       SF     83    222  22          3
    ## 149             Goran Dragic  MIA       PG     75    190  30          8
    ## 150           Gordon Hayward  UTA       SF     80    226  26          6
    ## 151             Gorgui Dieng  MIN       PF     83    241  27          3
    ## 152              Greg Monroe  MIL        C     83    265  26          6
    ## 153          Harrison Barnes  DAL       PF     80    210  24          4
    ## 154         Hassan Whiteside  MIA        C     84    265  27          4
    ## 155           Henry Ellenson  DET       PF     83    245  20          0
    ## 156                Ian Clark  GSW       SG     75    175  25          3
    ## 157              Ian Mahinmi  WAS        C     83    250  30          8
    ## 158            Iman Shumpert  CLE       SG     77    220  26          5
    ## 159            Isaiah Canaan  CHI       SG     72    201  25          3
    ## 160            Isaiah Taylor  HOU       PG     75    170  22          0
    ## 161            Isaiah Thomas  BOS       PG     69    185  27          5
    ## 162         Isaiah Whitehead  BRK       PG     76    213  21          0
    ## 163                Ish Smith  DET       PG     72    175  28          6
    ## 164              Ivica Zubac  LAL        C     85    265  19          0
    ## 165               J.J. Barea  DAL       PG     72    185  32         10
    ## 166              J.J. Redick  LAC       SG     76    190  32         10
    ## 167               J.R. Smith  CLE       SG     78    225  31         12
    ## 168            Jabari Parker  MIL       PF     80    250  21          2
    ## 169              Jae Crowder  BOS       SF     78    235  26          4
    ## 170            Jahlil Okafor  PHI        C     83    275  21          1
    ## 171              Jake Layman  POR       SF     81    210  22          0
    ## 172             Jakob Poeltl  TOR        C     84    248  21          0
    ## 173           Jamal Crawford  LAC       SG     77    200  36         16
    ## 174             Jamal Murray  DEN       SG     76    207  19          0
    ## 175            Jameer Nelson  DEN       PG     72    190  34         12
    ## 176              James Ennis  MEM       SF     79    210  26          2
    ## 177             James Harden  HOU       PG     77    220  27          7
    ## 178            James Johnson  MIA       PF     81    250  29          7
    ## 179              James Jones  CLE       SF     80    218  36         13
    ## 180     James Michael McAdoo  GSW       PF     81    230  24          2
    ## 181              James Young  BOS       SG     78    215  21          2
    ## 182           JaMychal Green  MEM       PF     81    227  26          2
    ## 183             Jared Dudley  PHO       PF     79    225  31          9
    ## 184            Jarell Martin  MEM       PF     82    239  22          1
    ## 185            Jarrod Uthoff  DAL       PF     81    221  23          0
    ## 186              Jason Smith  WAS        C     84    245  30          8
    ## 187              Jason Terry  MIL       SG     74    185  39         17
    ## 188             JaVale McGee  GSW        C     84    270  29          8
    ## 189             Jaylen Brown  BOS       SF     79    225  20          0
    ## 190               Jeff Green  ORL       PF     81    235  30          8
    ## 191              Jeff Teague  IND       PG     74    186  28          7
    ## 192              Jeff Withey  UTA        C     84    231  26          3
    ## 193             Jerami Grant  OKC       SF     80    210  22          2
    ## 194              Jeremy Lamb  CHO       SG     77    185  24          4
    ## 195               Jeremy Lin  BRK       PG     75    200  28          6
    ## 196             Jerian Grant  CHI       PG     76    195  24          1
    ## 197           Jerryd Bayless  PHI       PG     75    200  28          8
    ## 198             Jimmy Butler  CHI       SF     79    220  27          5
    ## 199              Joakim Noah  NYK        C     83    230  31          9
    ## 200              Jodie Meeks  ORL       SG     76    210  29          7
    ## 201               Joe Harris  BRK       SG     78    219  25          2
    ## 202               Joe Ingles  UTA       SF     80    226  29          2
    ## 203              Joe Johnson  UTA       SF     79    240  35         15
    ## 204                Joe Young  IND       PG     74    180  24          1
    ## 205             Joel Anthony  SAS        C     81    245  34          9
    ## 206            Joel Bolomboy  UTA       PF     81    235  23          0
    ## 207              Joel Embiid  PHI        C     84    250  22          0
    ## 208        Joffrey Lauvergne  CHI        C     83    220  25          2
    ## 209              John Henson  MIL        C     83    229  26          4
    ## 210                John Wall  WAS       PG     76    195  26          6
    ## 211          Johnny O'Bryant  CHO       PF     81    257  23          2
    ## 212                Jon Leuer  DET       PF     82    228  27          5
    ## 213            Jonas Jerebko  BOS       PF     82    231  29          6
    ## 214        Jonas Valanciunas  TOR        C     84    265  24          4
    ## 215         Jonathon Simmons  SAS       SG     78    195  27          1
    ## 216          Jordan Clarkson  LAL       SG     77    194  24          2
    ## 217          Jordan Crawford  NOP       SG     76    195  28          4
    ## 218              Jordan Hill  MIN        C     82    235  29          7
    ## 219            Jordan Mickey  BOS       PF     80    235  22          1
    ## 220            Jose Calderon  ATL       PG     75    200  35         11
    ## 221             Josh Huestis  OKC       PF     79    230  25          1
    ## 222           Josh McRoberts  MIA       PF     82    240  29          9
    ## 223          Josh Richardson  MIA       SG     78    200  23          1
    ## 224             Jrue Holiday  NOP       PG     76    205  26          7
    ## 225         Juan Hernangomez  DEN       PF     81    230  21          0
    ## 226            Julius Randle  LAL       PF     81    250  22          2
    ## 227          Justin Anderson  PHI       SF     78    228  23          1
    ## 228          Justin Hamilton  BRK        C     84    260  26          2
    ## 229           Justin Holiday  NYK       SG     78    185  27          3
    ## 230          Justise Winslow  MIA       SF     79    225  20          1
    ## 231             Jusuf Nurkic  POR        C     84    280  22          2
    ## 232           K.J. McDaniels  BRK       SF     78    205  23          2
    ## 233       Karl-Anthony Towns  MIN        C     84    244  21          1
    ## 234            Kawhi Leonard  SAS       SF     79    230  25          5
    ## 235               Kay Felder  CLE       PG     69    176  21          0
    ## 236             Kelly Olynyk  BOS        C     84    238  25          3
    ## 237             Kemba Walker  CHO       PG     73    172  26          5
    ## 238           Kenneth Faried  DEN       PF     80    228  27          5
    ## 239            Kent Bazemore  ATL       SF     77    201  27          4
    ## 240 Kentavious Caldwell-Pope  DET       SG     77    205  23          3
    ## 241             Kevin Durant  GSW       SF     81    240  28          9
    ## 242               Kevin Love  CLE       PF     82    251  28          8
    ## 243           Kevin Seraphin  IND       PF     81    285  27          6
    ## 244             Kevon Looney  GSW        C     81    220  20          1
    ## 245          Khris Middleton  MIL       SF     80    234  25          4
    ## 246            Klay Thompson  GSW       SG     79    215  26          5
    ## 247             Kosta Koufos  SAC        C     84    265  27          8
    ## 248                Kris Dunn  MIN       PG     76    210  22          0
    ## 249           Kris Humphries  ATL       PF     81    235  31         12
    ## 250       Kristaps Porzingis  NYK       PF     87    240  21          1
    ## 251            Kyle Anderson  SAS       SG     81    230  23          2
    ## 252              Kyle Korver  CLE       SG     79    212  35         13
    ## 253               Kyle Lowry  TOR       PG     72    205  30         10
    ## 254             Kyle O'Quinn  NYK        C     82    250  26          4
    ## 255             Kyle Singler  OKC       SF     80    228  28          4
    ## 256             Kyle Wiltjer  HOU       PF     82    240  24          0
    ## 257             Kyrie Irving  CLE       PG     75    193  24          5
    ## 258        LaMarcus Aldridge  SAS       PF     83    260  31         10
    ## 259         Lance Stephenson  IND       SG     77    230  26          6
    ## 260             Lance Thomas  NYK       PF     80    235  28          5
    ## 261        Langston Galloway  SAC       PG     74    200  25          2
    ## 262          Larry Nance Jr.  LAL       PF     81    230  24          1
    ## 263              Lavoy Allen  IND       PF     81    260  27          5
    ## 264          Leandro Barbosa  PHO       SG     75    194  34         13
    ## 265             LeBron James  CLE       SF     80    250  32         13
    ## 266             Lou Williams  HOU       SG     73    175  30         11
    ## 267         Luc Mbah a Moute  LAC       SF     80    230  30          8
    ## 268           Lucas Nogueira  TOR        C     84    241  24          2
    ## 269             Luke Babbitt  MIA       SF     81    225  27          6
    ## 270                Luol Deng  LAL       SF     81    220  31         12
    ## 271       Malachi Richardson  SAC       SG     78    205  21          0
    ## 272          Malcolm Brogdon  MIL       SG     77    215  24          0
    ## 273          Malcolm Delaney  ATL       PG     75    190  27          0
    ## 274            Malik Beasley  DEN       SG     77    196  20          0
    ## 275            Manu Ginobili  SAS       SG     78    205  39         14
    ## 276               Marc Gasol  MEM        C     85    255  32          8
    ## 277            Marcin Gortat  WAS        C     83    240  32          9
    ## 278          Marco Belinelli  CHO       SG     77    210  30          9
    ## 279      Marcus Georges-Hunt  ORL       SG     77    216  22          0
    ## 280            Marcus Morris  DET       SF     81    235  27          5
    ## 281             Marcus Smart  BOS       SG     76    220  22          2
    ## 282            Mario Hezonja  ORL       SF     80    215  21          1
    ## 283          Markieff Morris  WAS       PF     82    245  27          5
    ## 284          Marquese Chriss  PHO       PF     82    233  19          0
    ## 285        Marreese Speights  LAC        C     82    255  29          8
    ## 286         Marshall Plumlee  NYK        C     84    250  24          0
    ## 287          Marvin Williams  CHO       PF     81    237  30         11
    ## 288            Mason Plumlee  DEN        C     83    245  26          3
    ## 289              Matt Barnes  GSW       SF     79    226  36         13
    ## 290      Matthew Dellavedova  MIL       PG     76    198  26          3
    ## 291         Maurice Harkless  POR       SF     81    215  23          4
    ## 292            Maurice Ndour  NYK       PF     81    200  24          0
    ## 293        Metta World Peace  LAL       SF     78    260  37         16
    ## 294           Meyers Leonard  POR       PF     85    245  24          4
    ## 295          Michael Beasley  MIL       PF     81    235  28          8
    ## 296  Michael Carter-Williams  CHI       PG     78    190  25          3
    ## 297          Michael Gbinije  DET       SG     79    200  24          0
    ## 298   Michael Kidd-Gilchrist  CHO       SF     79    232  23          4
    ## 299              Mike Conley  MEM       PG     73    175  29          9
    ## 300            Mike Dunleavy  ATL       SF     81    230  36         14
    ## 301              Mike Miller  DEN       SF     80    218  36         16
    ## 302             Mike Muscala  ATL        C     83    240  25          3
    ## 303            Miles Plumlee  CHO        C     83    249  28          4
    ## 304     Mindaugas Kuzminskas  NYK       SF     81    215  27          0
    ## 305          Mirza Teletovic  MIL       PF     81    242  31          4
    ## 306              Monta Ellis  IND       SG     75    185  31         11
    ## 307         Montrezl Harrell  HOU        C     80    240  23          1
    ## 308             Myles Turner  IND        C     83    243  20          1
    ## 309          Nemanja Bjelica  MIN       PF     82    240  28          1
    ## 310             Nerlens Noel  DAL        C     83    228  22          2
    ## 311            Nick Collison  OKC       PF     82    255  36         12
    ## 312               Nick Young  LAL       SG     79    210  31          9
    ## 313            Nicolas Batum  CHO       SG     80    200  28          8
    ## 314         Nicolas Brussino  DAL       SF     79    195  23          0
    ## 315             Nik Stauskas  PHI       SG     78    205  23          2
    ## 316             Nikola Jokic  DEN        C     82    250  21          1
    ## 317           Nikola Mirotic  CHI       PF     82    220  25          2
    ## 318           Nikola Vucevic  ORL        C     84    260  26          5
    ## 319              Noah Vonleh  POR       PF     82    240  21          2
    ## 320            Norman Powell  TOR       SG     76    215  23          1
    ## 321              Norris Cole  OKC       PG     74    175  28          5
    ## 322              Okaro White  MIA       PF     80    204  24          0
    ## 323                Omer Asik  NOP        C     84    255  30          6
    ## 324              Omri Casspi  MIN       SF     81    225  28          7
    ## 325              Otto Porter  WAS       SF     80    198  23          3
    ## 326              P.J. Tucker  TOR       SF     78    245  31          5
    ## 327            Pascal Siakam  TOR       PF     81    230  22          0
    ## 328          Pat Connaughton  POR       SG     77    206  24          1
    ## 329          Patricio Garino  ORL       SG     78    210  23          0
    ## 330         Patrick Beverley  HOU       SG     73    185  28          4
    ## 331            Patrick McCaw  GSW       SG     79    185  21          0
    ## 332        Patrick Patterson  TOR       PF     81    230  27          6
    ## 333              Patty Mills  SAS       PG     72    185  28          7
    ## 334                Pau Gasol  SAS        C     84    250  36         15
    ## 335              Paul George  IND       SF     81    220  26          6
    ## 336             Paul Millsap  ATL       PF     80    246  31         10
    ## 337              Paul Pierce  LAC       SF     79    235  39         18
    ## 338              Paul Zipser  CHI       SF     80    215  22          0
    ## 339               Quincy Acy  BRK       PF     79    240  26          4
    ## 340               Quinn Cook  NOP       PG     74    184  23          0
    ## 341              Rajon Rondo  CHI       PG     73    186  30         10
    ## 342         Rakeem Christmas  IND       PF     81    250  25          1
    ## 343           Ramon Sessions  CHO       PG     75    190  30          9
    ## 344               Randy Foye  BRK       SG     76    213  33         10
    ## 345            Rashad Vaughn  MIL       SG     78    202  20          1
    ## 346                Raul Neto  UTA       PG     73    179  24          1
    ## 347           Raymond Felton  LAC       PG     73    205  32         11
    ## 348           Reggie Bullock  DET       SF     79    205  25          3
    ## 349           Reggie Jackson  DET       PG     75    208  26          5
    ## 350        Richard Jefferson  CLE       SF     79    233  36         15
    ## 351           Richaun Holmes  PHI        C     82    245  23          1
    ## 352              Ricky Rubio  MIN       PG     76    194  26          5
    ## 353         Robert Covington  PHI       SF     81    215  26          3
    ## 354              Robin Lopez  CHI        C     84    255  28          8
    ## 355              Rodney Hood  UTA       SG     80    206  24          2
    ## 356          Rodney McGruder  MIA       SG     76    205  25          0
    ## 357                Ron Baker  NYK       SG     76    220  23          0
    ## 358  Rondae Hollis-Jefferson  BRK       SF     79    220  22          1
    ## 359             Ronnie Price  PHO       PG     74    190  33         11
    ## 360              Roy Hibbert  DEN        C     86    270  30          8
    ## 361                 Rudy Gay  SAC       SF     80    230  30         10
    ## 362              Rudy Gobert  UTA        C     85    245  24          3
    ## 363        Russell Westbrook  OKC       PG     75    200  28          8
    ## 364            Ryan Anderson  HOU       PF     82    240  28          8
    ## 365               Ryan Kelly  ATL       PF     83    230  25          3
    ## 366              Salah Mejri  DAL        C     85    245  30          1
    ## 367               Sam Dekker  HOU       SF     81    230  22          1
    ## 368            Sasha Vujacic  NYK       SG     79    195  32          9
    ## 369          Sean Kilpatrick  BRK       SG     76    210  27          2
    ## 370           Semaj Christon  OKC       PG     75    190  24          0
    ## 371              Serge Ibaka  TOR       PF     82    235  27          7
    ## 372         Sergio Rodriguez  PHI       PG     75    176  30          4
    ## 373               Seth Curry  DAL       PG     74    185  26          3
    ## 374         Shabazz Muhammad  MIN       SF     78    223  24          3
    ## 375           Shabazz Napier  POR       PG     73    175  25          2
    ## 376         Shaun Livingston  GSW       PG     79    192  31         11
    ## 377               Shawn Long  PHI        C     81    255  24          0
    ## 378        Sheldon McClellan  WAS       SG     77    200  24          0
    ## 379             Shelvin Mack  UTA       PG     75    203  26          5
    ## 380          Skal Labissiere  SAC       PF     83    225  20          0
    ## 381             Solomon Hill  NOP       SF     79    225  25          3
    ## 382        Spencer Dinwiddie  BRK       PG     78    200  23          2
    ## 383            Spencer Hawes  MIL       PF     85    245  28          9
    ## 384          Stanley Johnson  DET       SF     79    245  20          1
    ## 385            Stephen Curry  GSW       PG     75    190  28          7
    ## 386        Stephen Zimmerman  ORL        C     84    240  20          0
    ## 387             Steven Adams  OKC        C     84    255  23          3
    ## 388           T.J. McConnell  PHI       PG     74    200  24          1
    ## 389              T.J. Warren  PHO       SF     80    230  23          2
    ## 390               Taj Gibson  OKC       PF     81    225  31          7
    ## 391              Tarik Black  LAL        C     81    250  25          2
    ## 392            Terrence Ross  ORL       SF     79    206  25          4
    ## 393             Terry Rozier  BOS       PG     74    190  22          1
    ## 394          Thabo Sefolosha  ATL       SF     79    220  32         10
    ## 395           Thaddeus Young  IND       PF     80    221  28          9
    ## 396          Thomas Robinson  LAL       PF     82    237  25          4
    ## 397               Thon Maker  MIL        C     85    216  19          0
    ## 398           Tiago Splitter  PHI        C     83    245  32          6
    ## 399              Tim Frazier  NOP       PG     73    170  26          2
    ## 400             Tim Hardaway  ATL       SG     78    205  24          3
    ## 401           Tim Quarterman  POR       SG     78    195  22          0
    ## 402           Timofey Mozgov  LAL        C     85    275  30          6
    ## 403  Timothe Luwawu-Cabarrot  PHI       SF     78    205  21          0
    ## 404            Tobias Harris  DET       PF     81    235  24          5
    ## 405         Tomas Satoransky  WAS       SG     79    210  25          0
    ## 406               Tony Allen  MEM       SG     76    213  35         12
    ## 407              Tony Parker  SAS       PG     74    185  34         15
    ## 408               Tony Snell  MIL       SG     79    200  25          3
    ## 409           Treveon Graham  CHO       SG     78    220  23          0
    ## 410             Trevor Ariza  HOU       SF     80    215  31         12
    ## 411            Trevor Booker  BRK       PF     80    228  29          6
    ## 412               Trey Burke  WAS       PG     73    191  24          3
    ## 413               Trey Lyles  UTA       PF     82    234  21          1
    ## 414         Tristan Thompson  CLE        C     81    238  25          5
    ## 415             Troy Daniels  MEM       SG     76    205  25          3
    ## 416            Troy Williams  HOU       SF     79    218  22          0
    ## 417                Ty Lawson  SAC       PG     71    195  29          7
    ## 418              Tyler Ennis  LAL       PG     75    194  22          2
    ## 419            Tyler Johnson  MIA       PG     76    186  24          2
    ## 420               Tyler Ulis  PHO       PG     70    150  21          0
    ## 421             Tyler Zeller  BOS        C     84    253  27          4
    ## 422             Tyreke Evans  SAC       SF     78    220  27          7
    ## 423           Tyson Chandler  PHO        C     85    240  34         15
    ## 424               Tyus Jones  MIN       PG     74    195  20          1
    ## 425            Udonis Haslem  MIA        C     80    235  36         13
    ## 426           Victor Oladipo  OKC       SG     76    210  24          3
    ## 427             Vince Carter  MEM       SF     78    220  40         18
    ## 428             Wade Baldwin  MEM       PG     76    202  20          0
    ## 429          Wayne Ellington  MIA       SG     76    200  29          7
    ## 430             Wayne Selden  MEM       SG     77    230  22          0
    ## 431           Wesley Johnson  LAC       SF     79    215  29          6
    ## 432          Wesley Matthews  DAL       SG     77    220  30          7
    ## 433              Will Barton  DEN       SG     78    175  26          4
    ## 434      Willie Cauley-Stein  SAC        C     84    240  23          1
    ## 435              Willie Reed  MIA        C     82    220  26          1
    ## 436        Willy Hernangomez  NYK        C     83    240  22          0
    ## 437          Wilson Chandler  DEN       SF     80    225  29          8
    ## 438             Yogi Ferrell  DAL       PG     72    180  23          0
    ## 439              Zach LaVine  MIN       SG     77    189  21          2
    ## 440            Zach Randolph  MEM       PF     81    260  35         15
    ## 441            Zaza Pachulia  GSW        C     83    270  32         13
    ##       salary games_played minutes field_goals_made field_goals_atts
    ## 1     650000           22     163               17               42
    ## 2    2700000           65     894              121              300
    ## 3    4351320           80    2298              393              865
    ## 4    2022240           18     135               23               54
    ## 5   26540100           68    2193              379              801
    ## 6   10230179           66     931              235              471
    ## 7    7680965           61    1773              183              466
    ## 8    1315448           30     308               30               80
    ## 9     874636           47     708              138              267
    ## 10  10154495           42     653               99              248
    ## 11   5994764           68    1055              134              341
    ## 12   4823621           77    1560              230              463
    ## 13     31969            6     157               25               54
    ## 14   4600000           39     584               89              178
    ## 15  18500000           79    2254              303              647
    ## 16  12000000           80    1608              213              370
    ## 17  22116750           81    2409              483              911
    ## 18  11131368           76    1998              219              415
    ## 19   2183072           79    2376              215              463
    ## 20    945000           72    1474              117              360
    ## 21   6088993           10     111               13               34
    ## 22   6006600           82    3048              709             1570
    ## 23  22116750           75    2708              770             1527
    ## 24   3488000            9      87               12               29
    ## 25   8000000           65    1477              155              351
    ## 26    119494           12     184               34               61
    ## 27   6500000           75    1163              143              279
    ## 28  12500000           61    1580              185              420
    ## 29  11000000           74    2054              323              731
    ## 30   8269663           55    1835              359              775
    ## 31     20580            2      41                5                8
    ## 32   4008882           61    1176              180              419
    ## 33   1551659           39     560               92              197
    ## 34  17000000           81    1793              179              339
    ## 35  20140838           61    2076              479              971
    ## 36   7000000           35     293               72              132
    ## 37    680534           25     123               23               60
    ## 38   1453680           64    1000              183              375
    ## 39   3730653           26     601              107              234
    ## 40   7000000           73    1283              146              327
    ## 41  22116750           77    2684              637             1322
    ## 42   5700000           28     447               83              135
    ## 43   1551659           52     577              107              186
    ## 44   5281680           79    2279              276              686
    ## 45   1200000           23     374               29              106
    ## 46  12606250           54    1140              209              525
    ## 47   3500000           47    1030               70              187
    ## 48   1050961           41     416               46              122
    ## 49    102898           13     159               20               46
    ## 50   1273920            3       9                2                7
    ## 51  21165675           75    2222              555             1172
    ## 52   1589640            9      40                6               16
    ## 53    543471           36     285               36               99
    ## 54   3517200           25     727              142              296
    ## 55   3219579           80    2796              692             1441
    ## 56   4583450           76    1776              281              647
    ## 57   5000000           62    1012               96              248
    ## 58   2112480           11     142               21               63
    ## 59   1562280           57    1237              171              380
    ## 60  24559380           74    2538              602             1389
    ## 61  22116750           34     675               75              222
    ## 62   7806971           74    1398              238              520
    ## 63    143860           18     225               28               72
    ## 64    543471           17     199               36               76
    ## 65    543471            5      52                5                7
    ## 66   1191480            2       8                0                1
    ## 67  22868828           61    1921              374              785
    ## 68    874636           13     107               12               23
    ## 69   1296240           65    1551              362              563
    ## 70   5318313           62    1725              253              443
    ## 71   7643979           62     531               45               86
    ## 72   7600000           24     358               53              121
    ## 73   7330000           80    2003              299              661
    ## 74  11242000           77    2459              321              704
    ## 75    874636           66    1040              128              222
    ## 76   7250000           78    1538              195              517
    ## 77   5332800           63    1811              351              867
    ## 78     18255            1      12                3                8
    ## 79   1171560           10      85                8               16
    ## 80  24328425           75    2694              661             1488
    ## 81    980431           45     314               31               88
    ## 82    543471           19      75               12               27
    ## 83  15050000           63    2134              335              750
    ## 84  10000000           68    1807              176              449
    ## 85   2978250           66    1649              174              359
    ## 86   3940320           66    1228              155              364
    ## 87   2318280           81    2129              381              927
    ## 88   8070175           41     639               95              215
    ## 89   5229454           68    2063              340              714
    ## 90    874060           39     381               47              126
    ## 91   1551659           79    1477              248              420
    ## 92     73528           20     397               47               81
    ## 93   1551659           68     854              135              252
    ## 94    543471           67     808              103              234
    ## 95  21165675           81    2570              412              577
    ## 96   1015696            1      25                3                6
    ## 97   1499760           38     371               47               98
    ## 98   1180080           38     322               50              116
    ## 99   1577280           27     446               49              116
    ## 100 26540100           74    2620              721             1545
    ## 101 16957900           17     574              142              314
    ## 102 14200000           72    1882              220              549
    ## 103  1450000            5      17                3                4
    ## 104  2708582           79    2485              548             1215
    ## 105  2092200           57     976              102              288
    ## 106   259626           24     486               68              147
    ## 107 11050000           50    1186              203              417
    ## 108   543471           32     545               68              121
    ## 109 21323250           64    2082              460              977
    ## 110   268029           25     427               54              107
    ## 111  2223600           78    2730              606             1431
    ## 112  4228000           65    1087              136              341
    ## 113  2898000           76    1330              161              259
    ## 114  1369229           36     238               24               47
    ## 115   543471            7      24                3               13
    ## 116  2898000           46    1384              281              663
    ## 117 25000000           54    1424              296              678
    ## 118  2440200           81    1632              192              481
    ## 119   576724           34     479               57              138
    ## 120   543471           81    1642              124              333
    ## 121  2483040           22     430               56              124
    ## 122  4276320           43     574               57              161
    ## 123 15330435           76    2471              272              650
    ## 124 23180275           74    2199              388              613
    ## 125  8375000           77    1333              194              377
    ## 126 23200000           60    1792              414              955
    ## 127  8081363           73    1820              283              619
    ## 128  6666667           46     789               75              142
    ## 129     5145            1      24                3                4
    ## 130  2613600           82    2412              430              912
    ## 131    23069            2      23                1                7
    ## 132  3241800           55    1406              208              551
    ## 133 17145838           72    1533              402              737
    ## 134 14000000           66    2176              449             1034
    ## 135 12385364           75    2323              412             1016
    ## 136  8400000           26     633               93              226
    ## 137 17000000           68    2234              408              930
    ## 138 16393443           65    1658              235              552
    ## 139  2730000           75    1954              320              802
    ## 140   543471           37     294               39              111
    ## 141  8000000           65    1728              183              432
    ## 142  1655880           57    1782              320              636
    ## 143  8000000           49    1544              289              606
    ## 144   650000           23      93                9               36
    ## 145  2202240           22     355               56              102
    ## 146  1410598           47     538               95              232
    ## 147  9000000           72    1667              234              553
    ## 148  2995421           80    2845              656             1259
    ## 149 15890000           73    2459              534             1124
    ## 150 16073140           73    2516              545             1156
    ## 151  2348783           82    2653              332              661
    ## 152 17100000           81    1823              387              726
    ## 153 22116750           79    2803              599             1280
    ## 154 22116750           77    2513              542              973
    ## 155  1704120           19     146               23               64
    ## 156  1015696           77    1137              211              433
    ## 157 15944154           31     555               65              111
    ## 158  9700000           76    1937              201              489
    ## 159  1015696           39     592               63              173
    ## 160   255000            4      52                1                7
    ## 161  6587132           76    2569              682             1473
    ## 162  1074145           73    1643              204              508
    ## 163  6000000           81    1955              329              749
    ## 164  1034956           38     609              126              238
    ## 165  4096950           35     771              142              343
    ## 166  7377500           78    2198              396              890
    ## 167 12800000           41    1187              123              356
    ## 168  5374320           51    1728              399              814
    ## 169  6286408           72    2335              333              720
    ## 170  4788840           50    1134              242              471
    ## 171   600000           35     249               26               89
    ## 172  2703960           54     626               67              115
    ## 173 13253012           82    2157              359              869
    ## 174  3210840           82    1764              295              729
    ## 175  4540525           75    2045              268              604
    ## 176  2898000           64    1501              146              321
    ## 177 26540100           81    2947              674             1533
    ## 178  4000000           76    2085              368              769
    ## 179  1551659           48     381               44               92
    ## 180   980431           52     457               62              117
    ## 181  1825200           29     220               25               58
    ## 182   980431           77    2101              250              500
    ## 183 10470000           64    1362              157              346
    ## 184  1286160           42     558               58              151
    ## 185    63938            9     115               16               38
    ## 186  5000000           74    1068              174              329
    ## 187  1551659           74    1365              105              243
    ## 188  1403611           77     739              208              319
    ## 189  4743000           78    1341              192              423
    ## 190 15000000           69    1534              220              558
    ## 191  8800000           82    2657              402              909
    ## 192  1015696           51     432               55              103
    ## 193   980431           78    1490              146              311
    ## 194  6511628           62    1143              226              491
    ## 195 11483254           36     883              175              400
    ## 196  1643040           63    1028              128              301
    ## 197  9424084            3      71               11               32
    ## 198 17552209           76    2809              570             1252
    ## 199 17000000           46    1015               99              201
    ## 200  6540000           36     738              103              256
    ## 201   980431           52    1138              154              362
    ## 202  2250000           82    1972              204              451
    ## 203 11000000           78    1843              273              626
    ## 204  1052342           33     135               26               72
    ## 205   165952           19     122               10               16
    ## 206   600000           12      53                9               16
    ## 207  4826160           31     786              200              429
    ## 208  1709720           20     241               37               92
    ## 209 12517606           58    1123              159              309
    ## 210 16957900           78    2836              647             1435
    ## 211   161483            4      34                8               15
    ## 212 10991957           75    1944              310              646
    ## 213  5000000           78    1232              114              262
    ## 214 14382022           80    2066              391              702
    ## 215   874636           78    1392              177              421
    ## 216 12500000           82    2397              477             1071
    ## 217   173094           19     442              105              218
    ## 218  3911380            7      47                5               13
    ## 219  1223653           25     141               15               34
    ## 220   392478           17     247               23               57
    ## 221  1191480            2      31                6               11
    ## 222  5782450           22     381               44              118
    ## 223   874636           53    1614              202              513
    ## 224 11286518           67    2190              405              894
    ## 225  1987440           62     842              101              223
    ## 226  3267120           74    2132              377              773
    ## 227  1514160           24     518               75              162
    ## 228  3000000           64    1177              174              379
    ## 229  1015696           82    1639              233              538
    ## 230  2593440           18     625               80              225
    ## 231  1921320           20     584              120              236
    ## 232  3333333           20     293               46              101
    ## 233  5960160           82    3030              802             1479
    ## 234 17638063           74    2474              636             1311
    ## 235   543471           42     386               62              158
    ## 236  3094014           75    1538              260              508
    ## 237 12000000           79    2739              643             1449
    ## 238 12078652           61    1296              228              415
    ## 239 15730338           73    1963              295              721
    ## 240  3678319           76    2529              370              928
    ## 241 26540100           62    2070              551             1026
    ## 242 21165675           60    1885              370              867
    ## 243  1800000           49     559              109              198
    ## 244  1182840           53     447               56              107
    ## 245 15200000           29     889              150              333
    ## 246 16663575           78    2649              644             1376
    ## 247  8046500           71    1419              216              392
    ## 248  3872520           78    1333              118              313
    ## 249  4000000           56     689               87              214
    ## 250  4317720           66    2164              443              985
    ## 251  1192080           72    1020               93              209
    ## 252  5239437           35     859              131              269
    ## 253 12000000           60    2244              426              918
    ## 254  3900000           79    1229              215              413
    ## 255  4837500           32     385               34               83
    ## 256   543471           14      44                4               14
    ## 257 17638063           72    2525              671             1420
    ## 258 20575005           72    2335              500             1049
    ## 259  4000000            6     132               18               44
    ## 260  6191000           46     968               97              244
    ## 261  5200000           19     375               42              104
    ## 262  1207680           63    1442              190              361
    ## 263  4000000           61     871               77              168
    ## 264  4000000           67     963              172              392
    ## 265 30963450           74    2794              736             1344
    ## 266  7000000           23     591              102              264
    ## 267  2203000           80    1787              191              378
    ## 268  1921320           57    1088              103              156
    ## 269  1227000           68    1065              113              281
    ## 270 18000000           56    1486              164              424
    ## 271  1439880           22     198               28               68
    ## 272   925000           75    1982              290              635
    ## 273  2500000           73    1248              145              388
    ## 274  1627320           22     165               33               73
    ## 275 14000000           69    1291              171              439
    ## 276 21165675           74    2531              532             1160
    ## 277 12000000           82    2556              390              674
    ## 278  6333333           74    1778              264              615
    ## 279    31969            5      48                2                7
    ## 280  4625000           79    2565              421             1007
    ## 281  3578880           79    2399              269              749
    ## 282  3909840           65     960              117              330
    ## 283  7400000           76    2374              406              889
    ## 284  2941440           82    1743              284              632
    ## 285  1403611           82    1286              244              548
    ## 286   543471           21     170               16               30
    ## 287 12250000           76    2295              297              704
    ## 288  2328530           27     632               99              181
    ## 289   383351           20     410               38               90
    ## 290  9607500           76    1986              208              534
    ## 291  8988764           77    2223              314              624
    ## 292   543471           32     331               39               86
    ## 293  1551659           25     160               19               68
    ## 294  9213484           74    1222              146              378
    ## 295  1403611           56     935              216              406
    ## 296  3183526           45     846              112              306
    ## 297   650000            9      32                1               10
    ## 298 13000000           81    2349              295              618
    ## 299 26540100           69    2292              464             1009
    ## 300  4837500           30     475               57              130
    ## 301  3500000           20     151                9               23
    ## 302  1015696           70    1237              170              337
    ## 303 12500000           13     174               14               24
    ## 304  2898000           68    1016              158              369
    ## 305 10500000           70    1133              156              418
    ## 306 10770000           74    1998              247              557
    ## 307  1000000           58    1064              225              345
    ## 308  2463840           81    2541              444              869
    ## 309  3800000           65    1190              151              356
    ## 310  4384490           22     483               77              134
    ## 311  3750000           20     128               14               23
    ## 312  5443918           60    1556              272              633
    ## 313 20869566           77    2617              393              975
    ## 314   543471           54     521               52              141
    ## 315  2993040           80    2188              251              634
    ## 316  1358500           73    2038              494              856
    ## 317  5782450           70    1679              258              625
    ## 318 11750000           75    2163              483             1031
    ## 319  2751360           74    1265              130              270
    ## 320   874636           76    1368              227              506
    ## 321   247991           13     125               16               52
    ## 322   210995           35     471               33               87
    ## 323  9904494           31     482               31               65
    ## 324   138414           13     222               19               39
    ## 325  5893981           80    2605              414              803
    ## 326  5300000           24     609               52              128
    ## 327  1196040           55     859              103              205
    ## 328   874636           39     316               37               72
    ## 329    31969            5      43                0                7
    ## 330  6000000           67    2058              228              543
    ## 331   543471           71    1074              106              245
    ## 332  6050000           65    1599              154              384
    ## 333  3578948           80    1754              273              622
    ## 334 15500000           64    1627              303              604
    ## 335 18314532           75    2689              622             1349
    ## 336 20072033           69    2343              430              972
    ## 337  3500000           25     277               28               70
    ## 338   750000           44     843               88              221
    ## 339  1790902           32     510               65              153
    ## 340    63938            9     111               22               41
    ## 341 14000000           69    1843              229              561
    ## 342  1052342           29     219               19               43
    ## 343  6000000           50     811              100              263
    ## 344  2500000           69    1284              118              325
    ## 345  1811040           41     458               57              156
    ## 346   937800           40     346               41               91
    ## 347  1551659           80    1700              221              514
    ## 348  2255644           31     467               54              128
    ## 349 14956522           52    1424              284              677
    ## 350  2500000           79    1614              153              343
    ## 351  1025831           57    1193              230              412
    ## 352 13550000           75    2469              261              650
    ## 353  1015696           67    2119              292              732
    ## 354 13219250           81    2271              382              775
    ## 355  1406520           59    1593              272              666
    ## 356   543471           78    1966              190              460
    ## 357   543471           52     857               82              217
    ## 358  1395600           78    1761              235              542
    ## 359   282595           14     134                4               24
    ## 360  5000000            6      11                2                3
    ## 361 13333333           30    1013              201              442
    ## 362  2121288           81    2744              413              623
    ## 363 26540100           81    2802              824             1941
    ## 364 18735364           72    2116              323              773
    ## 365   418228           16     110                8               28
    ## 366   874636           73     905               88              137
    ## 367  1720560           77    1419              203              429
    ## 368  1410598           42     408               42              136
    ## 369   980431           70    1754              305              735
    ## 370   543471           64     973               77              223
    ## 371 12250000           23     712              128              279
    ## 372  8000000           68    1518              210              536
    ## 373  2898000           70    2029              338              703
    ## 374  3046299           78    1516              288              598
    ## 375  1350120           53     512               73              183
    ## 376  5782450           76    1345              173              316
    ## 377    89513           18     234               61              109
    ## 378   543471           30     287               30               75
    ## 379  2433334           55    1205              170              381
    ## 380  1188840           33     612              117              218
    ## 381 11241218           80    2374              183              477
    ## 382   726672           59    1334              134              302
    ## 383  6348759           19     171               30               59
    ## 384  2969880           77    1371              129              365
    ## 385 12112359           79    2638              675             1443
    ## 386   950000           19     108               10               31
    ## 387  3140517           80    2389              374              655
    ## 388   874636           81    2133              236              512
    ## 389  2128920           66    2048              403              814
    ## 390  8950000           23     487               89              179
    ## 391  6191000           67    1091              150              294
    ## 392 10000000           24     748              115              267
    ## 393  1906440           74    1263              151              411
    ## 394  3850000           62    1596              174              395
    ## 395 14153652           74    2237              362              687
    ## 396  1050961           48     560              105              196
    ## 397  2568600           57     562               83              181
    ## 398  8550000            8      76               14               31
    ## 399  2090000           65    1525              163              404
    ## 400  2281605           79    2154              415              912
    ## 401   543471           16      80               13               29
    ## 402 16000000           54    1104              169              328
    ## 403  1326960           69    1190              145              361
    ## 404 17200000           82    2567              511             1063
    ## 405  2870813           57     719               61              146
    ## 406  5505618           71    1914              274              595
    ## 407 14445313           63    1587              265              569
    ## 408  2368327           80    2336              246              541
    ## 409   543471           27     189               19               40
    ## 410  7806971           80    2773              326              798
    ## 411  9250000           71    1754              305              591
    ## 412  3386598           57     703              116              255
    ## 413  2340600           71    1158              159              439
    ## 414 15330435           78    2336              262              437
    ## 415  3332940           67    1183              185              495
    ## 416   150000            6     139               22               44
    ## 417  1315448           69    1732              237              522
    ## 418  1733880           22     392               65              144
    ## 419  5628000           73    2178              357              824
    ## 420   918369           61    1123              184              437
    ## 421  8000000           51     525               78              158
    ## 422 10661286           14     314               59              143
    ## 423 12415000           47    1298              153              228
    ## 424  1339680           60     774               75              181
    ## 425  4000000           17     130               11               23
    ## 426  6552960           67    2222              412              932
    ## 427  4264057           73    1799              193              490
    ## 428  1793760           33     405               36              115
    ## 429  6000000           62    1500              231              555
    ## 430    83119           11     189               20               50
    ## 431  5628000           68     810               73              200
    ## 432 17100000           73    2495              333              847
    ## 433  3533333           60    1705              295              667
    ## 434  3551160           75    1421              255              481
    ## 435  1015696           71    1031              162              285
    ## 436  1375000           72    1324              246              465
    ## 437 11200000           71    2197              433              940
    ## 438   207798           36    1046              142              345
    ## 439  2240880           47    1749              326              710
    ## 440 10361445           73    1786              433              964
    ## 441  2898000           70    1268              164              307
    ##     field_goals_perc points3_made points3_atts points3_perc points2_made
    ## 1              0.405            5           10        0.500           12
    ## 2              0.403           48          128        0.375           73
    ## 3              0.454           77          267        0.288          316
    ## 4              0.426            3           15        0.200           20
    ## 5              0.473           86          242        0.355          293
    ## 6              0.499            0            1        0.000          235
    ## 7              0.393           70          212        0.330          113
    ## 8              0.375           14           44        0.318           16
    ## 9              0.517            0            1        0.000          138
    ## 10             0.399           25           76        0.329           74
    ## 11             0.393           94          247        0.381           40
    ## 12             0.497            3           12        0.250          227
    ## 13             0.463            6           19        0.316           19
    ## 14             0.500            0            4        0.000           89
    ## 15             0.468          134          302        0.444          169
    ## 16             0.576           27           66        0.409          186
    ## 17             0.530            2            7        0.286          481
    ## 18             0.528           64          177        0.362          155
    ## 19             0.464           45          184        0.245          170
    ## 20             0.325           43          156        0.276           74
    ## 21             0.382            2           11        0.182           11
    ## 22             0.452          103          289        0.356          606
    ## 23             0.504           40          134        0.299          730
    ## 24             0.414            6           14        0.429            6
    ## 25             0.442           90          230        0.391           65
    ## 26             0.557            4           13        0.308           30
    ## 27             0.513            0            0           NA          143
    ## 28             0.440           62          151        0.411          123
    ## 29             0.442          111          299        0.371          212
    ## 30             0.463          108          277        0.390          251
    ## 31             0.625            1            3        0.333            4
    ## 32             0.430           65          170        0.382          115
    ## 33             0.467           11           32        0.344           81
    ## 34             0.528            0            0           NA          179
    ## 35             0.493           38          113        0.336          441
    ## 36             0.545            0            0           NA           72
    ## 37             0.383           14           35        0.400            9
    ## 38             0.488           32           96        0.333          151
    ## 39             0.457           45          115        0.391           62
    ## 40             0.446           20           81        0.247          126
    ## 41             0.482          223          552        0.404          414
    ## 42             0.615            0            1        0.000           83
    ## 43             0.575            1            3        0.333          106
    ## 44             0.402           55          187        0.294          221
    ## 45             0.274           11           52        0.212           18
    ## 46             0.398           45          139        0.324          164
    ## 47             0.374           44          114        0.386           26
    ## 48             0.377           17           44        0.386           29
    ## 49             0.435            1            7        0.143           19
    ## 50             0.286            0            0           NA            2
    ## 51             0.474          134          387        0.346          421
    ## 52             0.375            2            6        0.333            4
    ## 53             0.364           17           53        0.321           19
    ## 54             0.480           59          138        0.428           83
    ## 55             0.480          185          440        0.420          507
    ## 56             0.434          169          409        0.413          112
    ## 57             0.387           32          105        0.305           64
    ## 58             0.333           11           34        0.324           10
    ## 59             0.450           59          184        0.321          112
    ## 60             0.433          151          421        0.359          451
    ## 61             0.338           25           93        0.269           50
    ## 62             0.458          137          335        0.409          101
    ## 63             0.389           10           32        0.313           18
    ## 64             0.474            0            0           NA           36
    ## 65             0.714            0            0           NA            5
    ## 66             0.000            0            1        0.000            0
    ## 67             0.476          124          302        0.411          250
    ## 68             0.522            0            5        0.000           12
    ## 69             0.643            0            0           NA          362
    ## 70             0.571            0            1        0.000          253
    ## 71             0.523            0            0           NA           45
    ## 72             0.438            5           24        0.208           48
    ## 73             0.452           48          135        0.356          251
    ## 74             0.456          108          269        0.401          213
    ## 75             0.577            0            0           NA          128
    ## 76             0.377           95          274        0.347          100
    ## 77             0.405          135          384        0.352          216
    ## 78             0.375            0            2        0.000            3
    ## 79             0.500            0            0           NA            8
    ## 80             0.444          214          578        0.370          447
    ## 81             0.352           20           64        0.313           11
    ## 82             0.444            0            0           NA           12
    ## 83             0.447          126          325        0.388          209
    ## 84             0.392          118          311        0.379           58
    ## 85             0.485           71          181        0.392          103
    ## 86             0.426           44          149        0.295          111
    ## 87             0.411          106          341        0.311          275
    ## 88             0.442           53          117        0.453           42
    ## 89             0.476           73          175        0.417          267
    ## 90             0.373           12           46        0.261           35
    ## 91             0.590            0            0           NA          248
    ## 92             0.580            1            5        0.200           46
    ## 93             0.536            3            8        0.375          132
    ## 94             0.440           69          173        0.399           34
    ## 95             0.714            0            2        0.000          412
    ## 96             0.500            0            1        0.000            3
    ## 97             0.480            1           18        0.056           46
    ## 98             0.431            9           23        0.391           41
    ## 99             0.422           10           30        0.333           39
    ## 100            0.467           33          124        0.266          688
    ## 101            0.452           36           96        0.375          106
    ## 102            0.401          109          320        0.341          111
    ## 103            0.750            1            1        1.000            2
    ## 104            0.451          100          294        0.340          448
    ## 105            0.354           73          208        0.351           29
    ## 106            0.463           22           53        0.415           46
    ## 107            0.487            3           10        0.300          200
    ## 108            0.562            3           11        0.273           65
    ## 109            0.471           13           60        0.217          447
    ## 110            0.505           21           52        0.404           33
    ## 111            0.423          147          405        0.363          459
    ## 112            0.399           58          177        0.328           78
    ## 113            0.622            0            0           NA          161
    ## 114            0.511            0            0           NA           24
    ## 115            0.231            0            0           NA            3
    ## 116            0.424           85          215        0.395          196
    ## 117            0.437           79          209        0.378          217
    ## 118            0.399           51          159        0.321          141
    ## 119            0.413           11           47        0.234           46
    ## 120            0.372           56          191        0.293           68
    ## 121            0.452           21           58        0.362           35
    ## 122            0.354           28          101        0.277           29
    ## 123            0.418           81          263        0.308          191
    ## 124            0.633            0            2        0.000          388
    ## 125            0.515           21           74        0.284          173
    ## 126            0.434           45          145        0.310          369
    ## 127            0.457           77          208        0.370          206
    ## 128            0.528            0            0           NA           75
    ## 129            0.750            0            0           NA            3
    ## 130            0.471           40          146        0.274          390
    ## 131            0.143            0            2        0.000            1
    ## 132            0.377           56          177        0.316          152
    ## 133            0.545            5           38        0.132          397
    ## 134            0.434          104          310        0.335          345
    ## 135            0.406          246          661        0.372          166
    ## 136            0.412           32           92        0.348           61
    ## 137            0.439          128          360        0.356          280
    ## 138            0.426           31          118        0.263          204
    ## 139            0.399          116          354        0.328          204
    ## 140            0.351           11           29        0.379           28
    ## 141            0.424           82          220        0.373          101
    ## 142            0.503          107          255        0.420          213
    ## 143            0.477           94          233        0.403          195
    ## 144            0.250            1           12        0.083            8
    ## 145            0.549            0            2        0.000           56
    ## 146            0.409           39          111        0.351           56
    ## 147            0.423           61          173        0.353          173
    ## 148            0.521           49          180        0.272          607
    ## 149            0.475          117          289        0.405          417
    ## 150            0.471          149          374        0.398          396
    ## 151            0.502           16           43        0.372          316
    ## 152            0.533            0            4        0.000          387
    ## 153            0.468           78          222        0.351          521
    ## 154            0.557            0            0           NA          542
    ## 155            0.359           10           35        0.286           13
    ## 156            0.487           61          163        0.374          150
    ## 157            0.586            0            0           NA           65
    ## 158            0.411           94          261        0.360          107
    ## 159            0.364           25           94        0.266           38
    ## 160            0.143            0            2        0.000            1
    ## 161            0.463          245          646        0.379          437
    ## 162            0.402           44          149        0.295          160
    ## 163            0.439           28          105        0.267          301
    ## 164            0.529            0            3        0.000          126
    ## 165            0.414           53          148        0.358           89
    ## 166            0.445          201          468        0.429          195
    ## 167            0.346           95          271        0.351           28
    ## 168            0.490           65          178        0.365          334
    ## 169            0.463          157          394        0.398          176
    ## 170            0.514            0            0           NA          242
    ## 171            0.292           13           51        0.255           13
    ## 172            0.583            0            0           NA           67
    ## 173            0.413          116          322        0.360          243
    ## 174            0.405          115          344        0.334          180
    ## 175            0.444          106          273        0.388          162
    ## 176            0.455           51          137        0.372           95
    ## 177            0.440          262          756        0.347          412
    ## 178            0.479           87          256        0.340          281
    ## 179            0.478           31           66        0.470           13
    ## 180            0.530            2            8        0.250           60
    ## 181            0.431           12           35        0.343           13
    ## 182            0.500           55          145        0.379          195
    ## 183            0.454           77          203        0.379           80
    ## 184            0.384            9           25        0.360           49
    ## 185            0.421            3            9        0.333           13
    ## 186            0.529           37           78        0.474          137
    ## 187            0.432           73          171        0.427           32
    ## 188            0.652            0            4        0.000          208
    ## 189            0.454           46          135        0.341          146
    ## 190            0.394           53          193        0.275          167
    ## 191            0.442           90          252        0.357          312
    ## 192            0.534            0            1        0.000           55
    ## 193            0.469           43          114        0.377          103
    ## 194            0.460           41          146        0.281          185
    ## 195            0.438           58          156        0.372          117
    ## 196            0.425           49          134        0.366           79
    ## 197            0.344            2            5        0.400            9
    ## 198            0.455           91          248        0.367          479
    ## 199            0.493            0            1        0.000           99
    ## 200            0.402           56          137        0.409           47
    ## 201            0.425           85          221        0.385           69
    ## 202            0.452          123          279        0.441           81
    ## 203            0.436          106          258        0.411          167
    ## 204            0.361            5           23        0.217           21
    ## 205            0.625            0            0           NA           10
    ## 206            0.563            1            4        0.250            8
    ## 207            0.466           36           98        0.367          164
    ## 208            0.402            6           20        0.300           31
    ## 209            0.515            0            1        0.000          159
    ## 210            0.451           89          272        0.327          558
    ## 211            0.533            1            3        0.333            7
    ## 212            0.480           49          167        0.293          261
    ## 213            0.435           45          130        0.346           69
    ## 214            0.557            1            2        0.500          390
    ## 215            0.420           30          102        0.294          147
    ## 216            0.445          117          356        0.329          360
    ## 217            0.482           37           95        0.389           68
    ## 218            0.385            0            0           NA            5
    ## 219            0.441            0            1        0.000           15
    ## 220            0.404            8           30        0.267           15
    ## 221            0.545            2            4        0.500            4
    ## 222            0.373           13           31        0.419           31
    ## 223            0.394           75          227        0.330          127
    ## 224            0.453          100          281        0.356          305
    ## 225            0.453           46          112        0.411           55
    ## 226            0.488           17           63        0.270          360
    ## 227            0.463           21           72        0.292           54
    ## 228            0.459           55          181        0.304          119
    ## 229            0.433           97          273        0.355          136
    ## 230            0.356            7           35        0.200           73
    ## 231            0.508            0            1        0.000          120
    ## 232            0.455           11           39        0.282           35
    ## 233            0.542          101          275        0.367          701
    ## 234            0.485          147          386        0.381          489
    ## 235            0.392            7           22        0.318           55
    ## 236            0.512           68          192        0.354          192
    ## 237            0.444          240          602        0.399          403
    ## 238            0.549            0            6        0.000          228
    ## 239            0.409           92          266        0.346          203
    ## 240            0.399          153          437        0.350          217
    ## 241            0.537          117          312        0.375          434
    ## 242            0.427          145          389        0.373          225
    ## 243            0.551            0            2        0.000          109
    ## 244            0.523            2            9        0.222           54
    ## 245            0.450           45          104        0.433          105
    ## 246            0.468          268          647        0.414          376
    ## 247            0.551            0            1        0.000          216
    ## 248            0.377           21           73        0.288           97
    ## 249            0.407           19           54        0.352           68
    ## 250            0.450          112          314        0.357          331
    ## 251            0.445           15           40        0.375           78
    ## 252            0.487           97          200        0.485           34
    ## 253            0.464          193          468        0.412          233
    ## 254            0.521            2           17        0.118          213
    ## 255            0.410            7           37        0.189           27
    ## 256            0.286            4           13        0.308            0
    ## 257            0.473          177          441        0.401          494
    ## 258            0.477           23           56        0.411          477
    ## 259            0.409            5            8        0.625           13
    ## 260            0.398           38           85        0.447           59
    ## 261            0.404           19           40        0.475           23
    ## 262            0.526           10           36        0.278          180
    ## 263            0.458            0            1        0.000           77
    ## 264            0.439           35           98        0.357          137
    ## 265            0.548          124          342        0.363          612
    ## 266            0.386           41          129        0.318           61
    ## 267            0.505           43          110        0.391          148
    ## 268            0.660            3           12        0.250          100
    ## 269            0.402           87          210        0.414           26
    ## 270            0.387           51          165        0.309          113
    ## 271            0.412            8           28        0.286           20
    ## 272            0.457           78          193        0.404          212
    ## 273            0.374           26          110        0.236          119
    ## 274            0.452            9           28        0.321           24
    ## 275            0.390           89          227        0.392           82
    ## 276            0.459          104          268        0.388          428
    ## 277            0.579            0            2        0.000          390
    ## 278            0.429          102          283        0.360          162
    ## 279            0.286            1            2        0.500            1
    ## 280            0.418          118          357        0.331          303
    ## 281            0.359           94          332        0.283          175
    ## 282            0.355           43          144        0.299           74
    ## 283            0.457           71          196        0.362          335
    ## 284            0.449           72          224        0.321          212
    ## 285            0.445          103          277        0.372          141
    ## 286            0.533            0            0           NA           16
    ## 287            0.422          124          354        0.350          173
    ## 288            0.547            0            1        0.000           99
    ## 289            0.422           18           52        0.346           20
    ## 290            0.390           79          215        0.367          129
    ## 291            0.503           68          194        0.351          246
    ## 292            0.453            1            7        0.143           38
    ## 293            0.279            9           38        0.237           10
    ## 294            0.386           74          213        0.347           72
    ## 295            0.532           18           43        0.419          198
    ## 296            0.366           15           64        0.234           97
    ## 297            0.100            0            4        0.000            1
    ## 298            0.477            1            9        0.111          294
    ## 299            0.460          171          419        0.408          293
    ## 300            0.438           33           77        0.429           24
    ## 301            0.391            8           20        0.400            1
    ## 302            0.504           46          110        0.418          124
    ## 303            0.583            0            0           NA           14
    ## 304            0.428           54          168        0.321          104
    ## 305            0.373          104          305        0.341           52
    ## 306            0.443           43          135        0.319          204
    ## 307            0.652            1            7        0.143          224
    ## 308            0.511           40          115        0.348          404
    ## 309            0.424           56          177        0.316           95
    ## 310            0.575            0            0           NA           77
    ## 311            0.609            0            1        0.000           14
    ## 312            0.430          170          421        0.404          102
    ## 313            0.403          135          405        0.333          258
    ## 314            0.369           29           95        0.305           23
    ## 315            0.396          132          359        0.368          119
    ## 316            0.577           45          139        0.324          449
    ## 317            0.413          129          377        0.342          129
    ## 318            0.468           23           75        0.307          460
    ## 319            0.481            7           20        0.350          123
    ## 320            0.449           56          173        0.324          171
    ## 321            0.308            3           13        0.231           13
    ## 322            0.379           12           34        0.353           21
    ## 323            0.477            0            0           NA           31
    ## 324            0.487            2           10        0.200           17
    ## 325            0.516          148          341        0.434          266
    ## 326            0.406           24           60        0.400           28
    ## 327            0.502            1            7        0.143          102
    ## 328            0.514           17           33        0.515           20
    ## 329            0.000            0            5        0.000            0
    ## 330            0.420          110          288        0.382          118
    ## 331            0.433           41          123        0.333           65
    ## 332            0.401           94          253        0.372           60
    ## 333            0.439          147          356        0.413          126
    ## 334            0.502           56          104        0.538          247
    ## 335            0.461          195          496        0.393          427
    ## 336            0.442           75          241        0.311          355
    ## 337            0.400           15           43        0.349           13
    ## 338            0.398           33           99        0.333           55
    ## 339            0.425           36           83        0.434           29
    ## 340            0.537            6           12        0.500           16
    ## 341            0.408           50          133        0.376          179
    ## 342            0.442            0            0           NA           19
    ## 343            0.380           21           62        0.339           79
    ## 344            0.363           67          203        0.330           51
    ## 345            0.365           26           81        0.321           31
    ## 346            0.451           10           31        0.323           31
    ## 347            0.430           46          144        0.319          175
    ## 348            0.422           28           73        0.384           26
    ## 349            0.419           66          184        0.359          218
    ## 350            0.446           62          186        0.333           91
    ## 351            0.558           27           77        0.351          203
    ## 352            0.402           60          196        0.306          201
    ## 353            0.399          137          412        0.333          155
    ## 354            0.493            0            2        0.000          382
    ## 355            0.408          114          306        0.373          158
    ## 356            0.413           73          220        0.332          117
    ## 357            0.378           23           86        0.267           59
    ## 358            0.434           15           67        0.224          220
    ## 359            0.167            3           17        0.176            1
    ## 360            0.667            0            0           NA            2
    ## 361            0.455           42          113        0.372          159
    ## 362            0.663            0            1        0.000          413
    ## 363            0.425          200          583        0.343          624
    ## 364            0.418          204          506        0.403          119
    ## 365            0.286            4           10        0.400            4
    ## 366            0.642            1            3        0.333           87
    ## 367            0.473           60          187        0.321          143
    ## 368            0.309           23           74        0.311           19
    ## 369            0.415          105          308        0.341          200
    ## 370            0.345           12           63        0.190           65
    ## 371            0.459           41          103        0.398           87
    ## 372            0.392           92          252        0.365          118
    ## 373            0.481          137          322        0.425          201
    ## 374            0.482           49          146        0.336          239
    ## 375            0.399           34           92        0.370           39
    ## 376            0.547            1            3        0.333          172
    ## 377            0.560            7           19        0.368           54
    ## 378            0.400            7           30        0.233           23
    ## 379            0.446           37          120        0.308          133
    ## 380            0.537            3            8        0.375          114
    ## 381            0.384           94          270        0.348           89
    ## 382            0.444           38          101        0.376           96
    ## 383            0.508            9           26        0.346           21
    ## 384            0.353           45          154        0.292           84
    ## 385            0.468          324          789        0.411          351
    ## 386            0.323            0            0           NA           10
    ## 387            0.571            0            1        0.000          374
    ## 388            0.461           11           55        0.200          225
    ## 389            0.495           26           98        0.265          377
    ## 390            0.497            1            1        1.000           88
    ## 391            0.510            1            2        0.500          149
    ## 392            0.431           46          135        0.341           69
    ## 393            0.367           57          179        0.318           94
    ## 394            0.441           41          120        0.342          133
    ## 395            0.527           45          118        0.381          317
    ## 396            0.536            0            1        0.000          105
    ## 397            0.459           28           74        0.378           55
    ## 398            0.452            2            6        0.333           12
    ## 399            0.403           40          128        0.313          123
    ## 400            0.455          149          417        0.357          266
    ## 401            0.448            5           13        0.385            8
    ## 402            0.515            0            1        0.000          169
    ## 403            0.402           50          161        0.311           95
    ## 404            0.481          109          314        0.347          402
    ## 405            0.418            9           37        0.243           52
    ## 406            0.461           15           54        0.278          259
    ## 407            0.466           23           69        0.333          242
    ## 408            0.455          144          355        0.406          102
    ## 409            0.475            9           15        0.600           10
    ## 410            0.409          191          555        0.344          135
    ## 411            0.516           25           78        0.321          280
    ## 412            0.455           31           70        0.443           85
    ## 413            0.362           65          204        0.319           94
    ## 414            0.600            0            3        0.000          262
    ## 415            0.374          138          355        0.389           47
    ## 416            0.500            8           21        0.381           14
    ## 417            0.454           34          118        0.288          203
    ## 418            0.451           21           54        0.389           44
    ## 419            0.433           93          250        0.372          264
    ## 420            0.421           21           79        0.266          163
    ## 421            0.494            0            1        0.000           78
    ## 422            0.413           21           48        0.438           38
    ## 423            0.671            0            0           NA          153
    ## 424            0.414           26           73        0.356           49
    ## 425            0.478            0            3        0.000           11
    ## 426            0.442          127          352        0.361          285
    ## 427            0.394          112          296        0.378           81
    ## 428            0.313            3           22        0.136           33
    ## 429            0.416          149          394        0.378           82
    ## 430            0.400            3           21        0.143           17
    ## 431            0.365           29          118        0.246           44
    ## 432            0.393          174          479        0.363          159
    ## 433            0.442           87          235        0.370          208
    ## 434            0.530            0            2        0.000          255
    ## 435            0.568            1            4        0.250          161
    ## 436            0.529            4           15        0.267          242
    ## 437            0.461          110          326        0.337          323
    ## 438            0.412           60          149        0.403           82
    ## 439            0.459          120          310        0.387          206
    ## 440            0.449           21           94        0.223          412
    ## 441            0.534            0            2        0.000          164
    ##     points2_atts points2_perc points1_made points1_atts points1_perc
    ## 1             32        0.375            9           20        0.450
    ## 2            172        0.424           32           40        0.800
    ## 3            598        0.528          156          217        0.719
    ## 4             39        0.513           14           19        0.737
    ## 5            559        0.524          108          135        0.800
    ## 6            470        0.500           65           85        0.765
    ## 7            254        0.445           96          136        0.706
    ## 8             36        0.444           12           16        0.750
    ## 9            266        0.519           70          112        0.625
    ## 10           172        0.430           60           78        0.769
    ## 11            94        0.426           44           49        0.898
    ## 12           451        0.503          150          208        0.721
    ## 13            35        0.543            8           10        0.800
    ## 14           174        0.511           29           40        0.725
    ## 15           345        0.490          105          124        0.847
    ## 16           304        0.612           67          100        0.670
    ## 17           904        0.532          137          355        0.386
    ## 18           238        0.651           72          102        0.706
    ## 19           279        0.609           47          111        0.423
    ## 20           204        0.363          148          194        0.763
    ## 21            23        0.478            2            2        1.000
    ## 22          1281        0.473          412          542        0.760
    ## 23          1393        0.524          519          647        0.802
    ## 24            15        0.400           11           11        1.000
    ## 25           121        0.537           61           82        0.744
    ## 26            48        0.625           23           32        0.719
    ## 27           279        0.513           79           94        0.840
    ## 28           269        0.457           83           93        0.892
    ## 29           432        0.491          132          191        0.691
    ## 30           498        0.504           68           93        0.731
    ## 31             5        0.800            0            0           NA
    ## 32           249        0.462           70           93        0.753
    ## 33           165        0.491           32           34        0.941
    ## 34           339        0.528          125          234        0.534
    ## 35           858        0.514          320          421        0.760
    ## 36           132        0.545           47           58        0.810
    ## 37            25        0.360            2            2        1.000
    ## 38           279        0.541           39           59        0.661
    ## 39           119        0.521           71           76        0.934
    ## 40           246        0.512           26           35        0.743
    ## 41           770        0.538          282          342        0.825
    ## 42           134        0.619           23           35        0.657
    ## 43           183        0.579           77           88        0.875
    ## 44           499        0.443          133          214        0.621
    ## 45            54        0.333           12           17        0.706
    ## 46           386        0.425          132          154        0.857
    ## 47            73        0.356           13           18        0.722
    ## 48            78        0.372           33           39        0.846
    ## 49            39        0.487            9           13        0.692
    ## 50             7        0.286            0            0           NA
    ## 51           785        0.536          295          364        0.810
    ## 52            10        0.400            0            0           NA
    ## 53            46        0.413            5            6        0.833
    ## 54           158        0.525           35           43        0.814
    ## 55          1001        0.506          268          294        0.912
    ## 56           238        0.471           84           93        0.903
    ## 57           143        0.448           57           66        0.864
    ## 58            29        0.345            1            4        0.250
    ## 59           196        0.571           67           93        0.720
    ## 60           968        0.466          304          365        0.833
    ## 61           129        0.388           35           43        0.814
    ## 62           185        0.546           63           74        0.851
    ## 63            40        0.450           29           31        0.935
    ## 64            76        0.474           15           21        0.714
    ## 65             7        0.714            4            4        1.000
    ## 66             0           NA            1            2        0.500
    ## 67           483        0.518          232          260        0.892
    ## 68            18        0.667           11           15        0.733
    ## 69           563        0.643           94          177        0.531
    ## 70           442        0.572          133          196        0.679
    ## 71            86        0.523           15           22        0.682
    ## 72            97        0.495           18           24        0.750
    ## 73           526        0.477           94          122        0.770
    ## 74           435        0.490           85           98        0.867
    ## 75           222        0.577           60           93        0.645
    ## 76           243        0.412          131          161        0.814
    ## 77           483        0.447          147          188        0.782
    ## 78             6        0.500            3            4        0.750
    ## 79            16        0.500            3           10        0.300
    ## 80           910        0.491          488          545        0.895
    ## 81            24        0.458            0            0           NA
    ## 82            27        0.444            0            2        0.000
    ## 83           425        0.492          349          387        0.902
    ## 84           138        0.420           27           32        0.844
    ## 85           178        0.579           16           27        0.593
    ## 86           215        0.516           58           73        0.795
    ## 87           586        0.469          172          220        0.782
    ## 88            98        0.429           19           22        0.864
    ## 89           539        0.495          147          171        0.860
    ## 90            80        0.438           21           28        0.750
    ## 91           420        0.590           80          113        0.708
    ## 92            76        0.605           25           39        0.641
    ## 93           244        0.541           43           56        0.768
    ## 94            61        0.557           28           34        0.824
    ## 95           575        0.717          205          425        0.482
    ## 96             5        0.600            2            3        0.667
    ## 97            80        0.575            6           16        0.375
    ## 98            93        0.441           21           30        0.700
    ## 99            86        0.453           42           55        0.764
    ## 100         1421        0.484          545          647        0.842
    ## 101          218        0.486           94          121        0.777
    ## 102          229        0.485           89          117        0.761
    ## 103            3        0.667            3            6        0.500
    ## 104          921        0.486          218          255        0.855
    ## 105           80        0.363           14           18        0.778
    ## 106           94        0.489           21           25        0.840
    ## 107          407        0.491           67          109        0.615
    ## 108          110        0.591           29           41        0.707
    ## 109          917        0.487          221          253        0.874
    ## 110           55        0.600           27           39        0.692
    ## 111         1026        0.447          367          441        0.832
    ## 112          164        0.476          107          129        0.829
    ## 113          259        0.622           65           93        0.699
    ## 114           47        0.511           10           18        0.556
    ## 115           13        0.231            4            4        1.000
    ## 116          448        0.438           82          127        0.646
    ## 117          469        0.463           98          112        0.875
    ## 118          322        0.438           44           67        0.657
    ## 119           91        0.505           25           49        0.510
    ## 120          142        0.479           46           61        0.754
    ## 121           66        0.530           12           17        0.706
    ## 122           60        0.483            4           11        0.364
    ## 123          387        0.494          151          213        0.709
    ## 124          611        0.635          226          424        0.533
    ## 125          303        0.571          107          141        0.759
    ## 126          810        0.456          223          281        0.794
    ## 127          411        0.501           57           74        0.770
    ## 128          142        0.528           50           81        0.617
    ## 129            4        0.750            0            1        0.000
    ## 130          766        0.509          146          211        0.692
    ## 131            5        0.200            1            2        0.500
    ## 132          374        0.406          131          167        0.784
    ## 133          699        0.568          224          285        0.786
    ## 134          724        0.477          388          458        0.847
    ## 135          355        0.468          147          175        0.840
    ## 136          134        0.455           52           65        0.800
    ## 137          570        0.491          223          277        0.805
    ## 138          434        0.470           85          103        0.825
    ## 139          448        0.455          118          156        0.756
    ## 140           82        0.341           18           22        0.818
    ## 141          212        0.476           58           74        0.784
    ## 142          381        0.559          104          134        0.776
    ## 143          373        0.523          157          196        0.801
    ## 144           24        0.333            2            2        1.000
    ## 145          100        0.560           12           14        0.857
    ## 146          121        0.463           33           41        0.805
    ## 147          380        0.455          133          165        0.806
    ## 148         1079        0.563          471          612        0.770
    ## 149          835        0.499          298          377        0.790
    ## 150          782        0.506          362          429        0.844
    ## 151          618        0.511          136          167        0.814
    ## 152          722        0.536          177          239        0.741
    ## 153         1058        0.492          242          281        0.861
    ## 154          973        0.557          225          358        0.628
    ## 155           29        0.448            4            8        0.500
    ## 156          270        0.556           44           58        0.759
    ## 157          111        0.586           43           75        0.573
    ## 158          228        0.469           71           90        0.789
    ## 159           79        0.481           30           33        0.909
    ## 160            5        0.200            1            2        0.500
    ## 161          827        0.528          590          649        0.909
    ## 162          359        0.446           91          113        0.805
    ## 163          644        0.467           72          102        0.706
    ## 164          235        0.536           32           49        0.653
    ## 165          195        0.456           44           51        0.863
    ## 166          422        0.462          180          202        0.891
    ## 167           85        0.329           10           15        0.667
    ## 168          636        0.525          162          218        0.743
    ## 169          326        0.540          176          217        0.811
    ## 170          471        0.514          106          158        0.671
    ## 171           38        0.342           13           17        0.765
    ## 172          115        0.583           31           57        0.544
    ## 173          547        0.444          174          203        0.857
    ## 174          385        0.468          106          120        0.883
    ## 175          331        0.489           45           63        0.714
    ## 176          184        0.516           86          110        0.782
    ## 177          777        0.530          746          881        0.847
    ## 178          513        0.548          152          215        0.707
    ## 179           26        0.500           13           20        0.650
    ## 180          109        0.550           21           42        0.500
    ## 181           23        0.565            6            9        0.667
    ## 182          355        0.549          134          167        0.802
    ## 183          143        0.559           43           65        0.662
    ## 184          126        0.389           40           50        0.800
    ## 185           29        0.448            5            7        0.714
    ## 186          251        0.546           35           51        0.686
    ## 187           72        0.444           24           29        0.828
    ## 188          315        0.660           56          111        0.505
    ## 189          288        0.507           85          124        0.685
    ## 190          365        0.458          145          168        0.863
    ## 191          657        0.475          360          415        0.867
    ## 192          102        0.539           36           48        0.750
    ## 193          197        0.523           86          139        0.619
    ## 194          345        0.536          110          129        0.853
    ## 195          244        0.480          115          141        0.816
    ## 196          167        0.473           65           73        0.890
    ## 197           27        0.333            9           10        0.900
    ## 198         1004        0.477          585          676        0.865
    ## 199          200        0.495           34           78        0.436
    ## 200          119        0.395           65           74        0.878
    ## 201          141        0.489           35           49        0.714
    ## 202          172        0.471           50           68        0.735
    ## 203          368        0.454           63           77        0.818
    ## 204           49        0.429           11           15        0.733
    ## 205           16        0.625            5            8        0.625
    ## 206           12        0.667            3            6        0.500
    ## 207          331        0.495          191          244        0.783
    ## 208           72        0.431            9           15        0.600
    ## 209          308        0.516           74          107        0.692
    ## 210         1163        0.480          422          527        0.801
    ## 211           12        0.583            1            2        0.500
    ## 212          479        0.545           98          113        0.867
    ## 213          132        0.523           26           37        0.703
    ## 214          700        0.557          176          217        0.811
    ## 215          319        0.461           99          132        0.750
    ## 216          715        0.503          134          168        0.798
    ## 217          123        0.553           20           26        0.769
    ## 218           13        0.385            2            2        1.000
    ## 219           33        0.455            8           14        0.571
    ## 220           27        0.556            7            8        0.875
    ## 221            7        0.571            0            1        0.000
    ## 222           87        0.356            6            9        0.667
    ## 223          286        0.444           60           77        0.779
    ## 224          613        0.498          119          168        0.708
    ## 225          111        0.495           57           76        0.750
    ## 226          710        0.507          204          282        0.723
    ## 227           90        0.600           32           41        0.780
    ## 228          198        0.601           39           52        0.750
    ## 229          265        0.513           66           80        0.825
    ## 230          190        0.384           29           47        0.617
    ## 231          235        0.511           64           97        0.660
    ## 232           62        0.565           23           28        0.821
    ## 233         1204        0.582          356          428        0.832
    ## 234          925        0.529          469          533        0.880
    ## 235          136        0.404           35           49        0.714
    ## 236          316        0.608           90          123        0.732
    ## 237          847        0.476          304          359        0.847
    ## 238          409        0.557          131          189        0.693
    ## 239          455        0.446          119          168        0.708
    ## 240          491        0.442          154          185        0.832
    ## 241          714        0.608          336          384        0.875
    ## 242          478        0.471          257          295        0.871
    ## 243          196        0.556           14           22        0.636
    ## 244           98        0.551           21           34        0.618
    ## 245          229        0.459           81           92        0.880
    ## 246          729        0.516          186          218        0.853
    ## 247          391        0.552           38           62        0.613
    ## 248          240        0.404           36           59        0.610
    ## 249          160        0.425           64           82        0.780
    ## 250          671        0.493          198          252        0.786
    ## 251          169        0.462           45           57        0.789
    ## 252           69        0.493           14           15        0.933
    ## 253          450        0.518          299          365        0.819
    ## 254          396        0.538           64           83        0.771
    ## 255           46        0.587           13           17        0.765
    ## 256            1        0.000            1            2        0.500
    ## 257          979        0.505          297          328        0.905
    ## 258          993        0.480          220          271        0.812
    ## 259           36        0.361            2            3        0.667
    ## 260          159        0.371           43           51        0.843
    ## 261           64        0.359           11           12        0.917
    ## 262          325        0.554           59           80        0.738
    ## 263          167        0.461           23           33        0.697
    ## 264          294        0.466           40           45        0.889
    ## 265         1002        0.611          358          531        0.674
    ## 266          135        0.452           98          113        0.867
    ## 267          268        0.552           59           87        0.678
    ## 268          144        0.694           44           67        0.657
    ## 269           71        0.366           11           15        0.733
    ## 270          259        0.436           46           63        0.730
    ## 271           40        0.500           15           19        0.789
    ## 272          442        0.480          109          126        0.865
    ## 273          278        0.428           75           93        0.806
    ## 274           45        0.533            8           10        0.800
    ## 275          212        0.387           86          107        0.804
    ## 276          892        0.480          278          332        0.837
    ## 277          672        0.580          103          159        0.648
    ## 278          332        0.488          150          168        0.893
    ## 279            5        0.200            9           10        0.900
    ## 280          650        0.466          145          185        0.784
    ## 281          417        0.420          203          250        0.812
    ## 282          186        0.398           40           50        0.800
    ## 283          693        0.483          180          215        0.837
    ## 284          408        0.520          113          181        0.624
    ## 285          271        0.520          120          137        0.876
    ## 286           30        0.533            8           19        0.421
    ## 287          350        0.494          131          150        0.873
    ## 288          180        0.550           47           76        0.618
    ## 289           38        0.526           20           23        0.870
    ## 290          319        0.404           82           96        0.854
    ## 291          430        0.572           77          124        0.621
    ## 292           79        0.481           19           26        0.731
    ## 293           30        0.333           10           16        0.625
    ## 294          165        0.436           35           40        0.875
    ## 295          363        0.545           78          105        0.743
    ## 296          242        0.401           58           77        0.753
    ## 297            6        0.167            2            2        1.000
    ## 298          609        0.483          152          194        0.784
    ## 299          590        0.497          316          368        0.859
    ## 300           53        0.453           22           26        0.846
    ## 301            3        0.333            2            2        1.000
    ## 302          227        0.546           49           64        0.766
    ## 303           24        0.583            3            4        0.750
    ## 304          201        0.517           55           68        0.809
    ## 305          113        0.460           35           45        0.778
    ## 306          422        0.483           93          128        0.727
    ## 307          338        0.663           76          121        0.628
    ## 308          754        0.536          245          303        0.809
    ## 309          179        0.531           45           61        0.738
    ## 310          134        0.575           34           48        0.708
    ## 311           22        0.636            5            8        0.625
    ## 312          212        0.481           77           90        0.856
    ## 313          570        0.453          243          284        0.856
    ## 314           46        0.500           17           22        0.773
    ## 315          275        0.433          122          150        0.813
    ## 316          717        0.626          188          228        0.825
    ## 317          248        0.520           99          128        0.773
    ## 318          956        0.481          107          160        0.669
    ## 319          250        0.492           60           94        0.638
    ## 320          333        0.514          126          159        0.792
    ## 321           39        0.333            8           10        0.800
    ## 322           53        0.396           20           22        0.909
    ## 323           65        0.477           23           39        0.590
    ## 324           29        0.586            5            8        0.625
    ## 325          462        0.576           99          119        0.832
    ## 326           68        0.412           11           16        0.688
    ## 327          198        0.515           22           32        0.688
    ## 328           39        0.513            7            9        0.778
    ## 329            2        0.000            0            0           NA
    ## 330          255        0.463           73           95        0.768
    ## 331          122        0.533           29           37        0.784
    ## 332          131        0.458           43           60        0.717
    ## 333          266        0.474           66           80        0.825
    ## 334          500        0.494          130          184        0.707
    ## 335          853        0.501          336          374        0.898
    ## 336          731        0.486          311          405        0.768
    ## 337           27        0.481           10           13        0.769
    ## 338          122        0.451           31           40        0.775
    ## 339           70        0.414           43           57        0.754
    ## 340           29        0.552            2            3        0.667
    ## 341          428        0.418           30           50        0.600
    ## 342           43        0.442           21           29        0.724
    ## 343          201        0.393           91          118        0.771
    ## 344          122        0.418           54           63        0.857
    ## 345           75        0.413            2            5        0.400
    ## 346           60        0.517            8            9        0.889
    ## 347          370        0.473           50           64        0.781
    ## 348           55        0.473            5            7        0.714
    ## 349          493        0.442          118          136        0.868
    ## 350          157        0.580           80          108        0.741
    ## 351          335        0.606           72          103        0.699
    ## 352          454        0.443          254          285        0.891
    ## 353          320        0.484          143          174        0.822
    ## 354          773        0.494           75          104        0.721
    ## 355          360        0.439           90          115        0.783
    ## 356          240        0.488           44           71        0.620
    ## 357          131        0.450           28           43        0.651
    ## 358          475        0.463          190          253        0.751
    ## 359            7        0.143            3            4        0.750
    ## 360            3        0.667            0            0           NA
    ## 361          329        0.483          118          138        0.855
    ## 362          622        0.664          311          476        0.653
    ## 363         1358        0.459          710          840        0.845
    ## 364          267        0.446          129          150        0.860
    ## 365           18        0.222            5            6        0.833
    ## 366          134        0.649           36           61        0.590
    ## 367          242        0.591           38           68        0.559
    ## 368           62        0.306           17           24        0.708
    ## 369          427        0.468          204          242        0.843
    ## 370          160        0.406           17           31        0.548
    ## 371          176        0.494           30           34        0.882
    ## 372          284        0.415           18           27        0.667
    ## 373          381        0.528           85          100        0.850
    ## 374          452        0.529          147          190        0.774
    ## 375           91        0.429           38           49        0.776
    ## 376          313        0.550           42           60        0.700
    ## 377           90        0.600           19           35        0.543
    ## 378           45        0.511           23           27        0.852
    ## 379          261        0.510           53           77        0.688
    ## 380          210        0.543           52           74        0.703
    ## 381          207        0.430          103          128        0.805
    ## 382          201        0.478          126          159        0.792
    ## 383           33        0.636           14           18        0.778
    ## 384          211        0.398           36           53        0.679
    ## 385          654        0.537          325          362        0.898
    ## 386           31        0.323            3            5        0.600
    ## 387          654        0.572          157          257        0.611
    ## 388          457        0.492           73           90        0.811
    ## 389          716        0.527          119          154        0.773
    ## 390          178        0.494           28           39        0.718
    ## 391          292        0.510           82          109        0.752
    ## 392          132        0.523           23           27        0.852
    ## 393          232        0.405           51           66        0.773
    ## 394          275        0.484           55           75        0.733
    ## 395          569        0.557           45           86        0.523
    ## 396          195        0.538           31           66        0.470
    ## 397          107        0.514           32           49        0.653
    ## 398           25        0.480            9           11        0.818
    ## 399          276        0.446           98          129        0.760
    ## 400          495        0.537          164          214        0.766
    ## 401           16        0.500            0            3        0.000
    ## 402          327        0.517           63           78        0.808
    ## 403          200        0.475          105          123        0.854
    ## 404          749        0.537          190          226        0.841
    ## 405          109        0.477           23           33        0.697
    ## 406          541        0.479           80          130        0.615
    ## 407          500        0.484           85          117        0.726
    ## 408          186        0.548           47           58        0.810
    ## 409           25        0.400           10           15        0.667
    ## 410          243        0.556           93          126        0.738
    ## 411          513        0.546           74          110        0.673
    ## 412          185        0.459           22           29        0.759
    ## 413          235        0.400           57           79        0.722
    ## 414          434        0.604          106          213        0.498
    ## 415          140        0.336           43           54        0.796
    ## 416           23        0.609            6            7        0.857
    ## 417          404        0.502          173          217        0.797
    ## 418           90        0.489           19           22        0.864
    ## 419          574        0.460          195          254        0.768
    ## 420          358        0.455           55           71        0.775
    ## 421          157        0.497           22           39        0.564
    ## 422           95        0.400           24           34        0.706
    ## 423          228        0.671           91          124        0.734
    ## 424          108        0.454           33           43        0.767
    ## 425           20        0.550            9           15        0.600
    ## 426          580        0.491          116          154        0.753
    ## 427          194        0.418           88          115        0.765
    ## 428           93        0.355           31           37        0.838
    ## 429          161        0.509           37           43        0.860
    ## 430           29        0.586           12           18        0.667
    ## 431           82        0.537           11           17        0.647
    ## 432          368        0.432          146          179        0.816
    ## 433          432        0.481          143          190        0.753
    ## 434          479        0.532          101          151        0.669
    ## 435          281        0.573           49           88        0.557
    ## 436          450        0.538           91          125        0.728
    ## 437          614        0.526          141          194        0.727
    ## 438          196        0.418           64           73        0.877
    ## 439          400        0.515          117          140        0.836
    ## 440          870        0.474          141          193        0.731
    ## 441          305        0.538           98          126        0.778
    ##     off_rebounds def_rebounds assists steals blocks turnovers fouls
    ## 1              8           28       4      1     13        10    21
    ## 2             18           51     125     25      9        66    93
    ## 3            116          289     150     64     40        89   172
    ## 4              9           24       7      8      7         8    32
    ## 5             95          369     337     52     87       116   138
    ## 6             75          203      57     19     16        33   125
    ## 7             77          374      99     60     44        94   102
    ## 8              3           21      11      3      0         7    35
    ## 9             94          198      23     27     32        37   125
    ## 10            17          103      30     18      5        35    50
    ## 11            18           68      40     37      8        33   114
    ## 12           156          354      44     37     98       102   242
    ## 13            11           18       5      3      2         3    14
    ## 14            46          131      12     20     22        31    77
    ## 15            19          206      93     54     20        62   171
    ## 16           117          248     140     52     62        77   211
    ## 17           345          771      89    124     89       152   237
    ## 18            51          253     262     76     39        58    97
    ## 19            98          304      79     94     79        51   204
    ## 20            23          113     198     54     20        85   194
    ## 21             4           23       3      5      0         6    18
    ## 22           103          226     189     82     30       187   183
    ## 23           174          712     157     94    167       181   168
    ## 24             1            1       6      2      0         0     4
    ## 25            51          188      77     33     20        56   109
    ## 26             7           21      23      4      4        14     7
    ## 27           111          222      32     17     39        50   166
    ## 28             9          116      78     21      7        42   104
    ## 29            20          141     204     48     10       115   187
    ## 30            65          269     121     68     11        88   141
    ## 31             0            1       0      1      1         0     5
    ## 32            19          111      51     29      6        62   108
    ## 33             6           51     131     13      0        37    29
    ## 34           157          410      74     25     91        95   202
    ## 35           111          385     300     58     23       142   157
    ## 36            46           84       9      6     12        10    25
    ## 37             0            6      14      1      0         5     5
    ## 38            75          220      35     16     11        37    94
    ## 39            14           66      21     10      4        38    47
    ## 40            46          112     170     18      9        87    83
    ## 41            53          186     267     83     21       157   169
    ## 42            31           47      15     11     20        10    42
    ## 43            43           86      21     14     11        29    45
    ## 44            60          257     166     50     36       116   158
    ## 45             8           36     108     15      0        22    32
    ## 46            25           93     130     27      5        89    87
    ## 47            16           83      45     22     23        28    42
    ## 48             5           34      52      9      1        26    18
    ## 49             8           14      16      9      0         5    12
    ## 50             1            2       1      2      1         1     0
    ## 51           121          282     176     38    124       184   192
    ## 52             5            5       4      2      1         2     4
    ## 53             2           21      23      1      0        11    20
    ## 54            16           87      44     20      2        53    34
    ## 55            60          231     285     72     42       172   202
    ## 56            30          199      48     46     25        40   151
    ## 57            16           73     114     43      2        47    84
    ## 58             1           16      15      4      0        13    14
    ## 59            23          165     110     49      8        59    91
    ## 60            62          374     213     60     34       153   198
    ## 61             6           78      55     20      5        24    52
    ## 62            37          253      45     33     37        53   138
    ## 63             6           21      28      6      1        16    28
    ## 64            23           50       4      4      7         7    17
    ## 65             2            8       3      3      1         4     6
    ## 66             0            2       0      1      0         1     0
    ## 67            41          263     563    118      8       147   146
    ## 68            14           15       2      3      6         7    11
    ## 69           178          348      64     34     80        87   179
    ## 70           135          270      99     62     58        65   189
    ## 71            51          107      25     25     23        17    85
    ## 72            11           41      36     24      8        19    29
    ## 73            52          184     265     66     13       109   140
    ## 74            53          207     179     81     23        69   141
    ## 75           124          187      40     25     16        33   110
    ## 76            15          102     209     31      1        90   101
    ## 77            31          191     303     87     16       176   130
    ## 78             1            1       1      0      0         1     1
    ## 79             9           14       0      1      4         6    15
    ## 80            46          322     439     68     20       197   152
    ## 81             5           20      20     12      1         9    31
    ## 82             5           17       3      2      0         3    17
    ## 83            39          287     136     41     15        81    93
    ## 84            31          193     124     71     58        76   120
    ## 85            56          221      36     39     28        28   100
    ## 86            30          102     112     21     12        80   146
    ## 87           112          402     182     57     30       183   162
    ## 88            25           87      42     19     21        36    76
    ## 89            23          130     312     67      9       114   119
    ## 90             2           31      33     11      2        28    39
    ## 91           148          292     124     31     40        82   125
    ## 92            16           46      14     13      7        11    36
    ## 93            47          156     151     42     48        78   105
    ## 94            22           77      46     20     28        32    75
    ## 95           297          817      96     52    135       116   212
    ## 96             3            4       0      2      0         0     3
    ## 97            14           45      28      8      5        16    21
    ## 98             6           36      48      8      6        38    29
    ## 99            16           32      57     27     11        25    31
    ## 100           70          316     290     78     13       180   134
    ## 101           38          174      66     25     19        62    75
    ## 102           63          212      74     81     27        54   143
    ## 103            2            2       3      0      0         0     0
    ## 104           42          206     499     74     16       258   149
    ## 105           11          140      63     30      7        49    86
    ## 106            1           44      86      6      6        40    42
    ## 107           92          213      56     45     40        60   103
    ## 108           39           40      12     14     13        13    63
    ## 109           66          180     283     44     17       147    84
    ## 110            3           54      14      5      2        14    27
    ## 111           46          203     268     72     21       241   242
    ## 112           11          116     136     43      7        57   101
    ## 113          129          366      44     37     61        61   180
    ## 114           20           40       2      3     17         8    40
    ## 115            1            5       0      0      1         2     5
    ## 116           18          136     200     41     20       103    95
    ## 117           23          330      82     30     38        51   113
    ## 118           45          242      82     39     32        83   200
    ## 119           26           75      34     18     11        31    55
    ## 120           55          166      67     52     25        45   125
    ## 121            6           43      13      2      1         6    22
    ## 122           23           80      23     10     22        32    74
    ## 123           98          501     533    154    106       184   217
    ## 124          296          644     104     64     92       170   203
    ## 125           94          213      49     61     39        34   135
    ## 126           64          207     229     86     41       138   112
    ## 127           33          119     164     50     32        62   131
    ## 128           96          147      27     15     22        37   137
    ## 129            4            6       1      0      6         2     3
    ## 130           89          298     529     88     40       178   177
    ## 131            3            3       1      0      0         2     2
    ## 132           30          150     217     41     13       123    95
    ## 133          195          287      67     32     38       123   154
    ## 134           52          268     418     92     31       223   164
    ## 135           29          172     188     48     40       121   150
    ## 136           42          109      43     22      8        34    73
    ## 137           44          165     202     66      4       141   180
    ## 138           36          211     205     53     24       100   121
    ## 139           57          279     162     47     34        76   139
    ## 140            4           38      35     17      2        15    36
    ## 141           32          151     169     84     28        78   141
    ## 142           48          130     164     71      8        76    92
    ## 143           23          144     203     50     11        85   114
    ## 144            2           15       5      3      0         5     6
    ## 145           24           62      20      3     17        24    44
    ## 146           17           68      33      9      7        25    48
    ## 147           34          151     112     41     15        62   129
    ## 148          142          558     434    131    151       234   246
    ## 149           61          217     423     89     13       212   199
    ## 150           49          344     252     73     20       140   117
    ## 151          188          459     158     88     95       107   254
    ## 152          167          365     187     92     38       140   168
    ## 153           94          303     117     66     15       102   128
    ## 154          293          795      57     56    161       154   226
    ## 155            8           33       7      1      1        14     6
    ## 156           22          100      90     39      8        55    77
    ## 157           47          103      19     33     24        34    90
    ## 158           39          180     109     62     27        78   150
    ## 159            6           43      37     22      1        20    35
    ## 160            1            2       3      1      1         0     6
    ## 161           43          162     449     70     13       210   167
    ## 162           32          152     192     42     36       142   175
    ## 163           21          214     418     61     33       112   127
    ## 164           41          118      30     14     33        30    66
    ## 165            9           75     193     14      1        63    30
    ## 166           11          160     110     55     13        98   125
    ## 167           17           96      62     40     11        26    77
    ## 168           79          235     142     51     22        92   111
    ## 169           48          367     155     72     23        79   161
    ## 170           81          159      58     20     49        91   122
    ## 171            6           18      11      9      3        11    22
    ## 172           78           87      12     18     20        29   113
    ## 173           17          112     213     59     14       134   115
    ## 174           41          173     170     53     24       113   124
    ## 175           28          164     385     53      8       129   197
    ## 176           69          190      64     46     19        59   165
    ## 177           95          564     906    120     37       464   215
    ## 178           66          309     276     76     86       171   197
    ## 179            3           35      14      7     10        10    37
    ## 180           34           56      17     18     29        19    47
    ## 181            6           20       4     10      2         4    15
    ## 182          167          377      84     46     34        94   248
    ## 183           31          194     121     42     16        72   154
    ## 184           42          120       8     17      9        28    91
    ## 185            8           14       9      2      4         3     8
    ## 186           64          194      37     21     55        58   168
    ## 187           15           91      98     45     20        36    95
    ## 188          100          144      17     19     67        40   109
    ## 189           45          175      64     35     18        68   142
    ## 190           39          175      81     37     13        75   103
    ## 191           33          298     639    100     32       216   165
    ## 192           52           69       7     16     32        14    52
    ## 193           38          161      46     33     75        41   144
    ## 194           30          234      75     27     23        40    98
    ## 195           11          124     184     41     14        86    79
    ## 196           17           94     120     47      8        44    93
    ## 197            3            9      13      0      0         9     4
    ## 198          128          342     417    143     32       159   112
    ## 199          161          241     103     30     37        58   127
    ## 200            5           72      45     34      4        36    41
    ## 201           16          131      54     30      8        55   121
    ## 202           23          237     224     96      8       107   163
    ## 203           33          209     144     35     18        69    93
    ## 204            1           16      15      4      0         5     5
    ## 205            8           23       3      2      6         4    11
    ## 206            4           13       2      1      2         2     1
    ## 207           61          182      66     27     76       117   112
    ## 208           21           47      19      7      0        16    12
    ## 209           92          203      57     29     78        53   151
    ## 210           58          268     831    157     49       323   151
    ## 211            4            4       4      0      0         3     6
    ## 212          102          300     111     31     26        66   145
    ## 213           60          213      71     26     17        39   122
    ## 214          226          533      57     37     63       106   216
    ## 215           20          140     126     47     25        76   146
    ## 216           49          197     213     88      8       164   150
    ## 217            4           30      57     11      2        25    30
    ## 218            8            6       0      1      0         4     9
    ## 219           13           21       7      3      6         9    12
    ## 220            7           25      37      4      0        15    14
    ## 221            4            5       3      0      3         0     0
    ## 222           23           51      50     10      4        23    31
    ## 223           35          133     140     60     39        65   132
    ## 224           46          218     488    100     43       194   133
    ## 225           43          144      29     29     12        31    62
    ## 226          151          485     264     49     37       173   248
    ## 227           30           66      34     13      7        26    45
    ## 228           71          191      55     29     43        43    91
    ## 229           27          198     102     65     31        66   109
    ## 230           23           71      66     27      6        33    52
    ## 231           65          142      63     25     38        62    73
    ## 232            9           43       9     12     10        19    25
    ## 233          296          711     220     57    103       212   241
    ## 234           80          350     260    132     55       154   122
    ## 235            3           38      58     18      7        31    38
    ## 236           72          288     148     43     29        96   207
    ## 237           45          263     435     85     22       168   119
    ## 238          180          279      55     43     40        58   124
    ## 239           45          186     177     91     52       125   165
    ## 240           55          193     193     89     12        86   118
    ## 241           39          474     300     66     99       138   117
    ## 242          148          518     116     53     22       122   125
    ## 243           41          101      23      7     20        29    66
    ## 244           44           80      29     14     17        17    64
    ## 245           11          112      99     41      7        65    79
    ## 246           49          236     160     66     40       128   139
    ## 247          118          285      47     36     48        61   172
    ## 248           24          142     188     78     36        89   178
    ## 249           60          146      29     15     21        28    69
    ## 250          111          364      97     47    130       118   244
    ## 251           33          175      91     51     26        39    63
    ## 252            7           90      35     11      8        29    60
    ## 253           48          239     417     88     19       173   170
    ## 254          157          282     117     36    104        76   174
    ## 255            8           40       9      7      5        11    29
    ## 256            4            6       2      3      1         5     4
    ## 257           52          178     418     83     25       180   157
    ## 258          174          350     139     46     89        98   158
    ## 259            1           23      25      3      2        11    12
    ## 260           32          110      35     21      5        25    85
    ## 261            7           28      28      6      1        18    20
    ## 262          120          249      96     82     40        56   149
    ## 263          105          115      57     18     24        29    78
    ## 264           15           89      81     31      8        48    82
    ## 265           97          543     646     92     44       303   134
    ## 266           12           58      56     15      9        40    25
    ## 267           47          127      39     81     35        47   122
    ## 268           82          161      42     52     90        46   137
    ## 269           13          129      36     21     11        25   118
    ## 270           63          232      74     48     20        43    61
    ## 271            3           20      11      5      1         8    23
    ## 272           47          166     317     84     12       113   140
    ## 273           11          113     193     39      1        95   112
    ## 274            5           12      11      7      0         8    10
    ## 275           28          129     183     82     16        96   119
    ## 276           60          402     338     67     99       166   171
    ## 277          238          611     121     40     65       118   213
    ## 278           14          164     147     44      9        70    90
    ## 279            1            8       3      1      0         2     5
    ## 280           77          289     160     52     25        87   168
    ## 281           78          228     364    125     34       159   192
    ## 282           20          126      62     30     14        58    74
    ## 283          107          385     126     82     42       129   254
    ## 284           96          252      60     67     70       108   263
    ## 285           88          285      66     23     41        69   229
    ## 286           23           28      10      4      4        12    23
    ## 287           89          409     106     58     53        60   134
    ## 288           50          123      70     19     29        46    77
    ## 289           15           76      45     12      9        24    47
    ## 290           24          123     357     53      0       133   153
    ## 291          125          216      89     85     70        85   214
    ## 292           22           42       8     15      8        12    30
    ## 293            5           15      11      9      2         7    18
    ## 294           27          209      71     13     28        35   172
    ## 295           40          153      53     28     27        66    92
    ## 296           24          128     113     38     23        66   102
    ## 297            2            1       2      0      0         0     2
    ## 298          156          409     114     81     77        56   187
    ## 299           31          211     433     92     19       156   126
    ## 300           13           55      30      9      5        14    35
    ## 301            3           36      22      2      0        13     9
    ## 302           76          164      95     30     41        55    97
    ## 303           15           27       3      7      4         8    25
    ## 304           47           79      69     29     11        51    79
    ## 305           11          151      48     12     13        37   109
    ## 306           19          185     236     79     27       135   149
    ## 307           81          138      64     20     42        44   126
    ## 308          139          448     106     74    173       105   262
    ## 309           57          187      79     40     20        59   154
    ## 310           47          103      20     22     25        22    55
    ## 311            9           21      12      2      2         4    17
    ## 312           25          112      58     37     14        36   137
    ## 313           46          435     455     86     29       194   109
    ## 314           26           69      47     17      8        26    43
    ## 315           21          205     188     46     32       128   144
    ## 316          212          503     358     60     55       171   214
    ## 317           61          323      75     53     56        79   128
    ## 318          176          603     208     77     74       117   180
    ## 319          131          256      31     30     27        64   154
    ## 320           26          142      82     51     14        70   127
    ## 321            0           11      14      8      0         7    18
    ## 322           25           57      21     10     10        18    52
    ## 323           48          115      15      5     10        14    51
    ## 324            6           14      11     13      2        10    24
    ## 325          118          397     121    116     41        43   193
    ## 326           23          106      26     31      5        14    53
    ## 327           64          122      17     26     45        33   109
    ## 328           10           42      28      6      2        17    23
    ## 329            1            6       0      0      0         3     4
    ## 330           95          299     281     99     25       100   222
    ## 331           22           79      77     32     15        36    62
    ## 332           62          229      76     40     23        38   120
    ## 333           24          118     280     65      3       101   109
    ## 334          107          394     150     24     70        81   110
    ## 335           58          434     251    117     27       218   206
    ## 336          111          422     252     90     62       158   186
    ## 337            1           47      10      4      5        16    40
    ## 338           15          110      36     15     16        40    78
    ## 339           18           89      18     14     15        19    58
    ## 340            1            3      14      3      0         5     7
    ## 341           73          282     461     99     11       168   144
    ## 342           26           30       4      3      6         8    37
    ## 343           11           62     129     26      3        46    43
    ## 344            9          146     135     35      9        80    99
    ## 345            4           45      23     19     10        14    32
    ## 346            4           26      34     21      5        15    48
    ## 347           33          184     191     67     22        83   125
    ## 348           13           51      29     18      3        10    22
    ## 349           21           92     270     35      5       114   129
    ## 350           28          174      78     26     10        52   153
    ## 351           94          217      58     42     55        55   136
    ## 352           68          237     682    128     10       195   202
    ## 353           92          344     102    127     69       131   203
    ## 354          244          276      80     18    117        90   151
    ## 355           16          186      96     39     11        65   132
    ## 356           95          162     124     45     18        56   140
    ## 357           12           86     107     34      8        56    74
    ## 358           96          356     154     82     44       116   177
    ## 359            3            8      18     11      1         3    14
    ## 360            1            1       1      0      2         1     3
    ## 361           35          155      82     44     26        74    79
    ## 362          314          721      97     49    214       148   246
    ## 363          137          727     840    133     31       438   190
    ## 364          112          218      68     32     14        55   142
    ## 365            1           17       8      4      5         4     5
    ## 366           97          211      14     32     61        40   152
    ## 367           94          190      76     38     21        41    83
    ## 368           12           47      52     13      2        16    38
    ## 369           22          258     157     46      6       136   118
    ## 370           19           69     130     28      6        43    79
    ## 371           29          127      15      7     33        39    76
    ## 372           21          136     344     48      4       128    95
    ## 373           25          153     188     79      7        92   126
    ## 374           84          136      35     22      6        56    86
    ## 375            8           53      67     32      2        41    38
    ## 376           28          123     139     38     20        61   120
    ## 377           41           44      13      9      9        13    49
    ## 378            4           30      15      8      2         5    17
    ## 379           20          108     154     42      3        90   100
    ## 380           51          111      27     16     13        37    64
    ## 381           51          256     141     71     32        82   182
    ## 382           27          137     185     44     23        66   119
    ## 383            6           39      19      2      4         9    16
    ## 384           36          153     105     56     24        71   121
    ## 385           61          292     523    143     17       239   183
    ## 386           11           24       4      2      5         3    17
    ## 387          282          333      86     88     78       146   195
    ## 388           39          212     534    133     10       159   139
    ## 389          125          214      75     76     39        57   175
    ## 390           38           65      13     14     15        28    40
    ## 391          143          199      39     30     44        58   173
    ## 392            4           64      43     34     13        35    61
    ## 393           40          187     131     45     11        47    69
    ## 394           54          216     107     96     31        58    97
    ## 395          131          318     122    114     30        96   135
    ## 396           84          139      31     26      9        46    76
    ## 397           40           74      23     10     26        17    84
    ## 398            8           14       4      1      1         6     8
    ## 399           34          139     335     56      6       101   133
    ## 400           35          189     182     55     15       106   103
    ## 401            4           10      11      2      3        11     6
    ## 402          104          160      43     16     31        72   133
    ## 403           25          123      75     32     10        73   154
    ## 404           63          353     142     60     39        95   133
    ## 405           25           58      92     26      6        38    60
    ## 406          166          225      98    115     29       100   178
    ## 407            9          104     285     33      2        89    92
    ## 408           22          226      96     54     14        55   125
    ## 409            5           17       6      6      1         3    18
    ## 410           54          405     175    147     20        74   133
    ## 411          142          428     138     76     28       127   152
    ## 412            7           40     100     11      5        48    54
    ## 413           48          187      70     26     20        64    97
    ## 414          287          429      77     39     84        64   176
    ## 415           21           79      46     21      4        45    90
    ## 416            9           15       6      3      1         6    18
    ## 417           44          135     335     74      6       129   119
    ## 418            6           21      52     20      2        21    29
    ## 419           50          243     233     84     44        90   176
    ## 420           20           75     226     48      5        77    73
    ## 421           43           81      42      7     21        20    61
    ## 422            7           44      33     12      5        22    19
    ## 423          154          385      30     33     24        67   126
    ## 424           10           57     156     47      5        38    50
    ## 425            8           28       6      5      1         8    22
    ## 426           39          252     176     78     21       119   155
    ## 427           36          191     133     60     36        50   163
    ## 428           11           35      61     18      7        40    40
    ## 429           18          115      70     35      4        30    70
    ## 430            1           10      12      4      1         9    12
    ## 431           26          155      23     29     30        18    83
    ## 432           18          241     210     77     16       102   161
    ## 433           58          201     206     48     28        97   110
    ## 434           85          255      80     53     45        69   147
    ## 435          129          203      26     18     47        31   137
    ## 436          170          332      96     41     36       100   150
    ## 437          104          356     143     52     30       114   172
    ## 438           16           83     155     40      7        56    79
    ## 439           18          141     139     41     10        85   104
    ## 440          182          416     122     38     10        99   136
    ## 441          140          270     132     59     33        88   166

``` r
points1 <- summarise(group_by(combine, team), points = sum(points3_made) + sum(points2_made) + sum(points1_made))
points1
```

    ## # A tibble: 30 x 2
    ##     team points
    ##    <chr>  <int>
    ##  1   ATL   4253
    ##  2   BOS   4704
    ##  3   BRK   4069
    ##  4   CHI   4057
    ##  5   CHO   4409
    ##  6   CLE   4474
    ##  7   DAL   3599
    ##  8   DEN   4686
    ##  9   DET   4409
    ## 10   GSW   4969
    ## # ... with 20 more rows

``` r
ggplot(points1, aes(x = reorder(team, points), y = points)) + geom_bar(stat='identity') + labs(title = "NBA Teams ranked by Total Points", x="Team", y="Total Points") + coord_flip() + geom_hline(aes(yintercept = mean(points), color="red"))
```

![](hw03-selicia-hou_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-9-1.png)

``` r
combine1 <- mutate(combine, efficiency = (combine$points3_made + combine$points2_made + combine$points1_made + combine$off_rebounds + combine$def_rebounds + combine$assists + combine$steals + combine$blocks - (combine$field_goals_atts - combine$field_goals_made) - combine$turnovers)/combine$games_played)
combine1
```

    ##                       player team position height weight age experience
    ## 1               A.J. Hammons  DAL        C     84    260  24          0
    ## 2               Aaron Brooks  IND       PG     72    161  32          8
    ## 3               Aaron Gordon  ORL       SF     81    220  21          2
    ## 4              Adreian Payne  MIN       PF     82    237  25          2
    ## 5                 Al Horford  BOS        C     82    245  30          9
    ## 6               Al Jefferson  IND        C     82    289  32         12
    ## 7            Al-Farouq Aminu  POR       SF     81    220  26          6
    ## 8              Alan Anderson  LAC       SF     78    220  34          7
    ## 9              Alan Williams  PHO        C     80    260  24          1
    ## 10                Alec Burks  UTA       SG     78    214  25          5
    ## 11              Alex Abrines  OKC       SG     78    190  23          0
    ## 12                  Alex Len  PHO        C     85    260  23          3
    ## 13            Alex Poythress  PHI       PF     79    238  23          0
    ## 14             Alexis Ajinca  NOP        C     86    248  28          6
    ## 15              Allen Crabbe  POR       SG     78    210  24          3
    ## 16              Amir Johnson  BOS       PF     81    240  29         11
    ## 17            Andre Drummond  DET        C     83    279  23          4
    ## 18            Andre Iguodala  GSW       SF     78    215  33         12
    ## 19            Andre Roberson  OKC       SF     79    210  25          3
    ## 20           Andrew Harrison  MEM       PG     78    213  22          0
    ## 21          Andrew Nicholson  BRK       PF     81    250  27          4
    ## 22            Andrew Wiggins  MIN       SF     80    199  21          2
    ## 23             Anthony Davis  NOP        C     82    253  23          4
    ## 24            Anthony Morrow  CHI       SG     77    210  31          8
    ## 25          Anthony Tolliver  SAC       PF     80    240  31          8
    ## 26            Archie Goodwin  BRK       SG     77    200  22          3
    ## 27               Aron Baynes  DET        C     82    260  30          4
    ## 28             Arron Afflalo  SAC       SG     77    210  31          9
    ## 29             Austin Rivers  LAC       SG     76    200  24          4
    ## 30             Avery Bradley  BOS       SG     74    180  26          6
    ## 31              Axel Toupane  NOP       SF     79    197  24          1
    ## 32              Ben McLemore  SAC       SG     77    195  23          3
    ## 33                Beno Udrih  DET       PG     75    205  34         12
    ## 34           Bismack Biyombo  ORL        C     81    255  24          5
    ## 35             Blake Griffin  LAC       PF     82    251  27          6
    ## 36          Boban Marjanovic  DET        C     87    290  28          1
    ## 37               Bobby Brown  HOU       PG     74    175  32          2
    ## 38              Bobby Portis  CHI       PF     83    230  21          1
    ## 39          Bojan Bogdanovic  WAS       SF     80    216  27          2
    ## 40                Boris Diaw  UTA       PF     80    250  34         13
    ## 41              Bradley Beal  WAS       SG     77    207  23          4
    ## 42            Brandan Wright  MEM       PF     82    210  29          8
    ## 43              Brandon Bass  LAC       PF     80    250  31         11
    ## 44            Brandon Ingram  LAL       SF     81    190  19          0
    ## 45          Brandon Jennings  WAS       PG     73    170  27          7
    ## 46            Brandon Knight  PHO       SG     75    189  25          5
    ## 47              Brandon Rush  MIN       SG     78    220  31          8
    ## 48             Brian Roberts  CHO       PG     73    173  31          4
    ## 49             Briante Weber  CHO       PG     74    165  24          1
    ## 50             Brice Johnson  LAC       PF     82    230  22          0
    ## 51               Brook Lopez  BRK        C     84    275  28          8
    ## 52             Bruno Caboclo  TOR       SF     81    218  21          2
    ## 53               Bryn Forbes  SAS       SG     75    190  23          0
    ## 54               Buddy Hield  SAC       SG     76    214  23          0
    ## 55             C.J. McCollum  POR       SG     76    200  25          3
    ## 56                C.J. Miles  IND       SF     78    225  29         11
    ## 57               C.J. Watson  ORL       PG     74    175  32          9
    ## 58             Cameron Payne  CHI       PG     75    185  22          1
    ## 59              Caris LeVert  BRK       SF     79    203  22          0
    ## 60           Carmelo Anthony  NYK       SF     80    240  32         13
    ## 61          Chandler Parsons  MEM       SF     82    230  28          5
    ## 62             Channing Frye  CLE        C     83    255  33         10
    ## 63            Chasson Randle  NYK       PG     74    185  23          0
    ## 64             Cheick Diallo  NOP       PF     81    220  20          0
    ## 65            Chinanu Onuaku  HOU        C     82    245  20          0
    ## 66          Chris McCullough  WAS       PF     83    200  21          1
    ## 67                Chris Paul  LAC       PG     72    175  31         11
    ## 68            Christian Wood  CHO       PF     83    220  21          1
    ## 69              Clint Capela  HOU        C     82    240  22          2
    ## 70               Cody Zeller  CHO       PF     84    240  24          3
    ## 71              Cole Aldrich  MIN        C     83    250  28          6
    ## 72              Corey Brewer  LAL       SF     81    186  30          9
    ## 73               Cory Joseph  TOR       SG     75    193  25          5
    ## 74              Courtney Lee  NYK       SG     77    200  31          8
    ## 75         Cristiano Felicio  CHI        C     82    275  24          1
    ## 76             D.J. Augustin  ORL       PG     72    183  29          8
    ## 77          D'Angelo Russell  LAL       PG     77    195  20          1
    ## 78             Dahntay Jones  CLE       SF     78    225  36         12
    ## 79              Damian Jones  GSW        C     84    245  21          0
    ## 80            Damian Lillard  POR       PG     75    195  26          4
    ## 81              Damjan Rudez  ORL       SF     82    228  30          2
    ## 82             Daniel Ochefu  WAS        C     83    245  23          0
    ## 83          Danilo Gallinari  DEN       SF     82    225  28          7
    ## 84               Danny Green  SAS       SG     78    215  29          7
    ## 85          Dante Cunningham  NOP       SF     80    230  29          7
    ## 86                Dante Exum  UTA       PG     78    190  21          1
    ## 87               Dario Saric  PHI       PF     82    223  22          0
    ## 88            Darrell Arthur  DEN       PF     81    235  28          7
    ## 89           Darren Collison  SAC       PG     72    175  29          7
    ## 90           Darrun Hilliard  DET       SG     78    205  23          1
    ## 91                 David Lee  SAS       PF     81    245  33         11
    ## 92               David Nwaba  LAL       SG     76    209  24          0
    ## 93                David West  GSW        C     81    250  36         13
    ## 94             Davis Bertans  SAS       PF     82    210  24          0
    ## 95            DeAndre Jordan  LAC        C     83    265  28          8
    ## 96           DeAndre Liggins  DAL       SG     78    209  28          3
    ## 97           DeAndre' Bembry  ATL       SF     78    210  22          0
    ## 98           Dejounte Murray  SAS       PG     77    170  20          0
    ## 99              Delon Wright  TOR       PG     77    183  24          1
    ## 100            DeMar DeRozan  TOR       SG     79    221  27          7
    ## 101         DeMarcus Cousins  NOP        C     83    270  26          6
    ## 102          DeMarre Carroll  TOR       SF     80    215  30          7
    ## 103        Demetrius Jackson  BOS       PG     73    201  22          0
    ## 104          Dennis Schroder  ATL       PG     73    172  23          3
    ## 105         Denzel Valentine  CHI       SG     78    212  23          0
    ## 106           Deron Williams  CLE       PG     75    200  32         11
    ## 107           Derrick Favors  UTA       PF     82    265  25          6
    ## 108            Derrick Jones  PHO       SF     79    190  19          0
    ## 109             Derrick Rose  NYK       PG     75    190  28          7
    ## 110         Derrick Williams  CLE       PF     80    240  25          5
    ## 111             Devin Booker  PHO       SG     78    206  20          1
    ## 112             Devin Harris  DAL       PG     75    192  33         12
    ## 113           Dewayne Dedmon  SAS        C     84    245  27          3
    ## 114            Deyonta Davis  MEM        C     83    237  20          0
    ## 115            Diamond Stone  LAC        C     83    255  19          0
    ## 116             Dion Waiters  MIA       SG     76    225  25          4
    ## 117            Dirk Nowitzki  DAL       PF     84    245  38         18
    ## 118         Domantas Sabonis  OKC       PF     83    240  20          0
    ## 119       Donatas Motiejunas  NOP       PF     84    222  26          4
    ## 120      Dorian Finney-Smith  DAL       PF     80    220  23          0
    ## 121           Doug McDermott  OKC       SF     80    225  25          2
    ## 122            Dragan Bender  PHO       PF     85    225  19          0
    ## 123           Draymond Green  GSW       PF     79    230  26          4
    ## 124            Dwight Howard  ATL        C     83    265  31         12
    ## 125            Dwight Powell  DAL        C     83    240  25          2
    ## 126              Dwyane Wade  CHI       SG     76    220  35         13
    ## 127            E'Twaun Moore  NOP       SG     76    191  27          5
    ## 128                 Ed Davis  POR       PF     82    240  27          6
    ## 129              Edy Tavares  CLE        C     87    260  24          1
    ## 130            Elfrid Payton  ORL       PG     76    185  22          2
    ## 131           Elijah Millsap  PHO       SG     78    225  29          2
    ## 132          Emmanuel Mudiay  DEN       PG     77    200  20          1
    ## 133              Enes Kanter  OKC        C     83    245  24          5
    ## 134             Eric Bledsoe  PHO       PG     73    190  27          6
    ## 135              Eric Gordon  HOU       SG     76    215  28          8
    ## 136           Ersan Ilyasova  ATL       PF     82    235  29          8
    ## 137            Evan Fournier  ORL       SG     79    205  24          4
    ## 138              Evan Turner  POR       SF     79    220  28          6
    ## 139           Frank Kaminsky  CHO        C     84    242  23          1
    ## 140            Fred VanVleet  TOR       PG     72    195  22          0
    ## 141           Garrett Temple  SAC       SG     78    195  30          6
    ## 142              Gary Harris  DEN       SG     76    210  22          2
    ## 143              George Hill  UTA       PG     75    188  30          8
    ## 144            Georges Niang  IND       PF     80    230  23          0
    ## 145     Georgios Papagiannis  SAC        C     85    240  19          0
    ## 146             Gerald Green  BOS       SF     79    205  31          9
    ## 147         Gerald Henderson  PHI       SG     77    215  29          7
    ## 148    Giannis Antetokounmpo  MIL       SF     83    222  22          3
    ## 149             Goran Dragic  MIA       PG     75    190  30          8
    ## 150           Gordon Hayward  UTA       SF     80    226  26          6
    ## 151             Gorgui Dieng  MIN       PF     83    241  27          3
    ## 152              Greg Monroe  MIL        C     83    265  26          6
    ## 153          Harrison Barnes  DAL       PF     80    210  24          4
    ## 154         Hassan Whiteside  MIA        C     84    265  27          4
    ## 155           Henry Ellenson  DET       PF     83    245  20          0
    ## 156                Ian Clark  GSW       SG     75    175  25          3
    ## 157              Ian Mahinmi  WAS        C     83    250  30          8
    ## 158            Iman Shumpert  CLE       SG     77    220  26          5
    ## 159            Isaiah Canaan  CHI       SG     72    201  25          3
    ## 160            Isaiah Taylor  HOU       PG     75    170  22          0
    ## 161            Isaiah Thomas  BOS       PG     69    185  27          5
    ## 162         Isaiah Whitehead  BRK       PG     76    213  21          0
    ## 163                Ish Smith  DET       PG     72    175  28          6
    ## 164              Ivica Zubac  LAL        C     85    265  19          0
    ## 165               J.J. Barea  DAL       PG     72    185  32         10
    ## 166              J.J. Redick  LAC       SG     76    190  32         10
    ## 167               J.R. Smith  CLE       SG     78    225  31         12
    ## 168            Jabari Parker  MIL       PF     80    250  21          2
    ## 169              Jae Crowder  BOS       SF     78    235  26          4
    ## 170            Jahlil Okafor  PHI        C     83    275  21          1
    ## 171              Jake Layman  POR       SF     81    210  22          0
    ## 172             Jakob Poeltl  TOR        C     84    248  21          0
    ## 173           Jamal Crawford  LAC       SG     77    200  36         16
    ## 174             Jamal Murray  DEN       SG     76    207  19          0
    ## 175            Jameer Nelson  DEN       PG     72    190  34         12
    ## 176              James Ennis  MEM       SF     79    210  26          2
    ## 177             James Harden  HOU       PG     77    220  27          7
    ## 178            James Johnson  MIA       PF     81    250  29          7
    ## 179              James Jones  CLE       SF     80    218  36         13
    ## 180     James Michael McAdoo  GSW       PF     81    230  24          2
    ## 181              James Young  BOS       SG     78    215  21          2
    ## 182           JaMychal Green  MEM       PF     81    227  26          2
    ## 183             Jared Dudley  PHO       PF     79    225  31          9
    ## 184            Jarell Martin  MEM       PF     82    239  22          1
    ## 185            Jarrod Uthoff  DAL       PF     81    221  23          0
    ## 186              Jason Smith  WAS        C     84    245  30          8
    ## 187              Jason Terry  MIL       SG     74    185  39         17
    ## 188             JaVale McGee  GSW        C     84    270  29          8
    ## 189             Jaylen Brown  BOS       SF     79    225  20          0
    ## 190               Jeff Green  ORL       PF     81    235  30          8
    ## 191              Jeff Teague  IND       PG     74    186  28          7
    ## 192              Jeff Withey  UTA        C     84    231  26          3
    ## 193             Jerami Grant  OKC       SF     80    210  22          2
    ## 194              Jeremy Lamb  CHO       SG     77    185  24          4
    ## 195               Jeremy Lin  BRK       PG     75    200  28          6
    ## 196             Jerian Grant  CHI       PG     76    195  24          1
    ## 197           Jerryd Bayless  PHI       PG     75    200  28          8
    ## 198             Jimmy Butler  CHI       SF     79    220  27          5
    ## 199              Joakim Noah  NYK        C     83    230  31          9
    ## 200              Jodie Meeks  ORL       SG     76    210  29          7
    ## 201               Joe Harris  BRK       SG     78    219  25          2
    ## 202               Joe Ingles  UTA       SF     80    226  29          2
    ## 203              Joe Johnson  UTA       SF     79    240  35         15
    ## 204                Joe Young  IND       PG     74    180  24          1
    ## 205             Joel Anthony  SAS        C     81    245  34          9
    ## 206            Joel Bolomboy  UTA       PF     81    235  23          0
    ## 207              Joel Embiid  PHI        C     84    250  22          0
    ## 208        Joffrey Lauvergne  CHI        C     83    220  25          2
    ## 209              John Henson  MIL        C     83    229  26          4
    ## 210                John Wall  WAS       PG     76    195  26          6
    ## 211          Johnny O'Bryant  CHO       PF     81    257  23          2
    ## 212                Jon Leuer  DET       PF     82    228  27          5
    ## 213            Jonas Jerebko  BOS       PF     82    231  29          6
    ## 214        Jonas Valanciunas  TOR        C     84    265  24          4
    ## 215         Jonathon Simmons  SAS       SG     78    195  27          1
    ## 216          Jordan Clarkson  LAL       SG     77    194  24          2
    ## 217          Jordan Crawford  NOP       SG     76    195  28          4
    ## 218              Jordan Hill  MIN        C     82    235  29          7
    ## 219            Jordan Mickey  BOS       PF     80    235  22          1
    ## 220            Jose Calderon  ATL       PG     75    200  35         11
    ## 221             Josh Huestis  OKC       PF     79    230  25          1
    ## 222           Josh McRoberts  MIA       PF     82    240  29          9
    ## 223          Josh Richardson  MIA       SG     78    200  23          1
    ## 224             Jrue Holiday  NOP       PG     76    205  26          7
    ## 225         Juan Hernangomez  DEN       PF     81    230  21          0
    ## 226            Julius Randle  LAL       PF     81    250  22          2
    ## 227          Justin Anderson  PHI       SF     78    228  23          1
    ## 228          Justin Hamilton  BRK        C     84    260  26          2
    ## 229           Justin Holiday  NYK       SG     78    185  27          3
    ## 230          Justise Winslow  MIA       SF     79    225  20          1
    ## 231             Jusuf Nurkic  POR        C     84    280  22          2
    ## 232           K.J. McDaniels  BRK       SF     78    205  23          2
    ## 233       Karl-Anthony Towns  MIN        C     84    244  21          1
    ## 234            Kawhi Leonard  SAS       SF     79    230  25          5
    ## 235               Kay Felder  CLE       PG     69    176  21          0
    ## 236             Kelly Olynyk  BOS        C     84    238  25          3
    ## 237             Kemba Walker  CHO       PG     73    172  26          5
    ## 238           Kenneth Faried  DEN       PF     80    228  27          5
    ## 239            Kent Bazemore  ATL       SF     77    201  27          4
    ## 240 Kentavious Caldwell-Pope  DET       SG     77    205  23          3
    ## 241             Kevin Durant  GSW       SF     81    240  28          9
    ## 242               Kevin Love  CLE       PF     82    251  28          8
    ## 243           Kevin Seraphin  IND       PF     81    285  27          6
    ## 244             Kevon Looney  GSW        C     81    220  20          1
    ## 245          Khris Middleton  MIL       SF     80    234  25          4
    ## 246            Klay Thompson  GSW       SG     79    215  26          5
    ## 247             Kosta Koufos  SAC        C     84    265  27          8
    ## 248                Kris Dunn  MIN       PG     76    210  22          0
    ## 249           Kris Humphries  ATL       PF     81    235  31         12
    ## 250       Kristaps Porzingis  NYK       PF     87    240  21          1
    ## 251            Kyle Anderson  SAS       SG     81    230  23          2
    ## 252              Kyle Korver  CLE       SG     79    212  35         13
    ## 253               Kyle Lowry  TOR       PG     72    205  30         10
    ## 254             Kyle O'Quinn  NYK        C     82    250  26          4
    ## 255             Kyle Singler  OKC       SF     80    228  28          4
    ## 256             Kyle Wiltjer  HOU       PF     82    240  24          0
    ## 257             Kyrie Irving  CLE       PG     75    193  24          5
    ## 258        LaMarcus Aldridge  SAS       PF     83    260  31         10
    ## 259         Lance Stephenson  IND       SG     77    230  26          6
    ## 260             Lance Thomas  NYK       PF     80    235  28          5
    ## 261        Langston Galloway  SAC       PG     74    200  25          2
    ## 262          Larry Nance Jr.  LAL       PF     81    230  24          1
    ## 263              Lavoy Allen  IND       PF     81    260  27          5
    ## 264          Leandro Barbosa  PHO       SG     75    194  34         13
    ## 265             LeBron James  CLE       SF     80    250  32         13
    ## 266             Lou Williams  HOU       SG     73    175  30         11
    ## 267         Luc Mbah a Moute  LAC       SF     80    230  30          8
    ## 268           Lucas Nogueira  TOR        C     84    241  24          2
    ## 269             Luke Babbitt  MIA       SF     81    225  27          6
    ## 270                Luol Deng  LAL       SF     81    220  31         12
    ## 271       Malachi Richardson  SAC       SG     78    205  21          0
    ## 272          Malcolm Brogdon  MIL       SG     77    215  24          0
    ## 273          Malcolm Delaney  ATL       PG     75    190  27          0
    ## 274            Malik Beasley  DEN       SG     77    196  20          0
    ## 275            Manu Ginobili  SAS       SG     78    205  39         14
    ## 276               Marc Gasol  MEM        C     85    255  32          8
    ## 277            Marcin Gortat  WAS        C     83    240  32          9
    ## 278          Marco Belinelli  CHO       SG     77    210  30          9
    ## 279      Marcus Georges-Hunt  ORL       SG     77    216  22          0
    ## 280            Marcus Morris  DET       SF     81    235  27          5
    ## 281             Marcus Smart  BOS       SG     76    220  22          2
    ## 282            Mario Hezonja  ORL       SF     80    215  21          1
    ## 283          Markieff Morris  WAS       PF     82    245  27          5
    ## 284          Marquese Chriss  PHO       PF     82    233  19          0
    ## 285        Marreese Speights  LAC        C     82    255  29          8
    ## 286         Marshall Plumlee  NYK        C     84    250  24          0
    ## 287          Marvin Williams  CHO       PF     81    237  30         11
    ## 288            Mason Plumlee  DEN        C     83    245  26          3
    ## 289              Matt Barnes  GSW       SF     79    226  36         13
    ## 290      Matthew Dellavedova  MIL       PG     76    198  26          3
    ## 291         Maurice Harkless  POR       SF     81    215  23          4
    ## 292            Maurice Ndour  NYK       PF     81    200  24          0
    ## 293        Metta World Peace  LAL       SF     78    260  37         16
    ## 294           Meyers Leonard  POR       PF     85    245  24          4
    ## 295          Michael Beasley  MIL       PF     81    235  28          8
    ## 296  Michael Carter-Williams  CHI       PG     78    190  25          3
    ## 297          Michael Gbinije  DET       SG     79    200  24          0
    ## 298   Michael Kidd-Gilchrist  CHO       SF     79    232  23          4
    ## 299              Mike Conley  MEM       PG     73    175  29          9
    ## 300            Mike Dunleavy  ATL       SF     81    230  36         14
    ## 301              Mike Miller  DEN       SF     80    218  36         16
    ## 302             Mike Muscala  ATL        C     83    240  25          3
    ## 303            Miles Plumlee  CHO        C     83    249  28          4
    ## 304     Mindaugas Kuzminskas  NYK       SF     81    215  27          0
    ## 305          Mirza Teletovic  MIL       PF     81    242  31          4
    ## 306              Monta Ellis  IND       SG     75    185  31         11
    ## 307         Montrezl Harrell  HOU        C     80    240  23          1
    ## 308             Myles Turner  IND        C     83    243  20          1
    ## 309          Nemanja Bjelica  MIN       PF     82    240  28          1
    ## 310             Nerlens Noel  DAL        C     83    228  22          2
    ## 311            Nick Collison  OKC       PF     82    255  36         12
    ## 312               Nick Young  LAL       SG     79    210  31          9
    ## 313            Nicolas Batum  CHO       SG     80    200  28          8
    ## 314         Nicolas Brussino  DAL       SF     79    195  23          0
    ## 315             Nik Stauskas  PHI       SG     78    205  23          2
    ## 316             Nikola Jokic  DEN        C     82    250  21          1
    ## 317           Nikola Mirotic  CHI       PF     82    220  25          2
    ## 318           Nikola Vucevic  ORL        C     84    260  26          5
    ## 319              Noah Vonleh  POR       PF     82    240  21          2
    ## 320            Norman Powell  TOR       SG     76    215  23          1
    ## 321              Norris Cole  OKC       PG     74    175  28          5
    ## 322              Okaro White  MIA       PF     80    204  24          0
    ## 323                Omer Asik  NOP        C     84    255  30          6
    ## 324              Omri Casspi  MIN       SF     81    225  28          7
    ## 325              Otto Porter  WAS       SF     80    198  23          3
    ## 326              P.J. Tucker  TOR       SF     78    245  31          5
    ## 327            Pascal Siakam  TOR       PF     81    230  22          0
    ## 328          Pat Connaughton  POR       SG     77    206  24          1
    ## 329          Patricio Garino  ORL       SG     78    210  23          0
    ## 330         Patrick Beverley  HOU       SG     73    185  28          4
    ## 331            Patrick McCaw  GSW       SG     79    185  21          0
    ## 332        Patrick Patterson  TOR       PF     81    230  27          6
    ## 333              Patty Mills  SAS       PG     72    185  28          7
    ## 334                Pau Gasol  SAS        C     84    250  36         15
    ## 335              Paul George  IND       SF     81    220  26          6
    ## 336             Paul Millsap  ATL       PF     80    246  31         10
    ## 337              Paul Pierce  LAC       SF     79    235  39         18
    ## 338              Paul Zipser  CHI       SF     80    215  22          0
    ## 339               Quincy Acy  BRK       PF     79    240  26          4
    ## 340               Quinn Cook  NOP       PG     74    184  23          0
    ## 341              Rajon Rondo  CHI       PG     73    186  30         10
    ## 342         Rakeem Christmas  IND       PF     81    250  25          1
    ## 343           Ramon Sessions  CHO       PG     75    190  30          9
    ## 344               Randy Foye  BRK       SG     76    213  33         10
    ## 345            Rashad Vaughn  MIL       SG     78    202  20          1
    ## 346                Raul Neto  UTA       PG     73    179  24          1
    ## 347           Raymond Felton  LAC       PG     73    205  32         11
    ## 348           Reggie Bullock  DET       SF     79    205  25          3
    ## 349           Reggie Jackson  DET       PG     75    208  26          5
    ## 350        Richard Jefferson  CLE       SF     79    233  36         15
    ## 351           Richaun Holmes  PHI        C     82    245  23          1
    ## 352              Ricky Rubio  MIN       PG     76    194  26          5
    ## 353         Robert Covington  PHI       SF     81    215  26          3
    ## 354              Robin Lopez  CHI        C     84    255  28          8
    ## 355              Rodney Hood  UTA       SG     80    206  24          2
    ## 356          Rodney McGruder  MIA       SG     76    205  25          0
    ## 357                Ron Baker  NYK       SG     76    220  23          0
    ## 358  Rondae Hollis-Jefferson  BRK       SF     79    220  22          1
    ## 359             Ronnie Price  PHO       PG     74    190  33         11
    ## 360              Roy Hibbert  DEN        C     86    270  30          8
    ## 361                 Rudy Gay  SAC       SF     80    230  30         10
    ## 362              Rudy Gobert  UTA        C     85    245  24          3
    ## 363        Russell Westbrook  OKC       PG     75    200  28          8
    ## 364            Ryan Anderson  HOU       PF     82    240  28          8
    ## 365               Ryan Kelly  ATL       PF     83    230  25          3
    ## 366              Salah Mejri  DAL        C     85    245  30          1
    ## 367               Sam Dekker  HOU       SF     81    230  22          1
    ## 368            Sasha Vujacic  NYK       SG     79    195  32          9
    ## 369          Sean Kilpatrick  BRK       SG     76    210  27          2
    ## 370           Semaj Christon  OKC       PG     75    190  24          0
    ## 371              Serge Ibaka  TOR       PF     82    235  27          7
    ## 372         Sergio Rodriguez  PHI       PG     75    176  30          4
    ## 373               Seth Curry  DAL       PG     74    185  26          3
    ## 374         Shabazz Muhammad  MIN       SF     78    223  24          3
    ## 375           Shabazz Napier  POR       PG     73    175  25          2
    ## 376         Shaun Livingston  GSW       PG     79    192  31         11
    ## 377               Shawn Long  PHI        C     81    255  24          0
    ## 378        Sheldon McClellan  WAS       SG     77    200  24          0
    ## 379             Shelvin Mack  UTA       PG     75    203  26          5
    ## 380          Skal Labissiere  SAC       PF     83    225  20          0
    ## 381             Solomon Hill  NOP       SF     79    225  25          3
    ## 382        Spencer Dinwiddie  BRK       PG     78    200  23          2
    ## 383            Spencer Hawes  MIL       PF     85    245  28          9
    ## 384          Stanley Johnson  DET       SF     79    245  20          1
    ## 385            Stephen Curry  GSW       PG     75    190  28          7
    ## 386        Stephen Zimmerman  ORL        C     84    240  20          0
    ## 387             Steven Adams  OKC        C     84    255  23          3
    ## 388           T.J. McConnell  PHI       PG     74    200  24          1
    ## 389              T.J. Warren  PHO       SF     80    230  23          2
    ## 390               Taj Gibson  OKC       PF     81    225  31          7
    ## 391              Tarik Black  LAL        C     81    250  25          2
    ## 392            Terrence Ross  ORL       SF     79    206  25          4
    ## 393             Terry Rozier  BOS       PG     74    190  22          1
    ## 394          Thabo Sefolosha  ATL       SF     79    220  32         10
    ## 395           Thaddeus Young  IND       PF     80    221  28          9
    ## 396          Thomas Robinson  LAL       PF     82    237  25          4
    ## 397               Thon Maker  MIL        C     85    216  19          0
    ## 398           Tiago Splitter  PHI        C     83    245  32          6
    ## 399              Tim Frazier  NOP       PG     73    170  26          2
    ## 400             Tim Hardaway  ATL       SG     78    205  24          3
    ## 401           Tim Quarterman  POR       SG     78    195  22          0
    ## 402           Timofey Mozgov  LAL        C     85    275  30          6
    ## 403  Timothe Luwawu-Cabarrot  PHI       SF     78    205  21          0
    ## 404            Tobias Harris  DET       PF     81    235  24          5
    ## 405         Tomas Satoransky  WAS       SG     79    210  25          0
    ## 406               Tony Allen  MEM       SG     76    213  35         12
    ## 407              Tony Parker  SAS       PG     74    185  34         15
    ## 408               Tony Snell  MIL       SG     79    200  25          3
    ## 409           Treveon Graham  CHO       SG     78    220  23          0
    ## 410             Trevor Ariza  HOU       SF     80    215  31         12
    ## 411            Trevor Booker  BRK       PF     80    228  29          6
    ## 412               Trey Burke  WAS       PG     73    191  24          3
    ## 413               Trey Lyles  UTA       PF     82    234  21          1
    ## 414         Tristan Thompson  CLE        C     81    238  25          5
    ## 415             Troy Daniels  MEM       SG     76    205  25          3
    ## 416            Troy Williams  HOU       SF     79    218  22          0
    ## 417                Ty Lawson  SAC       PG     71    195  29          7
    ## 418              Tyler Ennis  LAL       PG     75    194  22          2
    ## 419            Tyler Johnson  MIA       PG     76    186  24          2
    ## 420               Tyler Ulis  PHO       PG     70    150  21          0
    ## 421             Tyler Zeller  BOS        C     84    253  27          4
    ## 422             Tyreke Evans  SAC       SF     78    220  27          7
    ## 423           Tyson Chandler  PHO        C     85    240  34         15
    ## 424               Tyus Jones  MIN       PG     74    195  20          1
    ## 425            Udonis Haslem  MIA        C     80    235  36         13
    ## 426           Victor Oladipo  OKC       SG     76    210  24          3
    ## 427             Vince Carter  MEM       SF     78    220  40         18
    ## 428             Wade Baldwin  MEM       PG     76    202  20          0
    ## 429          Wayne Ellington  MIA       SG     76    200  29          7
    ## 430             Wayne Selden  MEM       SG     77    230  22          0
    ## 431           Wesley Johnson  LAC       SF     79    215  29          6
    ## 432          Wesley Matthews  DAL       SG     77    220  30          7
    ## 433              Will Barton  DEN       SG     78    175  26          4
    ## 434      Willie Cauley-Stein  SAC        C     84    240  23          1
    ## 435              Willie Reed  MIA        C     82    220  26          1
    ## 436        Willy Hernangomez  NYK        C     83    240  22          0
    ## 437          Wilson Chandler  DEN       SF     80    225  29          8
    ## 438             Yogi Ferrell  DAL       PG     72    180  23          0
    ## 439              Zach LaVine  MIN       SG     77    189  21          2
    ## 440            Zach Randolph  MEM       PF     81    260  35         15
    ## 441            Zaza Pachulia  GSW        C     83    270  32         13
    ##       salary games_played minutes field_goals_made field_goals_atts
    ## 1     650000           22     163               17               42
    ## 2    2700000           65     894              121              300
    ## 3    4351320           80    2298              393              865
    ## 4    2022240           18     135               23               54
    ## 5   26540100           68    2193              379              801
    ## 6   10230179           66     931              235              471
    ## 7    7680965           61    1773              183              466
    ## 8    1315448           30     308               30               80
    ## 9     874636           47     708              138              267
    ## 10  10154495           42     653               99              248
    ## 11   5994764           68    1055              134              341
    ## 12   4823621           77    1560              230              463
    ## 13     31969            6     157               25               54
    ## 14   4600000           39     584               89              178
    ## 15  18500000           79    2254              303              647
    ## 16  12000000           80    1608              213              370
    ## 17  22116750           81    2409              483              911
    ## 18  11131368           76    1998              219              415
    ## 19   2183072           79    2376              215              463
    ## 20    945000           72    1474              117              360
    ## 21   6088993           10     111               13               34
    ## 22   6006600           82    3048              709             1570
    ## 23  22116750           75    2708              770             1527
    ## 24   3488000            9      87               12               29
    ## 25   8000000           65    1477              155              351
    ## 26    119494           12     184               34               61
    ## 27   6500000           75    1163              143              279
    ## 28  12500000           61    1580              185              420
    ## 29  11000000           74    2054              323              731
    ## 30   8269663           55    1835              359              775
    ## 31     20580            2      41                5                8
    ## 32   4008882           61    1176              180              419
    ## 33   1551659           39     560               92              197
    ## 34  17000000           81    1793              179              339
    ## 35  20140838           61    2076              479              971
    ## 36   7000000           35     293               72              132
    ## 37    680534           25     123               23               60
    ## 38   1453680           64    1000              183              375
    ## 39   3730653           26     601              107              234
    ## 40   7000000           73    1283              146              327
    ## 41  22116750           77    2684              637             1322
    ## 42   5700000           28     447               83              135
    ## 43   1551659           52     577              107              186
    ## 44   5281680           79    2279              276              686
    ## 45   1200000           23     374               29              106
    ## 46  12606250           54    1140              209              525
    ## 47   3500000           47    1030               70              187
    ## 48   1050961           41     416               46              122
    ## 49    102898           13     159               20               46
    ## 50   1273920            3       9                2                7
    ## 51  21165675           75    2222              555             1172
    ## 52   1589640            9      40                6               16
    ## 53    543471           36     285               36               99
    ## 54   3517200           25     727              142              296
    ## 55   3219579           80    2796              692             1441
    ## 56   4583450           76    1776              281              647
    ## 57   5000000           62    1012               96              248
    ## 58   2112480           11     142               21               63
    ## 59   1562280           57    1237              171              380
    ## 60  24559380           74    2538              602             1389
    ## 61  22116750           34     675               75              222
    ## 62   7806971           74    1398              238              520
    ## 63    143860           18     225               28               72
    ## 64    543471           17     199               36               76
    ## 65    543471            5      52                5                7
    ## 66   1191480            2       8                0                1
    ## 67  22868828           61    1921              374              785
    ## 68    874636           13     107               12               23
    ## 69   1296240           65    1551              362              563
    ## 70   5318313           62    1725              253              443
    ## 71   7643979           62     531               45               86
    ## 72   7600000           24     358               53              121
    ## 73   7330000           80    2003              299              661
    ## 74  11242000           77    2459              321              704
    ## 75    874636           66    1040              128              222
    ## 76   7250000           78    1538              195              517
    ## 77   5332800           63    1811              351              867
    ## 78     18255            1      12                3                8
    ## 79   1171560           10      85                8               16
    ## 80  24328425           75    2694              661             1488
    ## 81    980431           45     314               31               88
    ## 82    543471           19      75               12               27
    ## 83  15050000           63    2134              335              750
    ## 84  10000000           68    1807              176              449
    ## 85   2978250           66    1649              174              359
    ## 86   3940320           66    1228              155              364
    ## 87   2318280           81    2129              381              927
    ## 88   8070175           41     639               95              215
    ## 89   5229454           68    2063              340              714
    ## 90    874060           39     381               47              126
    ## 91   1551659           79    1477              248              420
    ## 92     73528           20     397               47               81
    ## 93   1551659           68     854              135              252
    ## 94    543471           67     808              103              234
    ## 95  21165675           81    2570              412              577
    ## 96   1015696            1      25                3                6
    ## 97   1499760           38     371               47               98
    ## 98   1180080           38     322               50              116
    ## 99   1577280           27     446               49              116
    ## 100 26540100           74    2620              721             1545
    ## 101 16957900           17     574              142              314
    ## 102 14200000           72    1882              220              549
    ## 103  1450000            5      17                3                4
    ## 104  2708582           79    2485              548             1215
    ## 105  2092200           57     976              102              288
    ## 106   259626           24     486               68              147
    ## 107 11050000           50    1186              203              417
    ## 108   543471           32     545               68              121
    ## 109 21323250           64    2082              460              977
    ## 110   268029           25     427               54              107
    ## 111  2223600           78    2730              606             1431
    ## 112  4228000           65    1087              136              341
    ## 113  2898000           76    1330              161              259
    ## 114  1369229           36     238               24               47
    ## 115   543471            7      24                3               13
    ## 116  2898000           46    1384              281              663
    ## 117 25000000           54    1424              296              678
    ## 118  2440200           81    1632              192              481
    ## 119   576724           34     479               57              138
    ## 120   543471           81    1642              124              333
    ## 121  2483040           22     430               56              124
    ## 122  4276320           43     574               57              161
    ## 123 15330435           76    2471              272              650
    ## 124 23180275           74    2199              388              613
    ## 125  8375000           77    1333              194              377
    ## 126 23200000           60    1792              414              955
    ## 127  8081363           73    1820              283              619
    ## 128  6666667           46     789               75              142
    ## 129     5145            1      24                3                4
    ## 130  2613600           82    2412              430              912
    ## 131    23069            2      23                1                7
    ## 132  3241800           55    1406              208              551
    ## 133 17145838           72    1533              402              737
    ## 134 14000000           66    2176              449             1034
    ## 135 12385364           75    2323              412             1016
    ## 136  8400000           26     633               93              226
    ## 137 17000000           68    2234              408              930
    ## 138 16393443           65    1658              235              552
    ## 139  2730000           75    1954              320              802
    ## 140   543471           37     294               39              111
    ## 141  8000000           65    1728              183              432
    ## 142  1655880           57    1782              320              636
    ## 143  8000000           49    1544              289              606
    ## 144   650000           23      93                9               36
    ## 145  2202240           22     355               56              102
    ## 146  1410598           47     538               95              232
    ## 147  9000000           72    1667              234              553
    ## 148  2995421           80    2845              656             1259
    ## 149 15890000           73    2459              534             1124
    ## 150 16073140           73    2516              545             1156
    ## 151  2348783           82    2653              332              661
    ## 152 17100000           81    1823              387              726
    ## 153 22116750           79    2803              599             1280
    ## 154 22116750           77    2513              542              973
    ## 155  1704120           19     146               23               64
    ## 156  1015696           77    1137              211              433
    ## 157 15944154           31     555               65              111
    ## 158  9700000           76    1937              201              489
    ## 159  1015696           39     592               63              173
    ## 160   255000            4      52                1                7
    ## 161  6587132           76    2569              682             1473
    ## 162  1074145           73    1643              204              508
    ## 163  6000000           81    1955              329              749
    ## 164  1034956           38     609              126              238
    ## 165  4096950           35     771              142              343
    ## 166  7377500           78    2198              396              890
    ## 167 12800000           41    1187              123              356
    ## 168  5374320           51    1728              399              814
    ## 169  6286408           72    2335              333              720
    ## 170  4788840           50    1134              242              471
    ## 171   600000           35     249               26               89
    ## 172  2703960           54     626               67              115
    ## 173 13253012           82    2157              359              869
    ## 174  3210840           82    1764              295              729
    ## 175  4540525           75    2045              268              604
    ## 176  2898000           64    1501              146              321
    ## 177 26540100           81    2947              674             1533
    ## 178  4000000           76    2085              368              769
    ## 179  1551659           48     381               44               92
    ## 180   980431           52     457               62              117
    ## 181  1825200           29     220               25               58
    ## 182   980431           77    2101              250              500
    ## 183 10470000           64    1362              157              346
    ## 184  1286160           42     558               58              151
    ## 185    63938            9     115               16               38
    ## 186  5000000           74    1068              174              329
    ## 187  1551659           74    1365              105              243
    ## 188  1403611           77     739              208              319
    ## 189  4743000           78    1341              192              423
    ## 190 15000000           69    1534              220              558
    ## 191  8800000           82    2657              402              909
    ## 192  1015696           51     432               55              103
    ## 193   980431           78    1490              146              311
    ## 194  6511628           62    1143              226              491
    ## 195 11483254           36     883              175              400
    ## 196  1643040           63    1028              128              301
    ## 197  9424084            3      71               11               32
    ## 198 17552209           76    2809              570             1252
    ## 199 17000000           46    1015               99              201
    ## 200  6540000           36     738              103              256
    ## 201   980431           52    1138              154              362
    ## 202  2250000           82    1972              204              451
    ## 203 11000000           78    1843              273              626
    ## 204  1052342           33     135               26               72
    ## 205   165952           19     122               10               16
    ## 206   600000           12      53                9               16
    ## 207  4826160           31     786              200              429
    ## 208  1709720           20     241               37               92
    ## 209 12517606           58    1123              159              309
    ## 210 16957900           78    2836              647             1435
    ## 211   161483            4      34                8               15
    ## 212 10991957           75    1944              310              646
    ## 213  5000000           78    1232              114              262
    ## 214 14382022           80    2066              391              702
    ## 215   874636           78    1392              177              421
    ## 216 12500000           82    2397              477             1071
    ## 217   173094           19     442              105              218
    ## 218  3911380            7      47                5               13
    ## 219  1223653           25     141               15               34
    ## 220   392478           17     247               23               57
    ## 221  1191480            2      31                6               11
    ## 222  5782450           22     381               44              118
    ## 223   874636           53    1614              202              513
    ## 224 11286518           67    2190              405              894
    ## 225  1987440           62     842              101              223
    ## 226  3267120           74    2132              377              773
    ## 227  1514160           24     518               75              162
    ## 228  3000000           64    1177              174              379
    ## 229  1015696           82    1639              233              538
    ## 230  2593440           18     625               80              225
    ## 231  1921320           20     584              120              236
    ## 232  3333333           20     293               46              101
    ## 233  5960160           82    3030              802             1479
    ## 234 17638063           74    2474              636             1311
    ## 235   543471           42     386               62              158
    ## 236  3094014           75    1538              260              508
    ## 237 12000000           79    2739              643             1449
    ## 238 12078652           61    1296              228              415
    ## 239 15730338           73    1963              295              721
    ## 240  3678319           76    2529              370              928
    ## 241 26540100           62    2070              551             1026
    ## 242 21165675           60    1885              370              867
    ## 243  1800000           49     559              109              198
    ## 244  1182840           53     447               56              107
    ## 245 15200000           29     889              150              333
    ## 246 16663575           78    2649              644             1376
    ## 247  8046500           71    1419              216              392
    ## 248  3872520           78    1333              118              313
    ## 249  4000000           56     689               87              214
    ## 250  4317720           66    2164              443              985
    ## 251  1192080           72    1020               93              209
    ## 252  5239437           35     859              131              269
    ## 253 12000000           60    2244              426              918
    ## 254  3900000           79    1229              215              413
    ## 255  4837500           32     385               34               83
    ## 256   543471           14      44                4               14
    ## 257 17638063           72    2525              671             1420
    ## 258 20575005           72    2335              500             1049
    ## 259  4000000            6     132               18               44
    ## 260  6191000           46     968               97              244
    ## 261  5200000           19     375               42              104
    ## 262  1207680           63    1442              190              361
    ## 263  4000000           61     871               77              168
    ## 264  4000000           67     963              172              392
    ## 265 30963450           74    2794              736             1344
    ## 266  7000000           23     591              102              264
    ## 267  2203000           80    1787              191              378
    ## 268  1921320           57    1088              103              156
    ## 269  1227000           68    1065              113              281
    ## 270 18000000           56    1486              164              424
    ## 271  1439880           22     198               28               68
    ## 272   925000           75    1982              290              635
    ## 273  2500000           73    1248              145              388
    ## 274  1627320           22     165               33               73
    ## 275 14000000           69    1291              171              439
    ## 276 21165675           74    2531              532             1160
    ## 277 12000000           82    2556              390              674
    ## 278  6333333           74    1778              264              615
    ## 279    31969            5      48                2                7
    ## 280  4625000           79    2565              421             1007
    ## 281  3578880           79    2399              269              749
    ## 282  3909840           65     960              117              330
    ## 283  7400000           76    2374              406              889
    ## 284  2941440           82    1743              284              632
    ## 285  1403611           82    1286              244              548
    ## 286   543471           21     170               16               30
    ## 287 12250000           76    2295              297              704
    ## 288  2328530           27     632               99              181
    ## 289   383351           20     410               38               90
    ## 290  9607500           76    1986              208              534
    ## 291  8988764           77    2223              314              624
    ## 292   543471           32     331               39               86
    ## 293  1551659           25     160               19               68
    ## 294  9213484           74    1222              146              378
    ## 295  1403611           56     935              216              406
    ## 296  3183526           45     846              112              306
    ## 297   650000            9      32                1               10
    ## 298 13000000           81    2349              295              618
    ## 299 26540100           69    2292              464             1009
    ## 300  4837500           30     475               57              130
    ## 301  3500000           20     151                9               23
    ## 302  1015696           70    1237              170              337
    ## 303 12500000           13     174               14               24
    ## 304  2898000           68    1016              158              369
    ## 305 10500000           70    1133              156              418
    ## 306 10770000           74    1998              247              557
    ## 307  1000000           58    1064              225              345
    ## 308  2463840           81    2541              444              869
    ## 309  3800000           65    1190              151              356
    ## 310  4384490           22     483               77              134
    ## 311  3750000           20     128               14               23
    ## 312  5443918           60    1556              272              633
    ## 313 20869566           77    2617              393              975
    ## 314   543471           54     521               52              141
    ## 315  2993040           80    2188              251              634
    ## 316  1358500           73    2038              494              856
    ## 317  5782450           70    1679              258              625
    ## 318 11750000           75    2163              483             1031
    ## 319  2751360           74    1265              130              270
    ## 320   874636           76    1368              227              506
    ## 321   247991           13     125               16               52
    ## 322   210995           35     471               33               87
    ## 323  9904494           31     482               31               65
    ## 324   138414           13     222               19               39
    ## 325  5893981           80    2605              414              803
    ## 326  5300000           24     609               52              128
    ## 327  1196040           55     859              103              205
    ## 328   874636           39     316               37               72
    ## 329    31969            5      43                0                7
    ## 330  6000000           67    2058              228              543
    ## 331   543471           71    1074              106              245
    ## 332  6050000           65    1599              154              384
    ## 333  3578948           80    1754              273              622
    ## 334 15500000           64    1627              303              604
    ## 335 18314532           75    2689              622             1349
    ## 336 20072033           69    2343              430              972
    ## 337  3500000           25     277               28               70
    ## 338   750000           44     843               88              221
    ## 339  1790902           32     510               65              153
    ## 340    63938            9     111               22               41
    ## 341 14000000           69    1843              229              561
    ## 342  1052342           29     219               19               43
    ## 343  6000000           50     811              100              263
    ## 344  2500000           69    1284              118              325
    ## 345  1811040           41     458               57              156
    ## 346   937800           40     346               41               91
    ## 347  1551659           80    1700              221              514
    ## 348  2255644           31     467               54              128
    ## 349 14956522           52    1424              284              677
    ## 350  2500000           79    1614              153              343
    ## 351  1025831           57    1193              230              412
    ## 352 13550000           75    2469              261              650
    ## 353  1015696           67    2119              292              732
    ## 354 13219250           81    2271              382              775
    ## 355  1406520           59    1593              272              666
    ## 356   543471           78    1966              190              460
    ## 357   543471           52     857               82              217
    ## 358  1395600           78    1761              235              542
    ## 359   282595           14     134                4               24
    ## 360  5000000            6      11                2                3
    ## 361 13333333           30    1013              201              442
    ## 362  2121288           81    2744              413              623
    ## 363 26540100           81    2802              824             1941
    ## 364 18735364           72    2116              323              773
    ## 365   418228           16     110                8               28
    ## 366   874636           73     905               88              137
    ## 367  1720560           77    1419              203              429
    ## 368  1410598           42     408               42              136
    ## 369   980431           70    1754              305              735
    ## 370   543471           64     973               77              223
    ## 371 12250000           23     712              128              279
    ## 372  8000000           68    1518              210              536
    ## 373  2898000           70    2029              338              703
    ## 374  3046299           78    1516              288              598
    ## 375  1350120           53     512               73              183
    ## 376  5782450           76    1345              173              316
    ## 377    89513           18     234               61              109
    ## 378   543471           30     287               30               75
    ## 379  2433334           55    1205              170              381
    ## 380  1188840           33     612              117              218
    ## 381 11241218           80    2374              183              477
    ## 382   726672           59    1334              134              302
    ## 383  6348759           19     171               30               59
    ## 384  2969880           77    1371              129              365
    ## 385 12112359           79    2638              675             1443
    ## 386   950000           19     108               10               31
    ## 387  3140517           80    2389              374              655
    ## 388   874636           81    2133              236              512
    ## 389  2128920           66    2048              403              814
    ## 390  8950000           23     487               89              179
    ## 391  6191000           67    1091              150              294
    ## 392 10000000           24     748              115              267
    ## 393  1906440           74    1263              151              411
    ## 394  3850000           62    1596              174              395
    ## 395 14153652           74    2237              362              687
    ## 396  1050961           48     560              105              196
    ## 397  2568600           57     562               83              181
    ## 398  8550000            8      76               14               31
    ## 399  2090000           65    1525              163              404
    ## 400  2281605           79    2154              415              912
    ## 401   543471           16      80               13               29
    ## 402 16000000           54    1104              169              328
    ## 403  1326960           69    1190              145              361
    ## 404 17200000           82    2567              511             1063
    ## 405  2870813           57     719               61              146
    ## 406  5505618           71    1914              274              595
    ## 407 14445313           63    1587              265              569
    ## 408  2368327           80    2336              246              541
    ## 409   543471           27     189               19               40
    ## 410  7806971           80    2773              326              798
    ## 411  9250000           71    1754              305              591
    ## 412  3386598           57     703              116              255
    ## 413  2340600           71    1158              159              439
    ## 414 15330435           78    2336              262              437
    ## 415  3332940           67    1183              185              495
    ## 416   150000            6     139               22               44
    ## 417  1315448           69    1732              237              522
    ## 418  1733880           22     392               65              144
    ## 419  5628000           73    2178              357              824
    ## 420   918369           61    1123              184              437
    ## 421  8000000           51     525               78              158
    ## 422 10661286           14     314               59              143
    ## 423 12415000           47    1298              153              228
    ## 424  1339680           60     774               75              181
    ## 425  4000000           17     130               11               23
    ## 426  6552960           67    2222              412              932
    ## 427  4264057           73    1799              193              490
    ## 428  1793760           33     405               36              115
    ## 429  6000000           62    1500              231              555
    ## 430    83119           11     189               20               50
    ## 431  5628000           68     810               73              200
    ## 432 17100000           73    2495              333              847
    ## 433  3533333           60    1705              295              667
    ## 434  3551160           75    1421              255              481
    ## 435  1015696           71    1031              162              285
    ## 436  1375000           72    1324              246              465
    ## 437 11200000           71    2197              433              940
    ## 438   207798           36    1046              142              345
    ## 439  2240880           47    1749              326              710
    ## 440 10361445           73    1786              433              964
    ## 441  2898000           70    1268              164              307
    ##     field_goals_perc points3_made points3_atts points3_perc points2_made
    ## 1              0.405            5           10        0.500           12
    ## 2              0.403           48          128        0.375           73
    ## 3              0.454           77          267        0.288          316
    ## 4              0.426            3           15        0.200           20
    ## 5              0.473           86          242        0.355          293
    ## 6              0.499            0            1        0.000          235
    ## 7              0.393           70          212        0.330          113
    ## 8              0.375           14           44        0.318           16
    ## 9              0.517            0            1        0.000          138
    ## 10             0.399           25           76        0.329           74
    ## 11             0.393           94          247        0.381           40
    ## 12             0.497            3           12        0.250          227
    ## 13             0.463            6           19        0.316           19
    ## 14             0.500            0            4        0.000           89
    ## 15             0.468          134          302        0.444          169
    ## 16             0.576           27           66        0.409          186
    ## 17             0.530            2            7        0.286          481
    ## 18             0.528           64          177        0.362          155
    ## 19             0.464           45          184        0.245          170
    ## 20             0.325           43          156        0.276           74
    ## 21             0.382            2           11        0.182           11
    ## 22             0.452          103          289        0.356          606
    ## 23             0.504           40          134        0.299          730
    ## 24             0.414            6           14        0.429            6
    ## 25             0.442           90          230        0.391           65
    ## 26             0.557            4           13        0.308           30
    ## 27             0.513            0            0           NA          143
    ## 28             0.440           62          151        0.411          123
    ## 29             0.442          111          299        0.371          212
    ## 30             0.463          108          277        0.390          251
    ## 31             0.625            1            3        0.333            4
    ## 32             0.430           65          170        0.382          115
    ## 33             0.467           11           32        0.344           81
    ## 34             0.528            0            0           NA          179
    ## 35             0.493           38          113        0.336          441
    ## 36             0.545            0            0           NA           72
    ## 37             0.383           14           35        0.400            9
    ## 38             0.488           32           96        0.333          151
    ## 39             0.457           45          115        0.391           62
    ## 40             0.446           20           81        0.247          126
    ## 41             0.482          223          552        0.404          414
    ## 42             0.615            0            1        0.000           83
    ## 43             0.575            1            3        0.333          106
    ## 44             0.402           55          187        0.294          221
    ## 45             0.274           11           52        0.212           18
    ## 46             0.398           45          139        0.324          164
    ## 47             0.374           44          114        0.386           26
    ## 48             0.377           17           44        0.386           29
    ## 49             0.435            1            7        0.143           19
    ## 50             0.286            0            0           NA            2
    ## 51             0.474          134          387        0.346          421
    ## 52             0.375            2            6        0.333            4
    ## 53             0.364           17           53        0.321           19
    ## 54             0.480           59          138        0.428           83
    ## 55             0.480          185          440        0.420          507
    ## 56             0.434          169          409        0.413          112
    ## 57             0.387           32          105        0.305           64
    ## 58             0.333           11           34        0.324           10
    ## 59             0.450           59          184        0.321          112
    ## 60             0.433          151          421        0.359          451
    ## 61             0.338           25           93        0.269           50
    ## 62             0.458          137          335        0.409          101
    ## 63             0.389           10           32        0.313           18
    ## 64             0.474            0            0           NA           36
    ## 65             0.714            0            0           NA            5
    ## 66             0.000            0            1        0.000            0
    ## 67             0.476          124          302        0.411          250
    ## 68             0.522            0            5        0.000           12
    ## 69             0.643            0            0           NA          362
    ## 70             0.571            0            1        0.000          253
    ## 71             0.523            0            0           NA           45
    ## 72             0.438            5           24        0.208           48
    ## 73             0.452           48          135        0.356          251
    ## 74             0.456          108          269        0.401          213
    ## 75             0.577            0            0           NA          128
    ## 76             0.377           95          274        0.347          100
    ## 77             0.405          135          384        0.352          216
    ## 78             0.375            0            2        0.000            3
    ## 79             0.500            0            0           NA            8
    ## 80             0.444          214          578        0.370          447
    ## 81             0.352           20           64        0.313           11
    ## 82             0.444            0            0           NA           12
    ## 83             0.447          126          325        0.388          209
    ## 84             0.392          118          311        0.379           58
    ## 85             0.485           71          181        0.392          103
    ## 86             0.426           44          149        0.295          111
    ## 87             0.411          106          341        0.311          275
    ## 88             0.442           53          117        0.453           42
    ## 89             0.476           73          175        0.417          267
    ## 90             0.373           12           46        0.261           35
    ## 91             0.590            0            0           NA          248
    ## 92             0.580            1            5        0.200           46
    ## 93             0.536            3            8        0.375          132
    ## 94             0.440           69          173        0.399           34
    ## 95             0.714            0            2        0.000          412
    ## 96             0.500            0            1        0.000            3
    ## 97             0.480            1           18        0.056           46
    ## 98             0.431            9           23        0.391           41
    ## 99             0.422           10           30        0.333           39
    ## 100            0.467           33          124        0.266          688
    ## 101            0.452           36           96        0.375          106
    ## 102            0.401          109          320        0.341          111
    ## 103            0.750            1            1        1.000            2
    ## 104            0.451          100          294        0.340          448
    ## 105            0.354           73          208        0.351           29
    ## 106            0.463           22           53        0.415           46
    ## 107            0.487            3           10        0.300          200
    ## 108            0.562            3           11        0.273           65
    ## 109            0.471           13           60        0.217          447
    ## 110            0.505           21           52        0.404           33
    ## 111            0.423          147          405        0.363          459
    ## 112            0.399           58          177        0.328           78
    ## 113            0.622            0            0           NA          161
    ## 114            0.511            0            0           NA           24
    ## 115            0.231            0            0           NA            3
    ## 116            0.424           85          215        0.395          196
    ## 117            0.437           79          209        0.378          217
    ## 118            0.399           51          159        0.321          141
    ## 119            0.413           11           47        0.234           46
    ## 120            0.372           56          191        0.293           68
    ## 121            0.452           21           58        0.362           35
    ## 122            0.354           28          101        0.277           29
    ## 123            0.418           81          263        0.308          191
    ## 124            0.633            0            2        0.000          388
    ## 125            0.515           21           74        0.284          173
    ## 126            0.434           45          145        0.310          369
    ## 127            0.457           77          208        0.370          206
    ## 128            0.528            0            0           NA           75
    ## 129            0.750            0            0           NA            3
    ## 130            0.471           40          146        0.274          390
    ## 131            0.143            0            2        0.000            1
    ## 132            0.377           56          177        0.316          152
    ## 133            0.545            5           38        0.132          397
    ## 134            0.434          104          310        0.335          345
    ## 135            0.406          246          661        0.372          166
    ## 136            0.412           32           92        0.348           61
    ## 137            0.439          128          360        0.356          280
    ## 138            0.426           31          118        0.263          204
    ## 139            0.399          116          354        0.328          204
    ## 140            0.351           11           29        0.379           28
    ## 141            0.424           82          220        0.373          101
    ## 142            0.503          107          255        0.420          213
    ## 143            0.477           94          233        0.403          195
    ## 144            0.250            1           12        0.083            8
    ## 145            0.549            0            2        0.000           56
    ## 146            0.409           39          111        0.351           56
    ## 147            0.423           61          173        0.353          173
    ## 148            0.521           49          180        0.272          607
    ## 149            0.475          117          289        0.405          417
    ## 150            0.471          149          374        0.398          396
    ## 151            0.502           16           43        0.372          316
    ## 152            0.533            0            4        0.000          387
    ## 153            0.468           78          222        0.351          521
    ## 154            0.557            0            0           NA          542
    ## 155            0.359           10           35        0.286           13
    ## 156            0.487           61          163        0.374          150
    ## 157            0.586            0            0           NA           65
    ## 158            0.411           94          261        0.360          107
    ## 159            0.364           25           94        0.266           38
    ## 160            0.143            0            2        0.000            1
    ## 161            0.463          245          646        0.379          437
    ## 162            0.402           44          149        0.295          160
    ## 163            0.439           28          105        0.267          301
    ## 164            0.529            0            3        0.000          126
    ## 165            0.414           53          148        0.358           89
    ## 166            0.445          201          468        0.429          195
    ## 167            0.346           95          271        0.351           28
    ## 168            0.490           65          178        0.365          334
    ## 169            0.463          157          394        0.398          176
    ## 170            0.514            0            0           NA          242
    ## 171            0.292           13           51        0.255           13
    ## 172            0.583            0            0           NA           67
    ## 173            0.413          116          322        0.360          243
    ## 174            0.405          115          344        0.334          180
    ## 175            0.444          106          273        0.388          162
    ## 176            0.455           51          137        0.372           95
    ## 177            0.440          262          756        0.347          412
    ## 178            0.479           87          256        0.340          281
    ## 179            0.478           31           66        0.470           13
    ## 180            0.530            2            8        0.250           60
    ## 181            0.431           12           35        0.343           13
    ## 182            0.500           55          145        0.379          195
    ## 183            0.454           77          203        0.379           80
    ## 184            0.384            9           25        0.360           49
    ## 185            0.421            3            9        0.333           13
    ## 186            0.529           37           78        0.474          137
    ## 187            0.432           73          171        0.427           32
    ## 188            0.652            0            4        0.000          208
    ## 189            0.454           46          135        0.341          146
    ## 190            0.394           53          193        0.275          167
    ## 191            0.442           90          252        0.357          312
    ## 192            0.534            0            1        0.000           55
    ## 193            0.469           43          114        0.377          103
    ## 194            0.460           41          146        0.281          185
    ## 195            0.438           58          156        0.372          117
    ## 196            0.425           49          134        0.366           79
    ## 197            0.344            2            5        0.400            9
    ## 198            0.455           91          248        0.367          479
    ## 199            0.493            0            1        0.000           99
    ## 200            0.402           56          137        0.409           47
    ## 201            0.425           85          221        0.385           69
    ## 202            0.452          123          279        0.441           81
    ## 203            0.436          106          258        0.411          167
    ## 204            0.361            5           23        0.217           21
    ## 205            0.625            0            0           NA           10
    ## 206            0.563            1            4        0.250            8
    ## 207            0.466           36           98        0.367          164
    ## 208            0.402            6           20        0.300           31
    ## 209            0.515            0            1        0.000          159
    ## 210            0.451           89          272        0.327          558
    ## 211            0.533            1            3        0.333            7
    ## 212            0.480           49          167        0.293          261
    ## 213            0.435           45          130        0.346           69
    ## 214            0.557            1            2        0.500          390
    ## 215            0.420           30          102        0.294          147
    ## 216            0.445          117          356        0.329          360
    ## 217            0.482           37           95        0.389           68
    ## 218            0.385            0            0           NA            5
    ## 219            0.441            0            1        0.000           15
    ## 220            0.404            8           30        0.267           15
    ## 221            0.545            2            4        0.500            4
    ## 222            0.373           13           31        0.419           31
    ## 223            0.394           75          227        0.330          127
    ## 224            0.453          100          281        0.356          305
    ## 225            0.453           46          112        0.411           55
    ## 226            0.488           17           63        0.270          360
    ## 227            0.463           21           72        0.292           54
    ## 228            0.459           55          181        0.304          119
    ## 229            0.433           97          273        0.355          136
    ## 230            0.356            7           35        0.200           73
    ## 231            0.508            0            1        0.000          120
    ## 232            0.455           11           39        0.282           35
    ## 233            0.542          101          275        0.367          701
    ## 234            0.485          147          386        0.381          489
    ## 235            0.392            7           22        0.318           55
    ## 236            0.512           68          192        0.354          192
    ## 237            0.444          240          602        0.399          403
    ## 238            0.549            0            6        0.000          228
    ## 239            0.409           92          266        0.346          203
    ## 240            0.399          153          437        0.350          217
    ## 241            0.537          117          312        0.375          434
    ## 242            0.427          145          389        0.373          225
    ## 243            0.551            0            2        0.000          109
    ## 244            0.523            2            9        0.222           54
    ## 245            0.450           45          104        0.433          105
    ## 246            0.468          268          647        0.414          376
    ## 247            0.551            0            1        0.000          216
    ## 248            0.377           21           73        0.288           97
    ## 249            0.407           19           54        0.352           68
    ## 250            0.450          112          314        0.357          331
    ## 251            0.445           15           40        0.375           78
    ## 252            0.487           97          200        0.485           34
    ## 253            0.464          193          468        0.412          233
    ## 254            0.521            2           17        0.118          213
    ## 255            0.410            7           37        0.189           27
    ## 256            0.286            4           13        0.308            0
    ## 257            0.473          177          441        0.401          494
    ## 258            0.477           23           56        0.411          477
    ## 259            0.409            5            8        0.625           13
    ## 260            0.398           38           85        0.447           59
    ## 261            0.404           19           40        0.475           23
    ## 262            0.526           10           36        0.278          180
    ## 263            0.458            0            1        0.000           77
    ## 264            0.439           35           98        0.357          137
    ## 265            0.548          124          342        0.363          612
    ## 266            0.386           41          129        0.318           61
    ## 267            0.505           43          110        0.391          148
    ## 268            0.660            3           12        0.250          100
    ## 269            0.402           87          210        0.414           26
    ## 270            0.387           51          165        0.309          113
    ## 271            0.412            8           28        0.286           20
    ## 272            0.457           78          193        0.404          212
    ## 273            0.374           26          110        0.236          119
    ## 274            0.452            9           28        0.321           24
    ## 275            0.390           89          227        0.392           82
    ## 276            0.459          104          268        0.388          428
    ## 277            0.579            0            2        0.000          390
    ## 278            0.429          102          283        0.360          162
    ## 279            0.286            1            2        0.500            1
    ## 280            0.418          118          357        0.331          303
    ## 281            0.359           94          332        0.283          175
    ## 282            0.355           43          144        0.299           74
    ## 283            0.457           71          196        0.362          335
    ## 284            0.449           72          224        0.321          212
    ## 285            0.445          103          277        0.372          141
    ## 286            0.533            0            0           NA           16
    ## 287            0.422          124          354        0.350          173
    ## 288            0.547            0            1        0.000           99
    ## 289            0.422           18           52        0.346           20
    ## 290            0.390           79          215        0.367          129
    ## 291            0.503           68          194        0.351          246
    ## 292            0.453            1            7        0.143           38
    ## 293            0.279            9           38        0.237           10
    ## 294            0.386           74          213        0.347           72
    ## 295            0.532           18           43        0.419          198
    ## 296            0.366           15           64        0.234           97
    ## 297            0.100            0            4        0.000            1
    ## 298            0.477            1            9        0.111          294
    ## 299            0.460          171          419        0.408          293
    ## 300            0.438           33           77        0.429           24
    ## 301            0.391            8           20        0.400            1
    ## 302            0.504           46          110        0.418          124
    ## 303            0.583            0            0           NA           14
    ## 304            0.428           54          168        0.321          104
    ## 305            0.373          104          305        0.341           52
    ## 306            0.443           43          135        0.319          204
    ## 307            0.652            1            7        0.143          224
    ## 308            0.511           40          115        0.348          404
    ## 309            0.424           56          177        0.316           95
    ## 310            0.575            0            0           NA           77
    ## 311            0.609            0            1        0.000           14
    ## 312            0.430          170          421        0.404          102
    ## 313            0.403          135          405        0.333          258
    ## 314            0.369           29           95        0.305           23
    ## 315            0.396          132          359        0.368          119
    ## 316            0.577           45          139        0.324          449
    ## 317            0.413          129          377        0.342          129
    ## 318            0.468           23           75        0.307          460
    ## 319            0.481            7           20        0.350          123
    ## 320            0.449           56          173        0.324          171
    ## 321            0.308            3           13        0.231           13
    ## 322            0.379           12           34        0.353           21
    ## 323            0.477            0            0           NA           31
    ## 324            0.487            2           10        0.200           17
    ## 325            0.516          148          341        0.434          266
    ## 326            0.406           24           60        0.400           28
    ## 327            0.502            1            7        0.143          102
    ## 328            0.514           17           33        0.515           20
    ## 329            0.000            0            5        0.000            0
    ## 330            0.420          110          288        0.382          118
    ## 331            0.433           41          123        0.333           65
    ## 332            0.401           94          253        0.372           60
    ## 333            0.439          147          356        0.413          126
    ## 334            0.502           56          104        0.538          247
    ## 335            0.461          195          496        0.393          427
    ## 336            0.442           75          241        0.311          355
    ## 337            0.400           15           43        0.349           13
    ## 338            0.398           33           99        0.333           55
    ## 339            0.425           36           83        0.434           29
    ## 340            0.537            6           12        0.500           16
    ## 341            0.408           50          133        0.376          179
    ## 342            0.442            0            0           NA           19
    ## 343            0.380           21           62        0.339           79
    ## 344            0.363           67          203        0.330           51
    ## 345            0.365           26           81        0.321           31
    ## 346            0.451           10           31        0.323           31
    ## 347            0.430           46          144        0.319          175
    ## 348            0.422           28           73        0.384           26
    ## 349            0.419           66          184        0.359          218
    ## 350            0.446           62          186        0.333           91
    ## 351            0.558           27           77        0.351          203
    ## 352            0.402           60          196        0.306          201
    ## 353            0.399          137          412        0.333          155
    ## 354            0.493            0            2        0.000          382
    ## 355            0.408          114          306        0.373          158
    ## 356            0.413           73          220        0.332          117
    ## 357            0.378           23           86        0.267           59
    ## 358            0.434           15           67        0.224          220
    ## 359            0.167            3           17        0.176            1
    ## 360            0.667            0            0           NA            2
    ## 361            0.455           42          113        0.372          159
    ## 362            0.663            0            1        0.000          413
    ## 363            0.425          200          583        0.343          624
    ## 364            0.418          204          506        0.403          119
    ## 365            0.286            4           10        0.400            4
    ## 366            0.642            1            3        0.333           87
    ## 367            0.473           60          187        0.321          143
    ## 368            0.309           23           74        0.311           19
    ## 369            0.415          105          308        0.341          200
    ## 370            0.345           12           63        0.190           65
    ## 371            0.459           41          103        0.398           87
    ## 372            0.392           92          252        0.365          118
    ## 373            0.481          137          322        0.425          201
    ## 374            0.482           49          146        0.336          239
    ## 375            0.399           34           92        0.370           39
    ## 376            0.547            1            3        0.333          172
    ## 377            0.560            7           19        0.368           54
    ## 378            0.400            7           30        0.233           23
    ## 379            0.446           37          120        0.308          133
    ## 380            0.537            3            8        0.375          114
    ## 381            0.384           94          270        0.348           89
    ## 382            0.444           38          101        0.376           96
    ## 383            0.508            9           26        0.346           21
    ## 384            0.353           45          154        0.292           84
    ## 385            0.468          324          789        0.411          351
    ## 386            0.323            0            0           NA           10
    ## 387            0.571            0            1        0.000          374
    ## 388            0.461           11           55        0.200          225
    ## 389            0.495           26           98        0.265          377
    ## 390            0.497            1            1        1.000           88
    ## 391            0.510            1            2        0.500          149
    ## 392            0.431           46          135        0.341           69
    ## 393            0.367           57          179        0.318           94
    ## 394            0.441           41          120        0.342          133
    ## 395            0.527           45          118        0.381          317
    ## 396            0.536            0            1        0.000          105
    ## 397            0.459           28           74        0.378           55
    ## 398            0.452            2            6        0.333           12
    ## 399            0.403           40          128        0.313          123
    ## 400            0.455          149          417        0.357          266
    ## 401            0.448            5           13        0.385            8
    ## 402            0.515            0            1        0.000          169
    ## 403            0.402           50          161        0.311           95
    ## 404            0.481          109          314        0.347          402
    ## 405            0.418            9           37        0.243           52
    ## 406            0.461           15           54        0.278          259
    ## 407            0.466           23           69        0.333          242
    ## 408            0.455          144          355        0.406          102
    ## 409            0.475            9           15        0.600           10
    ## 410            0.409          191          555        0.344          135
    ## 411            0.516           25           78        0.321          280
    ## 412            0.455           31           70        0.443           85
    ## 413            0.362           65          204        0.319           94
    ## 414            0.600            0            3        0.000          262
    ## 415            0.374          138          355        0.389           47
    ## 416            0.500            8           21        0.381           14
    ## 417            0.454           34          118        0.288          203
    ## 418            0.451           21           54        0.389           44
    ## 419            0.433           93          250        0.372          264
    ## 420            0.421           21           79        0.266          163
    ## 421            0.494            0            1        0.000           78
    ## 422            0.413           21           48        0.438           38
    ## 423            0.671            0            0           NA          153
    ## 424            0.414           26           73        0.356           49
    ## 425            0.478            0            3        0.000           11
    ## 426            0.442          127          352        0.361          285
    ## 427            0.394          112          296        0.378           81
    ## 428            0.313            3           22        0.136           33
    ## 429            0.416          149          394        0.378           82
    ## 430            0.400            3           21        0.143           17
    ## 431            0.365           29          118        0.246           44
    ## 432            0.393          174          479        0.363          159
    ## 433            0.442           87          235        0.370          208
    ## 434            0.530            0            2        0.000          255
    ## 435            0.568            1            4        0.250          161
    ## 436            0.529            4           15        0.267          242
    ## 437            0.461          110          326        0.337          323
    ## 438            0.412           60          149        0.403           82
    ## 439            0.459          120          310        0.387          206
    ## 440            0.449           21           94        0.223          412
    ## 441            0.534            0            2        0.000          164
    ##     points2_atts points2_perc points1_made points1_atts points1_perc
    ## 1             32        0.375            9           20        0.450
    ## 2            172        0.424           32           40        0.800
    ## 3            598        0.528          156          217        0.719
    ## 4             39        0.513           14           19        0.737
    ## 5            559        0.524          108          135        0.800
    ## 6            470        0.500           65           85        0.765
    ## 7            254        0.445           96          136        0.706
    ## 8             36        0.444           12           16        0.750
    ## 9            266        0.519           70          112        0.625
    ## 10           172        0.430           60           78        0.769
    ## 11            94        0.426           44           49        0.898
    ## 12           451        0.503          150          208        0.721
    ## 13            35        0.543            8           10        0.800
    ## 14           174        0.511           29           40        0.725
    ## 15           345        0.490          105          124        0.847
    ## 16           304        0.612           67          100        0.670
    ## 17           904        0.532          137          355        0.386
    ## 18           238        0.651           72          102        0.706
    ## 19           279        0.609           47          111        0.423
    ## 20           204        0.363          148          194        0.763
    ## 21            23        0.478            2            2        1.000
    ## 22          1281        0.473          412          542        0.760
    ## 23          1393        0.524          519          647        0.802
    ## 24            15        0.400           11           11        1.000
    ## 25           121        0.537           61           82        0.744
    ## 26            48        0.625           23           32        0.719
    ## 27           279        0.513           79           94        0.840
    ## 28           269        0.457           83           93        0.892
    ## 29           432        0.491          132          191        0.691
    ## 30           498        0.504           68           93        0.731
    ## 31             5        0.800            0            0           NA
    ## 32           249        0.462           70           93        0.753
    ## 33           165        0.491           32           34        0.941
    ## 34           339        0.528          125          234        0.534
    ## 35           858        0.514          320          421        0.760
    ## 36           132        0.545           47           58        0.810
    ## 37            25        0.360            2            2        1.000
    ## 38           279        0.541           39           59        0.661
    ## 39           119        0.521           71           76        0.934
    ## 40           246        0.512           26           35        0.743
    ## 41           770        0.538          282          342        0.825
    ## 42           134        0.619           23           35        0.657
    ## 43           183        0.579           77           88        0.875
    ## 44           499        0.443          133          214        0.621
    ## 45            54        0.333           12           17        0.706
    ## 46           386        0.425          132          154        0.857
    ## 47            73        0.356           13           18        0.722
    ## 48            78        0.372           33           39        0.846
    ## 49            39        0.487            9           13        0.692
    ## 50             7        0.286            0            0           NA
    ## 51           785        0.536          295          364        0.810
    ## 52            10        0.400            0            0           NA
    ## 53            46        0.413            5            6        0.833
    ## 54           158        0.525           35           43        0.814
    ## 55          1001        0.506          268          294        0.912
    ## 56           238        0.471           84           93        0.903
    ## 57           143        0.448           57           66        0.864
    ## 58            29        0.345            1            4        0.250
    ## 59           196        0.571           67           93        0.720
    ## 60           968        0.466          304          365        0.833
    ## 61           129        0.388           35           43        0.814
    ## 62           185        0.546           63           74        0.851
    ## 63            40        0.450           29           31        0.935
    ## 64            76        0.474           15           21        0.714
    ## 65             7        0.714            4            4        1.000
    ## 66             0           NA            1            2        0.500
    ## 67           483        0.518          232          260        0.892
    ## 68            18        0.667           11           15        0.733
    ## 69           563        0.643           94          177        0.531
    ## 70           442        0.572          133          196        0.679
    ## 71            86        0.523           15           22        0.682
    ## 72            97        0.495           18           24        0.750
    ## 73           526        0.477           94          122        0.770
    ## 74           435        0.490           85           98        0.867
    ## 75           222        0.577           60           93        0.645
    ## 76           243        0.412          131          161        0.814
    ## 77           483        0.447          147          188        0.782
    ## 78             6        0.500            3            4        0.750
    ## 79            16        0.500            3           10        0.300
    ## 80           910        0.491          488          545        0.895
    ## 81            24        0.458            0            0           NA
    ## 82            27        0.444            0            2        0.000
    ## 83           425        0.492          349          387        0.902
    ## 84           138        0.420           27           32        0.844
    ## 85           178        0.579           16           27        0.593
    ## 86           215        0.516           58           73        0.795
    ## 87           586        0.469          172          220        0.782
    ## 88            98        0.429           19           22        0.864
    ## 89           539        0.495          147          171        0.860
    ## 90            80        0.438           21           28        0.750
    ## 91           420        0.590           80          113        0.708
    ## 92            76        0.605           25           39        0.641
    ## 93           244        0.541           43           56        0.768
    ## 94            61        0.557           28           34        0.824
    ## 95           575        0.717          205          425        0.482
    ## 96             5        0.600            2            3        0.667
    ## 97            80        0.575            6           16        0.375
    ## 98            93        0.441           21           30        0.700
    ## 99            86        0.453           42           55        0.764
    ## 100         1421        0.484          545          647        0.842
    ## 101          218        0.486           94          121        0.777
    ## 102          229        0.485           89          117        0.761
    ## 103            3        0.667            3            6        0.500
    ## 104          921        0.486          218          255        0.855
    ## 105           80        0.363           14           18        0.778
    ## 106           94        0.489           21           25        0.840
    ## 107          407        0.491           67          109        0.615
    ## 108          110        0.591           29           41        0.707
    ## 109          917        0.487          221          253        0.874
    ## 110           55        0.600           27           39        0.692
    ## 111         1026        0.447          367          441        0.832
    ## 112          164        0.476          107          129        0.829
    ## 113          259        0.622           65           93        0.699
    ## 114           47        0.511           10           18        0.556
    ## 115           13        0.231            4            4        1.000
    ## 116          448        0.438           82          127        0.646
    ## 117          469        0.463           98          112        0.875
    ## 118          322        0.438           44           67        0.657
    ## 119           91        0.505           25           49        0.510
    ## 120          142        0.479           46           61        0.754
    ## 121           66        0.530           12           17        0.706
    ## 122           60        0.483            4           11        0.364
    ## 123          387        0.494          151          213        0.709
    ## 124          611        0.635          226          424        0.533
    ## 125          303        0.571          107          141        0.759
    ## 126          810        0.456          223          281        0.794
    ## 127          411        0.501           57           74        0.770
    ## 128          142        0.528           50           81        0.617
    ## 129            4        0.750            0            1        0.000
    ## 130          766        0.509          146          211        0.692
    ## 131            5        0.200            1            2        0.500
    ## 132          374        0.406          131          167        0.784
    ## 133          699        0.568          224          285        0.786
    ## 134          724        0.477          388          458        0.847
    ## 135          355        0.468          147          175        0.840
    ## 136          134        0.455           52           65        0.800
    ## 137          570        0.491          223          277        0.805
    ## 138          434        0.470           85          103        0.825
    ## 139          448        0.455          118          156        0.756
    ## 140           82        0.341           18           22        0.818
    ## 141          212        0.476           58           74        0.784
    ## 142          381        0.559          104          134        0.776
    ## 143          373        0.523          157          196        0.801
    ## 144           24        0.333            2            2        1.000
    ## 145          100        0.560           12           14        0.857
    ## 146          121        0.463           33           41        0.805
    ## 147          380        0.455          133          165        0.806
    ## 148         1079        0.563          471          612        0.770
    ## 149          835        0.499          298          377        0.790
    ## 150          782        0.506          362          429        0.844
    ## 151          618        0.511          136          167        0.814
    ## 152          722        0.536          177          239        0.741
    ## 153         1058        0.492          242          281        0.861
    ## 154          973        0.557          225          358        0.628
    ## 155           29        0.448            4            8        0.500
    ## 156          270        0.556           44           58        0.759
    ## 157          111        0.586           43           75        0.573
    ## 158          228        0.469           71           90        0.789
    ## 159           79        0.481           30           33        0.909
    ## 160            5        0.200            1            2        0.500
    ## 161          827        0.528          590          649        0.909
    ## 162          359        0.446           91          113        0.805
    ## 163          644        0.467           72          102        0.706
    ## 164          235        0.536           32           49        0.653
    ## 165          195        0.456           44           51        0.863
    ## 166          422        0.462          180          202        0.891
    ## 167           85        0.329           10           15        0.667
    ## 168          636        0.525          162          218        0.743
    ## 169          326        0.540          176          217        0.811
    ## 170          471        0.514          106          158        0.671
    ## 171           38        0.342           13           17        0.765
    ## 172          115        0.583           31           57        0.544
    ## 173          547        0.444          174          203        0.857
    ## 174          385        0.468          106          120        0.883
    ## 175          331        0.489           45           63        0.714
    ## 176          184        0.516           86          110        0.782
    ## 177          777        0.530          746          881        0.847
    ## 178          513        0.548          152          215        0.707
    ## 179           26        0.500           13           20        0.650
    ## 180          109        0.550           21           42        0.500
    ## 181           23        0.565            6            9        0.667
    ## 182          355        0.549          134          167        0.802
    ## 183          143        0.559           43           65        0.662
    ## 184          126        0.389           40           50        0.800
    ## 185           29        0.448            5            7        0.714
    ## 186          251        0.546           35           51        0.686
    ## 187           72        0.444           24           29        0.828
    ## 188          315        0.660           56          111        0.505
    ## 189          288        0.507           85          124        0.685
    ## 190          365        0.458          145          168        0.863
    ## 191          657        0.475          360          415        0.867
    ## 192          102        0.539           36           48        0.750
    ## 193          197        0.523           86          139        0.619
    ## 194          345        0.536          110          129        0.853
    ## 195          244        0.480          115          141        0.816
    ## 196          167        0.473           65           73        0.890
    ## 197           27        0.333            9           10        0.900
    ## 198         1004        0.477          585          676        0.865
    ## 199          200        0.495           34           78        0.436
    ## 200          119        0.395           65           74        0.878
    ## 201          141        0.489           35           49        0.714
    ## 202          172        0.471           50           68        0.735
    ## 203          368        0.454           63           77        0.818
    ## 204           49        0.429           11           15        0.733
    ## 205           16        0.625            5            8        0.625
    ## 206           12        0.667            3            6        0.500
    ## 207          331        0.495          191          244        0.783
    ## 208           72        0.431            9           15        0.600
    ## 209          308        0.516           74          107        0.692
    ## 210         1163        0.480          422          527        0.801
    ## 211           12        0.583            1            2        0.500
    ## 212          479        0.545           98          113        0.867
    ## 213          132        0.523           26           37        0.703
    ## 214          700        0.557          176          217        0.811
    ## 215          319        0.461           99          132        0.750
    ## 216          715        0.503          134          168        0.798
    ## 217          123        0.553           20           26        0.769
    ## 218           13        0.385            2            2        1.000
    ## 219           33        0.455            8           14        0.571
    ## 220           27        0.556            7            8        0.875
    ## 221            7        0.571            0            1        0.000
    ## 222           87        0.356            6            9        0.667
    ## 223          286        0.444           60           77        0.779
    ## 224          613        0.498          119          168        0.708
    ## 225          111        0.495           57           76        0.750
    ## 226          710        0.507          204          282        0.723
    ## 227           90        0.600           32           41        0.780
    ## 228          198        0.601           39           52        0.750
    ## 229          265        0.513           66           80        0.825
    ## 230          190        0.384           29           47        0.617
    ## 231          235        0.511           64           97        0.660
    ## 232           62        0.565           23           28        0.821
    ## 233         1204        0.582          356          428        0.832
    ## 234          925        0.529          469          533        0.880
    ## 235          136        0.404           35           49        0.714
    ## 236          316        0.608           90          123        0.732
    ## 237          847        0.476          304          359        0.847
    ## 238          409        0.557          131          189        0.693
    ## 239          455        0.446          119          168        0.708
    ## 240          491        0.442          154          185        0.832
    ## 241          714        0.608          336          384        0.875
    ## 242          478        0.471          257          295        0.871
    ## 243          196        0.556           14           22        0.636
    ## 244           98        0.551           21           34        0.618
    ## 245          229        0.459           81           92        0.880
    ## 246          729        0.516          186          218        0.853
    ## 247          391        0.552           38           62        0.613
    ## 248          240        0.404           36           59        0.610
    ## 249          160        0.425           64           82        0.780
    ## 250          671        0.493          198          252        0.786
    ## 251          169        0.462           45           57        0.789
    ## 252           69        0.493           14           15        0.933
    ## 253          450        0.518          299          365        0.819
    ## 254          396        0.538           64           83        0.771
    ## 255           46        0.587           13           17        0.765
    ## 256            1        0.000            1            2        0.500
    ## 257          979        0.505          297          328        0.905
    ## 258          993        0.480          220          271        0.812
    ## 259           36        0.361            2            3        0.667
    ## 260          159        0.371           43           51        0.843
    ## 261           64        0.359           11           12        0.917
    ## 262          325        0.554           59           80        0.738
    ## 263          167        0.461           23           33        0.697
    ## 264          294        0.466           40           45        0.889
    ## 265         1002        0.611          358          531        0.674
    ## 266          135        0.452           98          113        0.867
    ## 267          268        0.552           59           87        0.678
    ## 268          144        0.694           44           67        0.657
    ## 269           71        0.366           11           15        0.733
    ## 270          259        0.436           46           63        0.730
    ## 271           40        0.500           15           19        0.789
    ## 272          442        0.480          109          126        0.865
    ## 273          278        0.428           75           93        0.806
    ## 274           45        0.533            8           10        0.800
    ## 275          212        0.387           86          107        0.804
    ## 276          892        0.480          278          332        0.837
    ## 277          672        0.580          103          159        0.648
    ## 278          332        0.488          150          168        0.893
    ## 279            5        0.200            9           10        0.900
    ## 280          650        0.466          145          185        0.784
    ## 281          417        0.420          203          250        0.812
    ## 282          186        0.398           40           50        0.800
    ## 283          693        0.483          180          215        0.837
    ## 284          408        0.520          113          181        0.624
    ## 285          271        0.520          120          137        0.876
    ## 286           30        0.533            8           19        0.421
    ## 287          350        0.494          131          150        0.873
    ## 288          180        0.550           47           76        0.618
    ## 289           38        0.526           20           23        0.870
    ## 290          319        0.404           82           96        0.854
    ## 291          430        0.572           77          124        0.621
    ## 292           79        0.481           19           26        0.731
    ## 293           30        0.333           10           16        0.625
    ## 294          165        0.436           35           40        0.875
    ## 295          363        0.545           78          105        0.743
    ## 296          242        0.401           58           77        0.753
    ## 297            6        0.167            2            2        1.000
    ## 298          609        0.483          152          194        0.784
    ## 299          590        0.497          316          368        0.859
    ## 300           53        0.453           22           26        0.846
    ## 301            3        0.333            2            2        1.000
    ## 302          227        0.546           49           64        0.766
    ## 303           24        0.583            3            4        0.750
    ## 304          201        0.517           55           68        0.809
    ## 305          113        0.460           35           45        0.778
    ## 306          422        0.483           93          128        0.727
    ## 307          338        0.663           76          121        0.628
    ## 308          754        0.536          245          303        0.809
    ## 309          179        0.531           45           61        0.738
    ## 310          134        0.575           34           48        0.708
    ## 311           22        0.636            5            8        0.625
    ## 312          212        0.481           77           90        0.856
    ## 313          570        0.453          243          284        0.856
    ## 314           46        0.500           17           22        0.773
    ## 315          275        0.433          122          150        0.813
    ## 316          717        0.626          188          228        0.825
    ## 317          248        0.520           99          128        0.773
    ## 318          956        0.481          107          160        0.669
    ## 319          250        0.492           60           94        0.638
    ## 320          333        0.514          126          159        0.792
    ## 321           39        0.333            8           10        0.800
    ## 322           53        0.396           20           22        0.909
    ## 323           65        0.477           23           39        0.590
    ## 324           29        0.586            5            8        0.625
    ## 325          462        0.576           99          119        0.832
    ## 326           68        0.412           11           16        0.688
    ## 327          198        0.515           22           32        0.688
    ## 328           39        0.513            7            9        0.778
    ## 329            2        0.000            0            0           NA
    ## 330          255        0.463           73           95        0.768
    ## 331          122        0.533           29           37        0.784
    ## 332          131        0.458           43           60        0.717
    ## 333          266        0.474           66           80        0.825
    ## 334          500        0.494          130          184        0.707
    ## 335          853        0.501          336          374        0.898
    ## 336          731        0.486          311          405        0.768
    ## 337           27        0.481           10           13        0.769
    ## 338          122        0.451           31           40        0.775
    ## 339           70        0.414           43           57        0.754
    ## 340           29        0.552            2            3        0.667
    ## 341          428        0.418           30           50        0.600
    ## 342           43        0.442           21           29        0.724
    ## 343          201        0.393           91          118        0.771
    ## 344          122        0.418           54           63        0.857
    ## 345           75        0.413            2            5        0.400
    ## 346           60        0.517            8            9        0.889
    ## 347          370        0.473           50           64        0.781
    ## 348           55        0.473            5            7        0.714
    ## 349          493        0.442          118          136        0.868
    ## 350          157        0.580           80          108        0.741
    ## 351          335        0.606           72          103        0.699
    ## 352          454        0.443          254          285        0.891
    ## 353          320        0.484          143          174        0.822
    ## 354          773        0.494           75          104        0.721
    ## 355          360        0.439           90          115        0.783
    ## 356          240        0.488           44           71        0.620
    ## 357          131        0.450           28           43        0.651
    ## 358          475        0.463          190          253        0.751
    ## 359            7        0.143            3            4        0.750
    ## 360            3        0.667            0            0           NA
    ## 361          329        0.483          118          138        0.855
    ## 362          622        0.664          311          476        0.653
    ## 363         1358        0.459          710          840        0.845
    ## 364          267        0.446          129          150        0.860
    ## 365           18        0.222            5            6        0.833
    ## 366          134        0.649           36           61        0.590
    ## 367          242        0.591           38           68        0.559
    ## 368           62        0.306           17           24        0.708
    ## 369          427        0.468          204          242        0.843
    ## 370          160        0.406           17           31        0.548
    ## 371          176        0.494           30           34        0.882
    ## 372          284        0.415           18           27        0.667
    ## 373          381        0.528           85          100        0.850
    ## 374          452        0.529          147          190        0.774
    ## 375           91        0.429           38           49        0.776
    ## 376          313        0.550           42           60        0.700
    ## 377           90        0.600           19           35        0.543
    ## 378           45        0.511           23           27        0.852
    ## 379          261        0.510           53           77        0.688
    ## 380          210        0.543           52           74        0.703
    ## 381          207        0.430          103          128        0.805
    ## 382          201        0.478          126          159        0.792
    ## 383           33        0.636           14           18        0.778
    ## 384          211        0.398           36           53        0.679
    ## 385          654        0.537          325          362        0.898
    ## 386           31        0.323            3            5        0.600
    ## 387          654        0.572          157          257        0.611
    ## 388          457        0.492           73           90        0.811
    ## 389          716        0.527          119          154        0.773
    ## 390          178        0.494           28           39        0.718
    ## 391          292        0.510           82          109        0.752
    ## 392          132        0.523           23           27        0.852
    ## 393          232        0.405           51           66        0.773
    ## 394          275        0.484           55           75        0.733
    ## 395          569        0.557           45           86        0.523
    ## 396          195        0.538           31           66        0.470
    ## 397          107        0.514           32           49        0.653
    ## 398           25        0.480            9           11        0.818
    ## 399          276        0.446           98          129        0.760
    ## 400          495        0.537          164          214        0.766
    ## 401           16        0.500            0            3        0.000
    ## 402          327        0.517           63           78        0.808
    ## 403          200        0.475          105          123        0.854
    ## 404          749        0.537          190          226        0.841
    ## 405          109        0.477           23           33        0.697
    ## 406          541        0.479           80          130        0.615
    ## 407          500        0.484           85          117        0.726
    ## 408          186        0.548           47           58        0.810
    ## 409           25        0.400           10           15        0.667
    ## 410          243        0.556           93          126        0.738
    ## 411          513        0.546           74          110        0.673
    ## 412          185        0.459           22           29        0.759
    ## 413          235        0.400           57           79        0.722
    ## 414          434        0.604          106          213        0.498
    ## 415          140        0.336           43           54        0.796
    ## 416           23        0.609            6            7        0.857
    ## 417          404        0.502          173          217        0.797
    ## 418           90        0.489           19           22        0.864
    ## 419          574        0.460          195          254        0.768
    ## 420          358        0.455           55           71        0.775
    ## 421          157        0.497           22           39        0.564
    ## 422           95        0.400           24           34        0.706
    ## 423          228        0.671           91          124        0.734
    ## 424          108        0.454           33           43        0.767
    ## 425           20        0.550            9           15        0.600
    ## 426          580        0.491          116          154        0.753
    ## 427          194        0.418           88          115        0.765
    ## 428           93        0.355           31           37        0.838
    ## 429          161        0.509           37           43        0.860
    ## 430           29        0.586           12           18        0.667
    ## 431           82        0.537           11           17        0.647
    ## 432          368        0.432          146          179        0.816
    ## 433          432        0.481          143          190        0.753
    ## 434          479        0.532          101          151        0.669
    ## 435          281        0.573           49           88        0.557
    ## 436          450        0.538           91          125        0.728
    ## 437          614        0.526          141          194        0.727
    ## 438          196        0.418           64           73        0.877
    ## 439          400        0.515          117          140        0.836
    ## 440          870        0.474          141          193        0.731
    ## 441          305        0.538           98          126        0.778
    ##     off_rebounds def_rebounds assists steals blocks turnovers fouls
    ## 1              8           28       4      1     13        10    21
    ## 2             18           51     125     25      9        66    93
    ## 3            116          289     150     64     40        89   172
    ## 4              9           24       7      8      7         8    32
    ## 5             95          369     337     52     87       116   138
    ## 6             75          203      57     19     16        33   125
    ## 7             77          374      99     60     44        94   102
    ## 8              3           21      11      3      0         7    35
    ## 9             94          198      23     27     32        37   125
    ## 10            17          103      30     18      5        35    50
    ## 11            18           68      40     37      8        33   114
    ## 12           156          354      44     37     98       102   242
    ## 13            11           18       5      3      2         3    14
    ## 14            46          131      12     20     22        31    77
    ## 15            19          206      93     54     20        62   171
    ## 16           117          248     140     52     62        77   211
    ## 17           345          771      89    124     89       152   237
    ## 18            51          253     262     76     39        58    97
    ## 19            98          304      79     94     79        51   204
    ## 20            23          113     198     54     20        85   194
    ## 21             4           23       3      5      0         6    18
    ## 22           103          226     189     82     30       187   183
    ## 23           174          712     157     94    167       181   168
    ## 24             1            1       6      2      0         0     4
    ## 25            51          188      77     33     20        56   109
    ## 26             7           21      23      4      4        14     7
    ## 27           111          222      32     17     39        50   166
    ## 28             9          116      78     21      7        42   104
    ## 29            20          141     204     48     10       115   187
    ## 30            65          269     121     68     11        88   141
    ## 31             0            1       0      1      1         0     5
    ## 32            19          111      51     29      6        62   108
    ## 33             6           51     131     13      0        37    29
    ## 34           157          410      74     25     91        95   202
    ## 35           111          385     300     58     23       142   157
    ## 36            46           84       9      6     12        10    25
    ## 37             0            6      14      1      0         5     5
    ## 38            75          220      35     16     11        37    94
    ## 39            14           66      21     10      4        38    47
    ## 40            46          112     170     18      9        87    83
    ## 41            53          186     267     83     21       157   169
    ## 42            31           47      15     11     20        10    42
    ## 43            43           86      21     14     11        29    45
    ## 44            60          257     166     50     36       116   158
    ## 45             8           36     108     15      0        22    32
    ## 46            25           93     130     27      5        89    87
    ## 47            16           83      45     22     23        28    42
    ## 48             5           34      52      9      1        26    18
    ## 49             8           14      16      9      0         5    12
    ## 50             1            2       1      2      1         1     0
    ## 51           121          282     176     38    124       184   192
    ## 52             5            5       4      2      1         2     4
    ## 53             2           21      23      1      0        11    20
    ## 54            16           87      44     20      2        53    34
    ## 55            60          231     285     72     42       172   202
    ## 56            30          199      48     46     25        40   151
    ## 57            16           73     114     43      2        47    84
    ## 58             1           16      15      4      0        13    14
    ## 59            23          165     110     49      8        59    91
    ## 60            62          374     213     60     34       153   198
    ## 61             6           78      55     20      5        24    52
    ## 62            37          253      45     33     37        53   138
    ## 63             6           21      28      6      1        16    28
    ## 64            23           50       4      4      7         7    17
    ## 65             2            8       3      3      1         4     6
    ## 66             0            2       0      1      0         1     0
    ## 67            41          263     563    118      8       147   146
    ## 68            14           15       2      3      6         7    11
    ## 69           178          348      64     34     80        87   179
    ## 70           135          270      99     62     58        65   189
    ## 71            51          107      25     25     23        17    85
    ## 72            11           41      36     24      8        19    29
    ## 73            52          184     265     66     13       109   140
    ## 74            53          207     179     81     23        69   141
    ## 75           124          187      40     25     16        33   110
    ## 76            15          102     209     31      1        90   101
    ## 77            31          191     303     87     16       176   130
    ## 78             1            1       1      0      0         1     1
    ## 79             9           14       0      1      4         6    15
    ## 80            46          322     439     68     20       197   152
    ## 81             5           20      20     12      1         9    31
    ## 82             5           17       3      2      0         3    17
    ## 83            39          287     136     41     15        81    93
    ## 84            31          193     124     71     58        76   120
    ## 85            56          221      36     39     28        28   100
    ## 86            30          102     112     21     12        80   146
    ## 87           112          402     182     57     30       183   162
    ## 88            25           87      42     19     21        36    76
    ## 89            23          130     312     67      9       114   119
    ## 90             2           31      33     11      2        28    39
    ## 91           148          292     124     31     40        82   125
    ## 92            16           46      14     13      7        11    36
    ## 93            47          156     151     42     48        78   105
    ## 94            22           77      46     20     28        32    75
    ## 95           297          817      96     52    135       116   212
    ## 96             3            4       0      2      0         0     3
    ## 97            14           45      28      8      5        16    21
    ## 98             6           36      48      8      6        38    29
    ## 99            16           32      57     27     11        25    31
    ## 100           70          316     290     78     13       180   134
    ## 101           38          174      66     25     19        62    75
    ## 102           63          212      74     81     27        54   143
    ## 103            2            2       3      0      0         0     0
    ## 104           42          206     499     74     16       258   149
    ## 105           11          140      63     30      7        49    86
    ## 106            1           44      86      6      6        40    42
    ## 107           92          213      56     45     40        60   103
    ## 108           39           40      12     14     13        13    63
    ## 109           66          180     283     44     17       147    84
    ## 110            3           54      14      5      2        14    27
    ## 111           46          203     268     72     21       241   242
    ## 112           11          116     136     43      7        57   101
    ## 113          129          366      44     37     61        61   180
    ## 114           20           40       2      3     17         8    40
    ## 115            1            5       0      0      1         2     5
    ## 116           18          136     200     41     20       103    95
    ## 117           23          330      82     30     38        51   113
    ## 118           45          242      82     39     32        83   200
    ## 119           26           75      34     18     11        31    55
    ## 120           55          166      67     52     25        45   125
    ## 121            6           43      13      2      1         6    22
    ## 122           23           80      23     10     22        32    74
    ## 123           98          501     533    154    106       184   217
    ## 124          296          644     104     64     92       170   203
    ## 125           94          213      49     61     39        34   135
    ## 126           64          207     229     86     41       138   112
    ## 127           33          119     164     50     32        62   131
    ## 128           96          147      27     15     22        37   137
    ## 129            4            6       1      0      6         2     3
    ## 130           89          298     529     88     40       178   177
    ## 131            3            3       1      0      0         2     2
    ## 132           30          150     217     41     13       123    95
    ## 133          195          287      67     32     38       123   154
    ## 134           52          268     418     92     31       223   164
    ## 135           29          172     188     48     40       121   150
    ## 136           42          109      43     22      8        34    73
    ## 137           44          165     202     66      4       141   180
    ## 138           36          211     205     53     24       100   121
    ## 139           57          279     162     47     34        76   139
    ## 140            4           38      35     17      2        15    36
    ## 141           32          151     169     84     28        78   141
    ## 142           48          130     164     71      8        76    92
    ## 143           23          144     203     50     11        85   114
    ## 144            2           15       5      3      0         5     6
    ## 145           24           62      20      3     17        24    44
    ## 146           17           68      33      9      7        25    48
    ## 147           34          151     112     41     15        62   129
    ## 148          142          558     434    131    151       234   246
    ## 149           61          217     423     89     13       212   199
    ## 150           49          344     252     73     20       140   117
    ## 151          188          459     158     88     95       107   254
    ## 152          167          365     187     92     38       140   168
    ## 153           94          303     117     66     15       102   128
    ## 154          293          795      57     56    161       154   226
    ## 155            8           33       7      1      1        14     6
    ## 156           22          100      90     39      8        55    77
    ## 157           47          103      19     33     24        34    90
    ## 158           39          180     109     62     27        78   150
    ## 159            6           43      37     22      1        20    35
    ## 160            1            2       3      1      1         0     6
    ## 161           43          162     449     70     13       210   167
    ## 162           32          152     192     42     36       142   175
    ## 163           21          214     418     61     33       112   127
    ## 164           41          118      30     14     33        30    66
    ## 165            9           75     193     14      1        63    30
    ## 166           11          160     110     55     13        98   125
    ## 167           17           96      62     40     11        26    77
    ## 168           79          235     142     51     22        92   111
    ## 169           48          367     155     72     23        79   161
    ## 170           81          159      58     20     49        91   122
    ## 171            6           18      11      9      3        11    22
    ## 172           78           87      12     18     20        29   113
    ## 173           17          112     213     59     14       134   115
    ## 174           41          173     170     53     24       113   124
    ## 175           28          164     385     53      8       129   197
    ## 176           69          190      64     46     19        59   165
    ## 177           95          564     906    120     37       464   215
    ## 178           66          309     276     76     86       171   197
    ## 179            3           35      14      7     10        10    37
    ## 180           34           56      17     18     29        19    47
    ## 181            6           20       4     10      2         4    15
    ## 182          167          377      84     46     34        94   248
    ## 183           31          194     121     42     16        72   154
    ## 184           42          120       8     17      9        28    91
    ## 185            8           14       9      2      4         3     8
    ## 186           64          194      37     21     55        58   168
    ## 187           15           91      98     45     20        36    95
    ## 188          100          144      17     19     67        40   109
    ## 189           45          175      64     35     18        68   142
    ## 190           39          175      81     37     13        75   103
    ## 191           33          298     639    100     32       216   165
    ## 192           52           69       7     16     32        14    52
    ## 193           38          161      46     33     75        41   144
    ## 194           30          234      75     27     23        40    98
    ## 195           11          124     184     41     14        86    79
    ## 196           17           94     120     47      8        44    93
    ## 197            3            9      13      0      0         9     4
    ## 198          128          342     417    143     32       159   112
    ## 199          161          241     103     30     37        58   127
    ## 200            5           72      45     34      4        36    41
    ## 201           16          131      54     30      8        55   121
    ## 202           23          237     224     96      8       107   163
    ## 203           33          209     144     35     18        69    93
    ## 204            1           16      15      4      0         5     5
    ## 205            8           23       3      2      6         4    11
    ## 206            4           13       2      1      2         2     1
    ## 207           61          182      66     27     76       117   112
    ## 208           21           47      19      7      0        16    12
    ## 209           92          203      57     29     78        53   151
    ## 210           58          268     831    157     49       323   151
    ## 211            4            4       4      0      0         3     6
    ## 212          102          300     111     31     26        66   145
    ## 213           60          213      71     26     17        39   122
    ## 214          226          533      57     37     63       106   216
    ## 215           20          140     126     47     25        76   146
    ## 216           49          197     213     88      8       164   150
    ## 217            4           30      57     11      2        25    30
    ## 218            8            6       0      1      0         4     9
    ## 219           13           21       7      3      6         9    12
    ## 220            7           25      37      4      0        15    14
    ## 221            4            5       3      0      3         0     0
    ## 222           23           51      50     10      4        23    31
    ## 223           35          133     140     60     39        65   132
    ## 224           46          218     488    100     43       194   133
    ## 225           43          144      29     29     12        31    62
    ## 226          151          485     264     49     37       173   248
    ## 227           30           66      34     13      7        26    45
    ## 228           71          191      55     29     43        43    91
    ## 229           27          198     102     65     31        66   109
    ## 230           23           71      66     27      6        33    52
    ## 231           65          142      63     25     38        62    73
    ## 232            9           43       9     12     10        19    25
    ## 233          296          711     220     57    103       212   241
    ## 234           80          350     260    132     55       154   122
    ## 235            3           38      58     18      7        31    38
    ## 236           72          288     148     43     29        96   207
    ## 237           45          263     435     85     22       168   119
    ## 238          180          279      55     43     40        58   124
    ## 239           45          186     177     91     52       125   165
    ## 240           55          193     193     89     12        86   118
    ## 241           39          474     300     66     99       138   117
    ## 242          148          518     116     53     22       122   125
    ## 243           41          101      23      7     20        29    66
    ## 244           44           80      29     14     17        17    64
    ## 245           11          112      99     41      7        65    79
    ## 246           49          236     160     66     40       128   139
    ## 247          118          285      47     36     48        61   172
    ## 248           24          142     188     78     36        89   178
    ## 249           60          146      29     15     21        28    69
    ## 250          111          364      97     47    130       118   244
    ## 251           33          175      91     51     26        39    63
    ## 252            7           90      35     11      8        29    60
    ## 253           48          239     417     88     19       173   170
    ## 254          157          282     117     36    104        76   174
    ## 255            8           40       9      7      5        11    29
    ## 256            4            6       2      3      1         5     4
    ## 257           52          178     418     83     25       180   157
    ## 258          174          350     139     46     89        98   158
    ## 259            1           23      25      3      2        11    12
    ## 260           32          110      35     21      5        25    85
    ## 261            7           28      28      6      1        18    20
    ## 262          120          249      96     82     40        56   149
    ## 263          105          115      57     18     24        29    78
    ## 264           15           89      81     31      8        48    82
    ## 265           97          543     646     92     44       303   134
    ## 266           12           58      56     15      9        40    25
    ## 267           47          127      39     81     35        47   122
    ## 268           82          161      42     52     90        46   137
    ## 269           13          129      36     21     11        25   118
    ## 270           63          232      74     48     20        43    61
    ## 271            3           20      11      5      1         8    23
    ## 272           47          166     317     84     12       113   140
    ## 273           11          113     193     39      1        95   112
    ## 274            5           12      11      7      0         8    10
    ## 275           28          129     183     82     16        96   119
    ## 276           60          402     338     67     99       166   171
    ## 277          238          611     121     40     65       118   213
    ## 278           14          164     147     44      9        70    90
    ## 279            1            8       3      1      0         2     5
    ## 280           77          289     160     52     25        87   168
    ## 281           78          228     364    125     34       159   192
    ## 282           20          126      62     30     14        58    74
    ## 283          107          385     126     82     42       129   254
    ## 284           96          252      60     67     70       108   263
    ## 285           88          285      66     23     41        69   229
    ## 286           23           28      10      4      4        12    23
    ## 287           89          409     106     58     53        60   134
    ## 288           50          123      70     19     29        46    77
    ## 289           15           76      45     12      9        24    47
    ## 290           24          123     357     53      0       133   153
    ## 291          125          216      89     85     70        85   214
    ## 292           22           42       8     15      8        12    30
    ## 293            5           15      11      9      2         7    18
    ## 294           27          209      71     13     28        35   172
    ## 295           40          153      53     28     27        66    92
    ## 296           24          128     113     38     23        66   102
    ## 297            2            1       2      0      0         0     2
    ## 298          156          409     114     81     77        56   187
    ## 299           31          211     433     92     19       156   126
    ## 300           13           55      30      9      5        14    35
    ## 301            3           36      22      2      0        13     9
    ## 302           76          164      95     30     41        55    97
    ## 303           15           27       3      7      4         8    25
    ## 304           47           79      69     29     11        51    79
    ## 305           11          151      48     12     13        37   109
    ## 306           19          185     236     79     27       135   149
    ## 307           81          138      64     20     42        44   126
    ## 308          139          448     106     74    173       105   262
    ## 309           57          187      79     40     20        59   154
    ## 310           47          103      20     22     25        22    55
    ## 311            9           21      12      2      2         4    17
    ## 312           25          112      58     37     14        36   137
    ## 313           46          435     455     86     29       194   109
    ## 314           26           69      47     17      8        26    43
    ## 315           21          205     188     46     32       128   144
    ## 316          212          503     358     60     55       171   214
    ## 317           61          323      75     53     56        79   128
    ## 318          176          603     208     77     74       117   180
    ## 319          131          256      31     30     27        64   154
    ## 320           26          142      82     51     14        70   127
    ## 321            0           11      14      8      0         7    18
    ## 322           25           57      21     10     10        18    52
    ## 323           48          115      15      5     10        14    51
    ## 324            6           14      11     13      2        10    24
    ## 325          118          397     121    116     41        43   193
    ## 326           23          106      26     31      5        14    53
    ## 327           64          122      17     26     45        33   109
    ## 328           10           42      28      6      2        17    23
    ## 329            1            6       0      0      0         3     4
    ## 330           95          299     281     99     25       100   222
    ## 331           22           79      77     32     15        36    62
    ## 332           62          229      76     40     23        38   120
    ## 333           24          118     280     65      3       101   109
    ## 334          107          394     150     24     70        81   110
    ## 335           58          434     251    117     27       218   206
    ## 336          111          422     252     90     62       158   186
    ## 337            1           47      10      4      5        16    40
    ## 338           15          110      36     15     16        40    78
    ## 339           18           89      18     14     15        19    58
    ## 340            1            3      14      3      0         5     7
    ## 341           73          282     461     99     11       168   144
    ## 342           26           30       4      3      6         8    37
    ## 343           11           62     129     26      3        46    43
    ## 344            9          146     135     35      9        80    99
    ## 345            4           45      23     19     10        14    32
    ## 346            4           26      34     21      5        15    48
    ## 347           33          184     191     67     22        83   125
    ## 348           13           51      29     18      3        10    22
    ## 349           21           92     270     35      5       114   129
    ## 350           28          174      78     26     10        52   153
    ## 351           94          217      58     42     55        55   136
    ## 352           68          237     682    128     10       195   202
    ## 353           92          344     102    127     69       131   203
    ## 354          244          276      80     18    117        90   151
    ## 355           16          186      96     39     11        65   132
    ## 356           95          162     124     45     18        56   140
    ## 357           12           86     107     34      8        56    74
    ## 358           96          356     154     82     44       116   177
    ## 359            3            8      18     11      1         3    14
    ## 360            1            1       1      0      2         1     3
    ## 361           35          155      82     44     26        74    79
    ## 362          314          721      97     49    214       148   246
    ## 363          137          727     840    133     31       438   190
    ## 364          112          218      68     32     14        55   142
    ## 365            1           17       8      4      5         4     5
    ## 366           97          211      14     32     61        40   152
    ## 367           94          190      76     38     21        41    83
    ## 368           12           47      52     13      2        16    38
    ## 369           22          258     157     46      6       136   118
    ## 370           19           69     130     28      6        43    79
    ## 371           29          127      15      7     33        39    76
    ## 372           21          136     344     48      4       128    95
    ## 373           25          153     188     79      7        92   126
    ## 374           84          136      35     22      6        56    86
    ## 375            8           53      67     32      2        41    38
    ## 376           28          123     139     38     20        61   120
    ## 377           41           44      13      9      9        13    49
    ## 378            4           30      15      8      2         5    17
    ## 379           20          108     154     42      3        90   100
    ## 380           51          111      27     16     13        37    64
    ## 381           51          256     141     71     32        82   182
    ## 382           27          137     185     44     23        66   119
    ## 383            6           39      19      2      4         9    16
    ## 384           36          153     105     56     24        71   121
    ## 385           61          292     523    143     17       239   183
    ## 386           11           24       4      2      5         3    17
    ## 387          282          333      86     88     78       146   195
    ## 388           39          212     534    133     10       159   139
    ## 389          125          214      75     76     39        57   175
    ## 390           38           65      13     14     15        28    40
    ## 391          143          199      39     30     44        58   173
    ## 392            4           64      43     34     13        35    61
    ## 393           40          187     131     45     11        47    69
    ## 394           54          216     107     96     31        58    97
    ## 395          131          318     122    114     30        96   135
    ## 396           84          139      31     26      9        46    76
    ## 397           40           74      23     10     26        17    84
    ## 398            8           14       4      1      1         6     8
    ## 399           34          139     335     56      6       101   133
    ## 400           35          189     182     55     15       106   103
    ## 401            4           10      11      2      3        11     6
    ## 402          104          160      43     16     31        72   133
    ## 403           25          123      75     32     10        73   154
    ## 404           63          353     142     60     39        95   133
    ## 405           25           58      92     26      6        38    60
    ## 406          166          225      98    115     29       100   178
    ## 407            9          104     285     33      2        89    92
    ## 408           22          226      96     54     14        55   125
    ## 409            5           17       6      6      1         3    18
    ## 410           54          405     175    147     20        74   133
    ## 411          142          428     138     76     28       127   152
    ## 412            7           40     100     11      5        48    54
    ## 413           48          187      70     26     20        64    97
    ## 414          287          429      77     39     84        64   176
    ## 415           21           79      46     21      4        45    90
    ## 416            9           15       6      3      1         6    18
    ## 417           44          135     335     74      6       129   119
    ## 418            6           21      52     20      2        21    29
    ## 419           50          243     233     84     44        90   176
    ## 420           20           75     226     48      5        77    73
    ## 421           43           81      42      7     21        20    61
    ## 422            7           44      33     12      5        22    19
    ## 423          154          385      30     33     24        67   126
    ## 424           10           57     156     47      5        38    50
    ## 425            8           28       6      5      1         8    22
    ## 426           39          252     176     78     21       119   155
    ## 427           36          191     133     60     36        50   163
    ## 428           11           35      61     18      7        40    40
    ## 429           18          115      70     35      4        30    70
    ## 430            1           10      12      4      1         9    12
    ## 431           26          155      23     29     30        18    83
    ## 432           18          241     210     77     16       102   161
    ## 433           58          201     206     48     28        97   110
    ## 434           85          255      80     53     45        69   147
    ## 435          129          203      26     18     47        31   137
    ## 436          170          332      96     41     36       100   150
    ## 437          104          356     143     52     30       114   172
    ## 438           16           83     155     40      7        56    79
    ## 439           18          141     139     41     10        85   104
    ## 440          182          416     122     38     10        99   136
    ## 441          140          270     132     59     33        88   166
    ##     efficiency
    ## 1    2.0454545
    ## 2    2.0923077
    ## 3    8.0875000
    ## 4    2.9444444
    ## 5   13.0735294
    ## 6    6.0757576
    ## 7    9.1147541
    ## 8    0.7666667
    ## 9    8.8510638
    ## 10   3.5238095
    ## 11   1.6029412
    ## 12   9.5324675
    ## 13   6.6666667
    ## 14   5.8717949
    ## 15   4.9873418
    ## 16   8.3125000
    ## 17  18.0000000
    ## 18   9.4473684
    ## 19   7.8101266
    ## 20   4.7916667
    ## 21   2.3000000
    ## 22   8.5731707
    ## 23  22.0666667
    ## 24   1.7777778
    ## 25   5.1230769
    ## 26   6.2500000
    ## 27   6.0933333
    ## 28   3.6393443
    ## 29   4.7972973
    ## 30   8.3090909
    ## 31   2.5000000
    ## 32   2.7049180
    ## 33   4.6923077
    ## 34   9.9506173
    ## 35  17.0819672
    ## 36   5.8857143
    ## 37   0.1600000
    ## 38   5.4687500
    ## 39   4.9230769
    ## 40   3.5479452
    ## 41   8.9220779
    ## 42   6.0000000
    ## 43   4.8269231
    ## 44   5.7215190
    ## 45   4.7391304
    ## 46   4.0000000
    ## 47   2.7021277
    ## 48   1.9024390
    ## 49   3.4615385
    ## 50   1.0000000
    ## 51  10.5333333
    ## 52   1.2222222
    ## 53   0.3888889
    ## 54   5.5600000
    ## 55   9.1125000
    ## 56   4.0394737
    ## 57   3.2580645
    ## 58   0.2727273
    ## 59   5.7017544
    ## 60   9.5810811
    ## 61   3.0294118
    ## 62   5.0135135
    ## 63   3.2777778
    ## 64   5.4117647
    ## 65   4.0000000
    ## 66   1.0000000
    ## 67  17.0655738
    ## 68   3.4615385
    ## 69  13.4153846
    ## 70  12.1774194
    ## 71   3.7580645
    ## 72   4.3333333
    ## 73   6.2750000
    ## 74   6.4545455
    ## 75   6.8636364
    ## 76   3.4871795
    ## 77   6.8888889
    ## 78   3.0000000
    ## 79   2.5000000
    ## 80  13.6000000
    ## 81   0.5111111
    ## 82   1.1052632
    ## 83  11.2063492
    ## 84   4.8676471
    ## 85   5.4090909
    ## 86   3.0454545
    ## 87   7.4938272
    ## 88   3.7073171
    ## 89   7.9411765
    ## 90   1.0256410
    ## 91   8.9746835
    ## 92   6.1500000
    ## 93   6.2794118
    ## 94   2.4029851
    ## 95  21.3950617
    ## 96  11.0000000
    ## 97   2.2631579
    ## 98   1.8684211
    ## 99   5.2592593
    ## 100 13.9054054
    ## 101 19.0588235
    ## 102  5.3194444
    ## 103  2.4000000
    ## 104  8.5822785
    ## 105  2.3157895
    ## 106  4.7083333
    ## 107  8.8400000
    ## 108  4.6562500
    ## 109  9.4843750
    ## 110  3.6800000
    ## 111  6.6282051
    ## 112  4.5230769
    ## 113  9.2631579
    ## 114  2.3611111
    ## 115  0.2857143
    ## 116  6.3695652
    ## 117  8.5925926
    ## 118  3.7530864
    ## 119  3.9411765
    ## 120  3.4691358
    ## 121  2.6818182
    ## 122  1.9302326
    ## 123 16.4868421
    ## 124 19.1756757
    ## 125  7.0129870
    ## 126  9.7500000
    ## 127  4.6575342
    ## 128  7.1304348
    ## 129 17.0000000
    ## 130 11.7073171
    ## 131  0.5000000
    ## 132  5.8909091
    ## 133 10.9305556
    ## 134 13.4848485
    ## 135  4.1466667
    ## 136  7.7692308
    ## 137  6.6029412
    ## 138  6.6461538
    ## 139  6.1200000
    ## 140  1.7837838
    ## 141  5.8153846
    ## 142  7.9473684
    ## 143  9.6938776
    ## 144  0.1739130
    ## 145  5.6363636
    ## 146  2.1276596
    ## 147  4.7083333
    ## 148 21.3250000
    ## 149 11.4109589
    ## 150 12.2465753
    ## 151 12.4390244
    ## 152 11.5308642
    ## 153  8.2658228
    ## 154 20.0519481
    ## 155  1.1578947
    ## 156  3.0779221
    ## 157  8.1935484
    ## 158  4.2500000
    ## 159  1.8461538
    ## 160  1.0000000
    ## 161 13.2631579
    ## 162  4.1506849
    ## 163  7.6049383
    ## 164  6.6315789
    ## 165  6.1142857
    ## 166  4.2692308
    ## 167  2.4390244
    ## 168 11.4313725
    ## 169  9.8333333
    ## 170  7.9000000
    ## 171  0.3428571
    ## 172  4.3703704
    ## 173  3.7073171
    ## 174  3.8414634
    ## 175  6.4800000
    ## 176  6.0312500
    ## 177 22.4567901
    ## 178 10.0131579
    ## 179  1.4166667
    ## 180  3.1346154
    ## 181  1.2413793
    ## 182  9.7142857
    ## 183  5.3593750
    ## 184  4.1190476
    ## 185  3.6666667
    ## 186  4.9594595
    ## 187  3.0270270
    ## 188  5.9740260
    ## 189  4.0384615
    ## 190  4.3043478
    ## 191 13.9146341
    ## 192  4.0196078
    ## 193  4.8589744
    ## 194  6.7741935
    ## 195  9.8055556
    ## 196  4.1587302
    ## 197  5.0000000
    ## 198 18.1052632
    ## 199 11.8478261
    ## 200  3.8611111
    ## 201  3.1730769
    ## 202  5.9512195
    ## 203  4.5256410
    ## 204  0.6666667
    ## 205  2.4736842
    ## 206  2.0833333
    ## 207 14.7419355
    ## 208  3.4500000
    ## 209  8.4310345
    ## 210 16.9358974
    ## 211  2.7500000
    ## 212  7.6800000
    ## 213  4.3589744
    ## 214 13.3250000
    ## 215  4.0256410
    ## 216  4.9756098
    ## 217  4.7894737
    ## 218  1.4285714
    ## 219  1.8000000
    ## 220  3.1764706
    ## 221  8.0000000
    ## 222  4.1363636
    ## 223  5.5283019
    ## 224 10.9850746
    ## 225  4.2258065
    ## 226 13.4864865
    ## 227  6.0000000
    ## 228  5.5312500
    ## 229  4.2804878
    ## 230  6.8888889
    ## 231 16.9500000
    ## 232  3.9000000
    ## 233 20.1951220
    ## 234 15.5810811
    ## 235  2.2380952
    ## 236  7.8133333
    ## 237 10.4177215
    ## 238 11.6557377
    ## 239  5.6712329
    ## 240  5.5526316
    ## 241 20.1935484
    ## 242 14.4166667
    ## 243  4.0204082
    ## 244  3.6415094
    ## 245  8.7241379
    ## 246  6.6794872
    ## 247  7.7605634
    ## 248  4.3333333
    ## 249  4.7678571
    ## 250 11.0606061
    ## 251  4.9861111
    ## 252  3.6857143
    ## 253 14.5166667
    ## 254  8.8734177
    ## 255  1.7500000
    ## 256  0.4285714
    ## 257 11.0416667
    ## 258 12.0972222
    ## 259  6.1666667
    ## 260  3.7173913
    ## 261  2.2631579
    ## 262  9.6666667
    ## 263  4.9016393
    ## 264  2.5074627
    ## 265 21.6891892
    ## 266  6.4347826
    ## 267  4.3125000
    ## 268  8.3333333
    ## 269  2.0735294
    ## 270  6.1428571
    ## 271  1.5909091
    ## 272  7.5600000
    ## 273  3.2739726
    ## 274  1.2727273
    ## 275  4.7971014
    ## 276 13.2702703
    ## 277 14.2195122
    ## 278  5.0135135
    ## 279  3.4000000
    ## 280  6.2784810
    ## 281  8.3797468
    ## 282  2.1230769
    ## 283  9.4210526
    ## 284  5.9268293
    ## 285  6.0243902
    ## 286  3.1904762
    ## 287  8.8947368
    ## 288 11.4444444
    ## 289  6.9500000
    ## 290  5.1052632
    ## 291  7.5454545
    ## 292  2.9375000
    ## 293  0.6000000
    ## 294  3.5405405
    ## 295  6.0535714
    ## 296  5.2444444
    ## 297 -0.1111111
    ## 298 11.1728395
    ## 299 12.5362319
    ## 300  3.4666667
    ## 301  2.3500000
    ## 302  5.7571429
    ## 303  4.2307692
    ## 304  2.7352941
    ## 305  1.8142857
    ## 306  5.9594595
    ## 307  8.3103448
    ## 308 13.5679012
    ## 309  4.8461538
    ## 310 11.3181818
    ## 311  2.6000000
    ## 312  3.3000000
    ## 313 11.8311688
    ## 314  2.2407407
    ## 315  4.4250000
    ## 316 18.3150685
    ## 317  6.8428571
    ## 318 14.1733333
    ## 319  6.2297297
    ## 320  4.1973684
    ## 321  1.0769231
    ## 322  2.9714286
    ## 323  6.4193548
    ## 324  3.0769231
    ## 325 10.9250000
    ## 326  6.8333333
    ## 327  4.8000000
    ## 328  2.0512821
    ## 329 -0.6000000
    ## 330 10.2238806
    ## 331  2.6056338
    ## 332  5.5230769
    ## 333  4.7375000
    ## 334 12.4375000
    ## 335 12.0000000
    ## 336 14.1739130
    ## 337  1.8800000
    ## 338  3.1363636
    ## 339  4.8437500
    ## 340  2.3333333
    ## 341  9.9275362
    ## 342  2.6551724
    ## 343  4.2600000
    ## 344  3.1739130
    ## 345  1.1463415
    ## 346  1.8500000
    ## 347  4.9000000
    ## 348  2.8709677
    ## 349  6.1153846
    ## 350  3.8860759
    ## 351  9.3157895
    ## 352 14.0800000
    ## 353  8.9253731
    ## 354  8.7530864
    ## 355  4.2542373
    ## 356  4.5128205
    ## 357  3.1923077
    ## 358  9.4102564
    ## 359  1.7857143
    ## 360  0.8333333
    ## 361 11.5333333
    ## 362 21.7407407
    ## 363 22.8024691
    ## 364  5.4305556
    ## 365  1.5000000
    ## 366  6.1643836
    ## 367  5.1038961
    ## 368  1.7857143
    ## 369  6.1714286
    ## 370  2.4531250
    ## 371  7.7826087
    ## 372  4.8088235
    ## 373  5.9714286
    ## 374  4.5128205
    ## 375  2.3018868
    ## 376  4.7236842
    ## 377  7.5000000
    ## 378  2.0666667
    ## 379  4.5272727
    ## 380  7.5454545
    ## 381  5.7625000
    ## 382  7.4915254
    ## 383  4.0000000
    ## 384  3.0129870
    ## 385 13.0253165
    ## 386  1.8421053
    ## 387 12.1375000
    ## 388  9.9012346
    ## 389  8.8333333
    ## 390  6.2608696
    ## 391  7.2388060
    ## 392  4.5416667
    ## 393  4.1756757
    ## 394  7.3225806
    ## 395  9.4729730
    ## 396  6.0000000
    ## 397  3.0350877
    ## 398  3.5000000
    ## 399  7.5230769
    ## 400  5.7215190
    ## 401  1.0000000
    ## 402  6.5740741
    ## 403  3.2753623
    ## 404  8.6707317
    ## 405  2.9473684
    ## 406  7.9718310
    ## 407  6.1904762
    ## 408  4.4375000
    ## 409  1.4814815
    ## 410  8.4250000
    ## 411 10.9577465
    ## 412  2.0000000
    ## 413  3.1408451
    ## 414 13.3974359
    ## 415  0.6567164
    ## 416  5.6666667
    ## 417  8.5507246
    ## 418  3.8636364
    ## 419  8.8904110
    ## 420  4.6393443
    ## 421  3.8039216
    ## 422  5.5714286
    ## 423 15.4893617
    ## 424  3.9833333
    ## 425  2.8235294
    ## 426  6.7910448
    ## 427  5.3424658
    ## 428  2.4242424
    ## 429  2.5161290
    ## 430  1.9090909
    ## 431  2.9705882
    ## 432  5.8219178
    ## 433  8.5000000
    ## 434  7.7200000
    ## 435  6.7605634
    ## 436  9.6250000
    ## 437  8.9859155
    ## 438  6.8888889
    ## 439  6.8723404
    ## 440  9.7534247
    ## 441  9.5000000

``` r
ggplot(combine1, aes(x = reorder(team, -efficiency), y = efficiency)) + geom_bar(stat='identity') + labs(title = "NBA Teams ranked by Total Efficiency", x="Team", y="Total Efficiency") + coord_flip() + geom_hline(aes(yintercept = mean(efficiency), color="red"))
```

![](hw03-selicia-hou_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-11-1.png) The salary graph shows that cleveland and LAC both earn substantially more than the average of around 90 million. The graph of total points show that gsw and lac have substantially more points than the average of around 8200 points. The efficiency graph shows that CLE and GSW have a substantially higher efficiency than the average of around 150. These graphs show that GSW, CLE, and LAC are realtively strong teams.

``` r
help(prcomp)
```

    ## starting httpd help server ... done

``` r
stats1 <- select(stats, points3_made, points2_made, points1_made, off_rebounds, def_rebounds, assists, steals, blocks, turnovers, fouls)
stats1
```

    ##     points3_made points2_made points1_made off_rebounds def_rebounds
    ## 1             86          293          108           95          369
    ## 2             27          186           67          117          248
    ## 3            108          251           68           65          269
    ## 4              1            2            3            2            2
    ## 5             39           56           33           17           68
    ## 6            245          437          590           43          162
    ## 7            157          176          176           48          367
    ## 8             12           13            6            6           20
    ## 9             46          146           85           45          175
    ## 10            45           69           26           60          213
    ## 11             0           15            8           13           21
    ## 12            68          192           90           72          288
    ## 13            94          175          203           78          228
    ## 14            57           94           51           40          187
    ## 15             0           78           22           43           81
    ## 16           137          101           63           37          253
    ## 17             0            3            3            1            1
    ## 18            22           46           21            1           44
    ## 19            21           33           27            3           54
    ## 20             0            3            0            4            6
    ## 21            94          107           71           39          180
    ## 22            95           28           10           17           96
    ## 23            31           13           13            3           35
    ## 24             7           55           35            3           38
    ## 25           145          225          257          148          518
    ## 26            97           34           14            7           90
    ## 27           177          494          297           52          178
    ## 28           124          612          358           97          543
    ## 29            62           91           80           28          174
    ## 30             0          262          106          287          429
    ## 31             2            4            0            5            5
    ## 32            48          251           94           52          184
    ## 33            10           39           42           16           32
    ## 34            33          688          545           70          316
    ## 35           109          111           89           63          212
    ## 36            11           28           18            4           38
    ## 37             0           67           31           78           87
    ## 38             1          390          176          226          533
    ## 39           193          233          299           48          239
    ## 40             3          100           44           82          161
    ## 41            56          171          126           26          142
    ## 42            24           28           11           23          106
    ## 43             1          102           22           64          122
    ## 44            94           60           43           62          229
    ## 45            41           87           30           29          127
    ## 46            45           62           71           14           66
    ## 47           223          414          282           53          186
    ## 48            11           18           12            8           36
    ## 49             0            0            1            0            2
    ## 50             0           12            0            5           17
    ## 51             0           65           43           47          103
    ## 52            37          137           35           64          194
    ## 53            89          558          422           58          268
    ## 54             0          390          103          238          611
    ## 55            71          335          180          107          385
    ## 56           148          266           99          118          397
    ## 57             7           23           23            4           30
    ## 58             9           52           23           25           58
    ## 59            31           85           22            7           40
    ## 60             1           46            6           14           45
    ## 61           100          448          218           42          206
    ## 62             0          388          226          296          644
    ## 63            32           61           52           42          109
    ## 64             8           15            7            7           25
    ## 65            92          203          119           45          186
    ## 66            19           68           64           60          146
    ## 67            26          119           75           11          113
    ## 68            33           24           22           13           55
    ## 69            46          124           49           76          164
    ## 70            75          355          311          111          422
    ## 71             4            4            5            1           17
    ## 72            41          133           55           54          216
    ## 73           149          266          164           35          189
    ## 74            49          607          471          142          558
    ## 75             0          387          177          167          365
    ## 76            65          334          162           79          235
    ## 77            73           32           24           15           91
    ## 78             0          159           74           92          203
    ## 79            45          105           81           11          112
    ## 80            78          212          109           47          166
    ## 81            79          129           82           24          123
    ## 82            18          198           78           40          153
    ## 83           104           52           35           11          151
    ## 84            26           31            2            4           45
    ## 85             9           21           14            6           39
    ## 86            28           55           32           40           74
    ## 87           144          102           47           22          226
    ## 88            48           73           32           18           51
    ## 89             0          235           65           75          203
    ## 90           169          112           84           30          199
    ## 91             1            8            2            2           15
    ## 92            90          312          360           33          298
    ## 93             5           21           11            1           16
    ## 94             0          109           14           41          101
    ## 95             5           13            2            1           23
    ## 96             0           77           23          105          115
    ## 97            43          204           93           19          185
    ## 98            40          404          245          139          448
    ## 99           195          427          336           58          434
    ## 100            0           19           21           26           30
    ## 101           45          317           45          131          318
    ## 102            6            6           11            1            1
    ## 103           32          151           39           75          220
    ## 104           11           10            1            1           16
    ## 105            0          128           60          124          187
    ## 106           73           29           14           11          140
    ## 107           45          369          223           64          207
    ## 108           25           38           30            6           43
    ## 109           49           79           65           17           94
    ## 110           91          479          585          128          342
    ## 111            6           31            9           21           47
    ## 112           15           97           58           24          128
    ## 113          129          129           99           61          323
    ## 114           33           55           31           15          110
    ## 115           50          179           30           73          282
    ## 116            0          382           75          244          276
    ## 117           85          196           82           18          136
    ## 118          117          417          298           61          217
    ## 119            0          542          225          293          795
    ## 120           87          281          152           66          309
    ## 121           13           31            6           23           51
    ## 122           75          127           60           35          133
    ## 123            7           73           29           23           71
    ## 124           87           26           11           13          129
    ## 125           12           21           20           25           57
    ## 126           73          117           44           95          162
    ## 127           93          264          195           50          243
    ## 128            0           11            9            8           28
    ## 129          149           82           37           18          115
    ## 130            1          161           49          129          203
    ## 131            2          481          137          345          771
    ## 132            0          143           79          111          222
    ## 133           11           81           32            6           51
    ## 134            0           72           47           46           84
    ## 135           12           35           21            2           31
    ## 136           10           13            4            8           33
    ## 137           28          301           72           21          214
    ## 138           49          261           98          102          300
    ## 139          153          217          154           55          193
    ## 140          118          303          145           77          289
    ## 141            0            1            2            2            1
    ## 142           28           26            5           13           51
    ## 143           66          218          118           21           92
    ## 144           45           84           36           36          153
    ## 145          109          402          190           63          353
    ## 146           17           29           33            5           34
    ## 147            1           19            9            8           14
    ## 148            0           12           11           14           15
    ## 149            0          253          133          135          270
    ## 150          116          204          118           57          279
    ## 151           41          185          110           30          234
    ## 152            1            7            1            4            4
    ## 153          240          403          304           45          263
    ## 154          102          162          150           14          164
    ## 155          124          173          131           89          409
    ## 156            1          294          152          156          409
    ## 157            0           14            3           15           27
    ## 158          135          258          243           46          435
    ## 159           21           79           91           11           62
    ## 160            9           10           10            5           17
    ## 161          151          451          304           62          374
    ## 162           10           18           29            6           21
    ## 163          108          213           85           53          207
    ## 164           13          447          221           66          180
    ## 165            0           99           34          161          241
    ## 166           97          136           66           27          198
    ## 167          112          331          198          111          364
    ## 168            2          213           64          157          282
    ## 169           38           59           43           32          110
    ## 170            0           16            8           23           28
    ## 171            1           38           19           22           42
    ## 172           54          104           55           47           79
    ## 173           23           59           28           12           86
    ## 174           23           19           17           12           47
    ## 175            4          242           91          170          332
    ## 176           77          316          156          116          289
    ## 177            0          179          125          157          410
    ## 178           32           64           57           16           73
    ## 179           95          100          131           15          102
    ## 180           20           11            0            5           20
    ## 181           40          390          146           89          298
    ## 182          128          280          223           44          165
    ## 183           53          167          145           39          175
    ## 184           56           47           65            5           72
    ## 185            1            1            9            1            8
    ## 186           43           74           40           20          126
    ## 187           23          460          107          176          603
    ## 188            0            0            0            1            6
    ## 189            0           10            3           11           24
    ## 190           46           69           23            4           64
    ## 191            6           19            8           11           18
    ## 192          106          275          172          112          402
    ## 193           61          173          133           34          151
    ## 194            0          242          106           81          159
    ## 195            2            9            9            3            9
    ## 196           36          164          191           61          182
    ## 197           21           54           32           30           66
    ## 198          132          119          122           21          205
    ## 199           27          203           72           94          217
    ## 200          137          155          143           92          344
    ## 201           92          118           18           21          136
    ## 202            7           54           19           41           44
    ## 203           11          225           73           39          212
    ## 204            2           12            9            8           14
    ## 205           50           95          105           25          123
    ## 206            2           11            2            4           23
    ## 207            4           30           23            7           21
    ## 208          134          421          295          121          282
    ## 209           59          112           67           23          165
    ## 210           44          160           91           32          152
    ## 211           58          117          115           11          124
    ## 212           85           69           35           16          131
    ## 213           55          119           39           71          191
    ## 214           11           35           23            9           43
    ## 215           36           29           43           18           89
    ## 216           67           51           54            9          146
    ## 217           15          220          190           96          356
    ## 218          105          200          204           22          258
    ## 219           38           96          126           27          137
    ## 220           25          280           74          142          428
    ## 221           64          155           72           51          253
    ## 222            0            8            3            9           14
    ## 223            3          132           43           47          156
    ## 224           81          191          151           98          501
    ## 225           61          150           44           22          100
    ## 226            2           60           21           34           56
    ## 227            0          208           56          100          144
    ## 228          117          434          336           39          474
    ## 229            2           54           21           44           80
    ## 230          268          376          186           49          236
    ## 231           18           20           20           15           76
    ## 232           41           65           29           22           79
    ## 233            1          172           42           28          123
    ## 234          324          351          325           61          292
    ## 235            0          164           98          140          270
    ## 236           17           19            5            2           21
    ## 237          118           58           27           31          193
    ## 238            0          248           80          148          292
    ## 239           69           34           28           22           77
    ## 240            9           41           21            6           36
    ## 241            0          161           65          129          366
    ## 242            0           10            5            8           23
    ## 243           30          147           99           20          140
    ## 244          147          489          469           80          350
    ## 245           15           78           45           33          175
    ## 246           23          477          220          174          350
    ## 247           89           82           86           28          129
    ## 248          147          126           66           24          118
    ## 249           56          247          130          107          394
    ## 250           23          242           85            9          104
    ## 251           14            9            2            0            6
    ## 252            0            5            4            2            8
    ## 253            0          362           94          178          348
    ## 254          246          166          147           29          172
    ## 255            0            1            1            1            2
    ## 256          262          412          746           95          564
    ## 257            4            0            1            4            6
    ## 258           41           61           98           12           58
    ## 259            1          224           76           81          138
    ## 260          110          118           73           95          299
    ## 261          204          119          129          112          218
    ## 262           60          143           38           94          190
    ## 263          191          135           93           54          405
    ## 264            8           14            6            9           15
    ## 265           14           16           12            3           21
    ## 266          111          212          132           20          141
    ## 267           38          441          320          111          385
    ## 268            1          106           77           43           86
    ## 269            0            2            0            1            2
    ## 270          124          250          232           41          263
    ## 271            0          412          205          297          817
    ## 272            0            3            4            1            5
    ## 273          201          195          180           11          160
    ## 274          116          243          174           17          112
    ## 275           43          148           59           47          127
    ## 276          103          141          120           88          285
    ## 277           15           13           10            1           47
    ## 278           46          175           50           33          184
    ## 279           29           44           11           26          155
    ## 280           25           74           60           17          103
    ## 281           20          126           26           46          112
    ## 282           44          111           58           30          102
    ## 283            3          200           67           92          213
    ## 284           94          195          157           23          144
    ## 285          149          396          362           49          344
    ## 286            0           55           36           52           69
    ## 287          123           81           50           23          237
    ## 288          106          167           63           33          209
    ## 289            1            8            3            4           13
    ## 290           10           31            8            4           26
    ## 291          114          158           90           16          186
    ## 292            0          413          311          314          721
    ## 293           37          133           53           20          108
    ## 294           65           94           57           48          187
    ## 295           94           40           44           18           68
    ## 296           45          170           47           98          304
    ## 297           51          141           44           45          242
    ## 298           21           35           12            6           43
    ## 299            5          397          224          195          287
    ## 300           43          103           86           38          161
    ## 301            2            4            0            4            5
    ## 302            7           27           13            8           40
    ## 303            0           14            5            9           21
    ## 304            3           13            8            0           11
    ## 305          200          624          710          137          727
    ## 306           12           65           17           19           69
    ## 307            0          374          157          282          333
    ## 308            1           88           28           38           65
    ## 309          127          285          116           39          252
    ## 310           43           74          148           23          113
    ## 311            0           83           23           31           47
    ## 312           25           50           35            6           78
    ## 313            0           24           10           20           40
    ## 314           51           95           86           69          190
    ## 315           55          195          134          167          377
    ## 316            9           49           40           42          120
    ## 317          104          428          278           60          402
    ## 318          171          293          316           31          211
    ## 319           15          259           80          166          225
    ## 320          138           47           43           21           79
    ## 321          112           81           88           36          191
    ## 322            3           33           31           11           35
    ## 323            3           17           12            1           10
    ## 324           21          412          141          182          416
    ## 325           70          113           96           77          374
    ## 326          134          169          105           19          206
    ## 327          185          507          268           60          231
    ## 328          214          447          488           46          322
    ## 329            0           75           50           96          147
    ## 330           31          204           85           36          211
    ## 331           13           13           13            6           18
    ## 332            0          120           64           65          142
    ## 333           68          246           77          125          216
    ## 334           74           72           35           27          209
    ## 335            7          123           60          131          256
    ## 336           17           20            7           10           42
    ## 337           34           39           38            8           53
    ## 338            5            8            0            4           10
    ## 339          126          209          349           39          287
    ## 340           53           42           19           25           87
    ## 341           56          152          131           30          150
    ## 342          107          213          104           48          130
    ## 343          115          180          106           41          173
    ## 344          106          162           45           28          164
    ## 345           46           55           57           43          144
    ## 346            0          228          131          180          279
    ## 347            9           24            8            5           12
    ## 348            0           99           47           50          123
    ## 349            8            1            2            3           36
    ## 350           45          449          188          212          503
    ## 351            0            2            0            1            1
    ## 352           87          208          143           58          201
    ## 353          110          323          141          104          356
    ## 354            0           89           29           46          131
    ## 355           40          730          519          174          712
    ## 356            1            4            0            0            1
    ## 357            0           36           15           23           50
    ## 358           71          103           16           56          221
    ## 359           36          106           94           38          174
    ## 360           11           46           25           26           75
    ## 361           77          206           57           33          119
    ## 362           37           68           20            4           30
    ## 363          100          305          119           46          218
    ## 364            0           31           23           48          115
    ## 365            6           16            2            1            3
    ## 366           94           89          103           51          256
    ## 367           40          123           98           34          139
    ## 368            5           12            9            8           28
    ## 369            0            3            2            3            4
    ## 370           58           78          107           11          116
    ## 371           79          217           98           23          330
    ## 372           56           68           46           55          166
    ## 373           21          173          107           94          213
    ## 374           78          521          242           94          303
    ## 375           53           89           44            9           75
    ## 376            3           13            5            8           14
    ## 377            0           77           34           47          103
    ## 378           29           23           17           26           69
    ## 379            1           87           36           97          211
    ## 380          137          201           85           25          153
    ## 381          174          159          146           18          241
    ## 382           60           82           64           16           83
    ## 383           90           65           61           51          188
    ## 384           62          123           83            9          116
    ## 385           65          115           70           19          111
    ## 386           59           83           35           16           87
    ## 387           73          267          147           23          130
    ## 388           82          101           58           32          151
    ## 389            0           56           12           24           62
    ## 390            0          216           38          118          285
    ## 391           19           23           11            7           28
    ## 392            8           20           15            3           20
    ## 393           42          159          118           35          155
    ## 394            3          114           52           51          111
    ## 395           34          203          173           44          135
    ## 396           21           38           24            7           44
    ## 397            0          255          101           85          255
    ## 398            3           20           14            9           24
    ## 399          103          606          412          103          226
    ## 400           44           26           13           16           83
    ## 401            0           45           15           51          107
    ## 402           16          316          136          188          459
    ## 403            0            5            2            8            6
    ## 404          101          701          356          296          711
    ## 405           21           97           36           24          142
    ## 406           56           95           45           57          187
    ## 407            2           17            5            6           14
    ## 408           60          201          254           68          237
    ## 409           49          239          147           84          136
    ## 410           26           49           33           10           57
    ## 411          120          206          117           18          141
    ## 412           55          221          133           60          257
    ## 413            5           48           18           11           41
    ## 414          135          216          147           31          191
    ## 415            1           46           25           16           46
    ## 416            0          126           32           41          118
    ## 417          117          360          134           49          197
    ## 418           17          360          204          151          485
    ## 419           10          180           59          120          249
    ## 420           51          113           46           63          232
    ## 421            9           10           10            5           15
    ## 422          170          102           77           25          112
    ## 423            1          149           82          143          199
    ## 424            0          105           31           84          139
    ## 425            0          169           63          104          160
    ## 426           21           44           19            6           21
    ## 427            0          138           70           94          198
    ## 428            3          227          150          156          354
    ## 429           45          164          132           25           93
    ## 430            3           65           29           39           40
    ## 431          147          459          367           46          203
    ## 432           28           29            4           23           80
    ## 433            0            1            1            3            3
    ## 434          104          345          388           52          268
    ## 435           77           80           43           31          194
    ## 436           35          137           40           15           89
    ## 437           72          212          113           96          252
    ## 438            3            1            3            3            8
    ## 439           26          377          119          125          214
    ## 440           21          163           55           20           75
    ## 441            0          153           91          154          385
    ##     assists steals blocks turnovers fouls
    ## 1       337     52     87       116   138
    ## 2       140     52     62        77   211
    ## 3       121     68     11        88   141
    ## 4         3      0      0         0     0
    ## 5        33      9      7        25    48
    ## 6       449     70     13       210   167
    ## 7       155     72     23        79   161
    ## 8         4     10      2         4    15
    ## 9        64     35     18        68   142
    ## 10       71     26     17        39   122
    ## 11        7      3      6         9    12
    ## 12      148     43     29        96   207
    ## 13      364    125     34       159   192
    ## 14      131     45     11        47    69
    ## 15       42      7     21        20    61
    ## 16       45     33     37        53   138
    ## 17        1      0      0         1     1
    ## 18       86      6      6        40    42
    ## 19       14      5      2        14    27
    ## 20        1      0      6         2     3
    ## 21      109     62     27        78   150
    ## 22       62     40     11        26    77
    ## 23       14      7     10        10    37
    ## 24       58     18      7        31    38
    ## 25      116     53     22       122   125
    ## 26       35     11      8        29    60
    ## 27      418     83     25       180   157
    ## 28      646     92     44       303   134
    ## 29       78     26     10        52   153
    ## 30       77     39     84        64   176
    ## 31        4      2      1         2     4
    ## 32      265     66     13       109   140
    ## 33       57     27     11        25    31
    ## 34      290     78     13       180   134
    ## 35       74     81     27        54   143
    ## 36       35     17      2        15    36
    ## 37       12     18     20        29   113
    ## 38       57     37     63       106   216
    ## 39      417     88     19       173   170
    ## 40       42     52     90        46   137
    ## 41       82     51     14        70   127
    ## 42       26     31      5        14    53
    ## 43       17     26     45        33   109
    ## 44       76     40     23        38   120
    ## 45       15      7     33        39    76
    ## 46       21     10      4        38    47
    ## 47      267     83     21       157   169
    ## 48      108     15      0        22    32
    ## 49        0      1      0         1     0
    ## 50        3      2      0         3    17
    ## 51       19     33     24        34    90
    ## 52       37     21     55        58   168
    ## 53      831    157     49       323   151
    ## 54      121     40     65       118   213
    ## 55      126     82     42       129   254
    ## 56      121    116     41        43   193
    ## 57       15      8      2         5    17
    ## 58       92     26      6        38    60
    ## 59      100     11      5        48    54
    ## 60       28      8      5        16    21
    ## 61      499     74     16       258   149
    ## 62      104     64     92       170   203
    ## 63       43     22      8        34    73
    ## 64       37      4      0        15    14
    ## 65      177     91     52       125   165
    ## 66       29     15     21        28    69
    ## 67      193     39      1        95   112
    ## 68       30      9      5        14    35
    ## 69       95     30     41        55    97
    ## 70      252     90     62       158   186
    ## 71        8      4      5         4     5
    ## 72      107     96     31        58    97
    ## 73      182     55     15       106   103
    ## 74      434    131    151       234   246
    ## 75      187     92     38       140   168
    ## 76      142     51     22        92   111
    ## 77       98     45     20        36    95
    ## 78       57     29     78        53   151
    ## 79       99     41      7        65    79
    ## 80      317     84     12       113   140
    ## 81      357     53      0       133   153
    ## 82       53     28     27        66    92
    ## 83       48     12     13        37   109
    ## 84       23     19     10        14    32
    ## 85       19      2      4         9    16
    ## 86       23     10     26        17    84
    ## 87       96     54     14        55   125
    ## 88      125     25      9        66    93
    ## 89       57     19     16        33   125
    ## 90       48     46     25        40   151
    ## 91        5      3      0         5     6
    ## 92      639    100     32       216   165
    ## 93       15      4      0         5     5
    ## 94       23      7     20        29    66
    ## 95       25      3      2        11    12
    ## 96       57     18     24        29    78
    ## 97      236     79     27       135   149
    ## 98      106     74    173       105   262
    ## 99      251    117     27       218   206
    ## 100       4      3      6         8    37
    ## 101     122    114     30        96   135
    ## 102       6      2      0         0     4
    ## 103      35     16     11        37    94
    ## 104      15      4      0        13    14
    ## 105      40     25     16        33   110
    ## 106      63     30      7        49    86
    ## 107     229     86     41       138   112
    ## 108      37     22      1        20    35
    ## 109     120     47      8        44    93
    ## 110     417    143     32       159   112
    ## 111      19      7      0        16    12
    ## 112     113     38     23        66   102
    ## 113      75     53     56        79   128
    ## 114      36     15     16        40    78
    ## 115     461     99     11       168   144
    ## 116      80     18    117        90   151
    ## 117     200     41     20       103    95
    ## 118     423     89     13       212   199
    ## 119      57     56    161       154   226
    ## 120     276     76     86       171   197
    ## 121      50     10      4        23    31
    ## 122     140     60     39        65   132
    ## 123      66     27      6        33    52
    ## 124      36     21     11        25   118
    ## 125      21     10     10        18    52
    ## 126     124     45     18        56   140
    ## 127     233     84     44        90   176
    ## 128       6      5      1         8    22
    ## 129      70     35      4        30    70
    ## 130      26     18     47        31   137
    ## 131      89    124     89       152   237
    ## 132      32     17     39        50   166
    ## 133     131     13      0        37    29
    ## 134       9      6     12        10    25
    ## 135      33     11      2        28    39
    ## 136       7      1      1        14     6
    ## 137     418     61     33       112   127
    ## 138     111     31     26        66   145
    ## 139     193     89     12        86   118
    ## 140     160     52     25        87   168
    ## 141       2      0      0         0     2
    ## 142      29     18      3        10    22
    ## 143     270     35      5       114   129
    ## 144     105     56     24        71   121
    ## 145     142     60     39        95   133
    ## 146      52      9      1        26    18
    ## 147      16      9      0         5    12
    ## 148       2      3      6         7    11
    ## 149      99     62     58        65   189
    ## 150     162     47     34        76   139
    ## 151      75     27     23        40    98
    ## 152       4      0      0         3     6
    ## 153     435     85     22       168   119
    ## 154     147     44      9        70    90
    ## 155     106     58     53        60   134
    ## 156     114     81     77        56   187
    ## 157       3      7      4         8    25
    ## 158     455     86     29       194   109
    ## 159     129     26      3        46    43
    ## 160       6      6      1         3    18
    ## 161     213     60     34       153   198
    ## 162      28      6      1        16    28
    ## 163     179     81     23        69   141
    ## 164     283     44     17       147    84
    ## 165     103     30     37        58   127
    ## 166     102     65     31        66   109
    ## 167      97     47    130       118   244
    ## 168     117     36    104        76   174
    ## 169      35     21      5        25    85
    ## 170      10      4      4        12    23
    ## 171       8     15      8        12    30
    ## 172      69     29     11        51    79
    ## 173     107     34      8        56    74
    ## 174      52     13      2        16    38
    ## 175      96     41     36       100   150
    ## 176     150     64     40        89   172
    ## 177      74     25     91        95   202
    ## 178     114     43      2        47    84
    ## 179     209     31      1        90   101
    ## 180      20     12      1         9    31
    ## 181     529     88     40       178   177
    ## 182     202     66      4       141   180
    ## 183      81     37     13        75   103
    ## 184      45     34      4        36    41
    ## 185       3      1      0         2     5
    ## 186      62     30     14        58    74
    ## 187     208     77     74       117   180
    ## 188       0      0      0         3     4
    ## 189       4      2      5         3    17
    ## 190      43     34     13        35    61
    ## 191       5      3      2         3    14
    ## 192     182     57     30       183   162
    ## 193     112     41     15        62   129
    ## 194      58     20     49        91   122
    ## 195      13      0      0         9     4
    ## 196      66     27     76       117   112
    ## 197      34     13      7        26    45
    ## 198     188     46     32       128   144
    ## 199      58     42     55        55   136
    ## 200     102    127     69       131   203
    ## 201     344     48      4       128    95
    ## 202      13      9      9        13    49
    ## 203     534    133     10       159   139
    ## 204       4      1      1         6     8
    ## 205      75     32     10        73   154
    ## 206       3      5      0         6    18
    ## 207      23      4      4        14     7
    ## 208     176     38    124       184   192
    ## 209     110     49      8        59    91
    ## 210     192     42     36       142   175
    ## 211     184     41     14        86    79
    ## 212      54     30      8        55   121
    ## 213      55     29     43        43    91
    ## 214       9     12     10        19    25
    ## 215      18     14     15        19    58
    ## 216     135     35      9        80    99
    ## 217     154     82     44       116   177
    ## 218     157     46      6       136   118
    ## 219     185     44     23        66   119
    ## 220     138     76     28       127   152
    ## 221     262     76     39        58    97
    ## 222       0      1      4         6    15
    ## 223     151     42     48        78   105
    ## 224     533    154    106       184   217
    ## 225      90     39      8        55    77
    ## 226      17     18     29        19    47
    ## 227      17     19     67        40   109
    ## 228     300     66     99       138   117
    ## 229      29     14     17        17    64
    ## 230     160     66     40       128   139
    ## 231      45     12      9        24    47
    ## 232      77     32     15        36    62
    ## 233     139     38     20        61   120
    ## 234     523    143     17       239   183
    ## 235     132     59     33        88   166
    ## 236      23      1      0        11    20
    ## 237     124     71     58        76   120
    ## 238     124     31     40        82   125
    ## 239      46     20     28        32    75
    ## 240      48      8      6        38    29
    ## 241      44     37     61        61   180
    ## 242       3      2      6         4    11
    ## 243     126     47     25        76   146
    ## 244     260    132     55       154   122
    ## 245      91     51     26        39    63
    ## 246     139     46     89        98   158
    ## 247     183     82     16        96   119
    ## 248     280     65      3       101   109
    ## 249     150     24     70        81   110
    ## 250     285     33      2        89    92
    ## 251      14      1      0         5     5
    ## 252       3      3      1         4     6
    ## 253      64     34     80        87   179
    ## 254     188     48     40       121   150
    ## 255       3      1      1         0     6
    ## 256     906    120     37       464   215
    ## 257       2      3      1         5     4
    ## 258      56     15      9        40    25
    ## 259      64     20     42        44   126
    ## 260     281     99     25       100   222
    ## 261      68     32     14        55   142
    ## 262      76     38     21        41    83
    ## 263     175    147     20        74   133
    ## 264       6      3      1         6    18
    ## 265      11      3      0         7    35
    ## 266     204     48     10       115   187
    ## 267     300     58     23       142   157
    ## 268      21     14     11        29    45
    ## 269       1      2      1         1     0
    ## 270     563    118      8       147   146
    ## 271      96     52    135       116   212
    ## 272       0      0      1         2     5
    ## 273     110     55     13        98   125
    ## 274     213     59     14       134   115
    ## 275      39     81     35        47   122
    ## 276      66     23     41        69   229
    ## 277      10      4      5        16    40
    ## 278     191     67     22        83   125
    ## 279      23     29     30        18    83
    ## 280      30     18      5        35    50
    ## 281     170     18      9        87    83
    ## 282     112     21     12        80   146
    ## 283      56     45     40        60   103
    ## 284     203     50     11        85   114
    ## 285     252     73     20       140   117
    ## 286       7     16     32        14    52
    ## 287     224     96      8       107   163
    ## 288     144     35     18        69    93
    ## 289       2      1      2         2     1
    ## 290      34     21      5        15    48
    ## 291      96     39     11        65   132
    ## 292      97     49    214       148   246
    ## 293     154     42      3        90   100
    ## 294      70     26     20        64    97
    ## 295      40     37      8        33   114
    ## 296      79     94     79        51   204
    ## 297      82     39     32        83   200
    ## 298      13      2      1         6    22
    ## 299      67     32     38       123   154
    ## 300      46     33     75        41   144
    ## 301       3      0      3         0     0
    ## 302       9      7      5        11    29
    ## 303      12      2      2         4    17
    ## 304      14      8      0         7    18
    ## 305     840    133     31       438   190
    ## 306     130     28      6        43    79
    ## 307      86     88     78       146   195
    ## 308      13     14     15        28    40
    ## 309     176     78     21       119   155
    ## 310     198     54     20        85   194
    ## 311      15     11     20        10    42
    ## 312      55     20      5        24    52
    ## 313       2      3     17         8    40
    ## 314      64     46     19        59   165
    ## 315      84     46     34        94   248
    ## 316       8     17      9        28    91
    ## 317     338     67     99       166   171
    ## 318     433     92     19       156   126
    ## 319      98    115     29       100   178
    ## 320      46     21      4        45    90
    ## 321     133     60     36        50   163
    ## 322      61     18      7        40    40
    ## 323      12      4      1         9    12
    ## 324     122     38     10        99   136
    ## 325      99     60     44        94   102
    ## 326      93     54     20        62   171
    ## 327     285     72     42       172   202
    ## 328     439     68     20       197   152
    ## 329      27     15     22        37   137
    ## 330     205     53     24       100   121
    ## 331      11      9      3        11    22
    ## 332      63     25     38        62    73
    ## 333      89     85     70        85   214
    ## 334      71     13     28        35   172
    ## 335      31     30     27        64   154
    ## 336      28      6      2        17    23
    ## 337      67     32      2        41    38
    ## 338      11      2      3        11     6
    ## 339     136     41     15        81    93
    ## 340      42     19     21        36    76
    ## 341     217     41     13       123    95
    ## 342     164     71      8        76    92
    ## 343     170     53     24       113   124
    ## 344     385     53      8       129   197
    ## 345      29     29     12        31    62
    ## 346      55     43     40        58   124
    ## 347      11      7      0         8    10
    ## 348      70     19     29        46    77
    ## 349      22      2      0        13     9
    ## 350     358     60     55       171   214
    ## 351       1      0      2         1     3
    ## 352     206     48     28        97   110
    ## 353     143     52     30       114   172
    ## 354      12     20     22        31    77
    ## 355     157     94    167       181   168
    ## 356       0      1      1         0     5
    ## 357       4      4      7         7    17
    ## 358      36     39     28        28   100
    ## 359      66     25     19        62    75
    ## 360      34     18     11        31    55
    ## 361     164     50     32        62   131
    ## 362      57     11      2        25    30
    ## 363     488    100     43       194   133
    ## 364      15      5     10        14    51
    ## 365      14      3      0         5     7
    ## 366     141     71     32        82   182
    ## 367     335     56      6       101   133
    ## 368       4      1     13        10    21
    ## 369       0      2      0         0     3
    ## 370     136     43      7        57   101
    ## 371      82     30     38        51   113
    ## 372      67     52     25        45   125
    ## 373      49     61     39        34   135
    ## 374     117     66     15       102   128
    ## 375     193     14      1        63    30
    ## 376       9      2      4         3     8
    ## 377      20     22     25        22    55
    ## 378      47     17      8        26    43
    ## 379      14     32     61        40   152
    ## 380     188     79      7        92   126
    ## 381     210     77     16       102   161
    ## 382     155     40      7        56    79
    ## 383      77     33     20        56   109
    ## 384      78     21      7        42   104
    ## 385      51     29      6        62   108
    ## 386      44     20      2        53    34
    ## 387     312     67      9       114   119
    ## 388     169     84     28        78   141
    ## 389      20      3     17        24    44
    ## 390      47     36     48        61   172
    ## 391      28      6      1        18    20
    ## 392      11      5      1         8    23
    ## 393      82     44     26        74    79
    ## 394      27     16     13        37    64
    ## 395     335     74      6       129   119
    ## 396      33     12      5        22    19
    ## 397      80     53     45        69   147
    ## 398       7      8      7         8    32
    ## 399     189     82     30       187   183
    ## 400      45     22     23        28    42
    ## 401      25     25     23        17    85
    ## 402     158     88     95       107   254
    ## 403       0      1      0         4     9
    ## 404     220     57    103       212   241
    ## 405     188     78     36        89   178
    ## 406      79     40     20        59   154
    ## 407      11     13      2        10    24
    ## 408     682    128     10       195   202
    ## 409      35     22      6        56    86
    ## 410     156     47      5        38    50
    ## 411     139     41     10        85   104
    ## 412     166     50     36       116   158
    ## 413      36     24      8        19    29
    ## 414     303     87     16       176   130
    ## 415      14     13      7        11    36
    ## 416      30     14     33        30    66
    ## 417     213     88      8       164   150
    ## 418     264     49     37       173   248
    ## 419      96     82     40        56   149
    ## 420      74     48     20        43    61
    ## 421      11      9      2         7    18
    ## 422      58     37     14        36   137
    ## 423      39     30     44        58   173
    ## 424      31     26      9        46    76
    ## 425      43     16     31        72   133
    ## 426      52     20      2        21    29
    ## 427      23     27     32        37   125
    ## 428      44     37     98       102   242
    ## 429     130     27      5        89    87
    ## 430      12     14     13        13    63
    ## 431     268     72     21       241   242
    ## 432      23     10     22        32    74
    ## 433       1      0      0         2     2
    ## 434     418     92     31       223   164
    ## 435     121     42     16        72   154
    ## 436      81     31      8        48    82
    ## 437      60     67     70       108   263
    ## 438      18     11      1         3    14
    ## 439      75     76     39        57   175
    ## 440     226     48      5        77    73
    ## 441      30     33     24        67   126

``` r
pca <- prcomp(stats1, scale.=TRUE)
pca
```

    ## Standard deviations (1, .., p=10):
    ##  [1] 2.5405346 1.3348006 0.7278431 0.6304666 0.5135939 0.4272298 0.3980053
    ##  [8] 0.3188495 0.2855228 0.2210135
    ## 
    ## Rotation (n x k) = (10 x 10):
    ##                     PC1         PC2         PC3         PC4          PC5
    ## points3_made -0.2245491 -0.45052583  0.64724253 -0.43238990 -0.049087098
    ## points2_made -0.3603749  0.04690093 -0.28523197 -0.26900421 -0.149027346
    ## points1_made -0.3385325 -0.17405032 -0.33357185 -0.48446895  0.060382713
    ## off_rebounds -0.2642029  0.50101904 -0.05393887  0.02559649 -0.479177666
    ## def_rebounds -0.3484923  0.25475499  0.07795656 -0.06234873 -0.196863100
    ## assists      -0.2973829 -0.38212601 -0.31946188  0.39193953  0.181612018
    ## steals       -0.3344686 -0.17459203  0.19008258  0.52480152 -0.007624632
    ## blocks       -0.2589314  0.45992122  0.13018295 -0.09517018  0.812303399
    ## turnovers    -0.3612829 -0.20192482 -0.23493316  0.06238047  0.030463729
    ## fouls        -0.3405535  0.14074534  0.41125972  0.24380542 -0.097790637
    ##                      PC6         PC7          PC8         PC9        PC10
    ## points3_made  0.01817947 -0.22600983  0.205430765 -0.20841957 -0.03548637
    ## points2_made  0.11226179  0.42238441  0.667591419  0.21875762 -0.08634845
    ## points1_made  0.12165343  0.21001094 -0.633500567 -0.11516139 -0.17884783
    ## off_rebounds  0.02196995 -0.21560237  0.032201363 -0.62737516 -0.06631247
    ## def_rebounds  0.13120994 -0.52209889 -0.157124199  0.67046837 -0.03023560
    ## assists      -0.22528385 -0.35172561  0.154265887 -0.09948918 -0.51838975
    ## steals        0.68252141  0.22331970 -0.096816708 -0.05945014  0.13201229
    ## blocks        0.05779614 -0.06438838  0.102721459 -0.13146158  0.01628207
    ## turnovers    -0.32948020 -0.12378333  0.008562215 -0.06280560  0.80049403
    ## fouls        -0.57103644  0.46290818 -0.203163822  0.13288231 -0.16363253

``` r
eigs <- data.frame(
  eigenvalue = pca$sdev^2,
  proportion = round(100 * pca$sdev^2 / sum(pca$sdev^2), 3)
)
eigs
```

    ##    eigenvalue proportion
    ## 1  6.45431626     64.543
    ## 2  1.78169252     17.817
    ## 3  0.52975562      5.298
    ## 4  0.39748809      3.975
    ## 5  0.26377871      2.638
    ## 6  0.18252534      1.825
    ## 7  0.15840823      1.584
    ## 8  0.10166498      1.017
    ## 9  0.08152327      0.815
    ## 10 0.04884698      0.488

1.  It was my first using this kind of file structure and I found it difficult because I wasn't used to it.
2.  It was my first time with relative paths too and they are important because it makes it easier to organize and find files.
3.  It wasn't my first time because we went over it in lab. I didn't think it was too difficult and I thought it was easier than R Markdown.
4.  I thought PCA was extremely difficult and I still don't really understand it.
5.  I thought making the scatterplots was PCA was really hard and I still don't know how to do it.
6.  What was easy was joining tables and making basic graphs with R script.
7.  No one helped me.
8.  It took me 15 hours to finish this.
9.  Each part was equally time consuming.
10. What was interesting was watching how each graph was formed.
