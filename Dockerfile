FROM dddlab/base-rstudio:v20200720-d6cbe5a-94fdd01b492f
 
LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

USER root

ENV PATH=$PATH:/usr/lib/rstudio-server/bin \
    R_HOME=/opt/conda/lib/R
ARG LITTLER=$R_HOME/library/littler

RUN \
    # download R studio
    curl --silent -L --fail https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.3.1056-amd64.deb > /tmp/rstudio.deb && \
    \
    # install R studio
    apt-get update && \
    apt-get install -y --no-install-recommends /tmp/rstudio.deb && \
    rm /tmp/rstudio.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
    apt-get install -y libudunits2-dev

RUN R -e "install.packages( 'units', configure.args = c('--with-udunits2-include=/usr/include', '--with-udunits2-lib=/usr/lib/x86_64-linux-gnu'))"

USER $NB_USER

RUN R -e "install.packages(c('units'), repos = 'http://cran.us.r-project.org')"

RUN R -e "install.packages(c('tidyverse', 'janitor', 'readxl', 'lubridate', 'lucid', 'magrittr', 'learnr', 'haven', 'summarytools', 'ggplot2', 'kableExtra', 'flextable', 'sf', 'viridis', 'titanic'), repos = 'http://cran.us.r-project.org')"

#RUN R --quiet -e "devtools::install_github('UrbanInstitute/urbnmapr')"
