# **econ-145-docker-image**
### **Pip Packages:**
``` Dockerfile
    pip install nbgitpuller okpy && \
    pip install git+https://github.com/okpy/jassign.git && \
    pip install jupyter-server-proxy jupyter-rsession-proxy 
``` 
*** 
### **Conda Packages:**
``` Dockerfile
conda install -c conda-forge udunits2 libv8 r-rstan imagemagick r-sf
```
***
### **R Packages:**
``` Dockerfile 
R -e "install.packages(c('littler', 'docopt'))" 
```
``` Dockerfile
R -e "install.packages(c('rsf', 'units', 'udunits2', 'magick', 'tidylog', 'tidytuesdayR', 'janitor', 'readxl', 'lubridate', 'lucid', 'magrittr', 'learnr', 'haven', 'summarytools', 'ggplot2', 'kableExtra', 'flextable', 'sandwich', 'sf', 'stargazer', 'viridis', 'titanic', 'labelled', 'Lahman', 'babynames', 'nasaweather', 'fueleconomy', 'mapproj', 'forcats', 'rvest', 'readxl', 'quantmod', 'polite', 'pdftools', 'ncdf4', 'modelsummary', 'maps', 'lubridate', 'lmtest', 'knitr', 'anytime', 'broom', 'devtools', 'fixest', 'ggmap', 'ggplot2', 'ggthemes', 'httr', 'janitor', 'jsonlite', 'kableExtra'), repos = 'http://cran.us.r-project.org')"
```
``` Dockerfile
R --quiet -e "devtools::install_github('UrbanInstitute/urbnmapr', dep=FALSE)"
R --quiet -e "devtools::install_github('Rapporter/pander')"
```

