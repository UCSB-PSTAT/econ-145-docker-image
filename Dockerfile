FROM dddlab/base-rstudio:v20200720-d6cbe5a-94fdd01b492f
 
LABEL maintainer="Patrick Windmiller <windmiller@pstat.ucsb.edu>"

#USER root

#ENV PATH=$PATH:/usr/lib/rstudio-server/bin \
#    R_HOME=/opt/conda/lib/R

#RUN \
    # download R studio
#    curl --silent -L --fail https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.3.1056-amd64.deb > /tmp/rstudio.deb && \
    \
    # install R studio
#    apt-get update && \
#    apt-get install -y --no-install-recommends /tmp/rstudio.deb && \
#    rm /tmp/rstudio.deb && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

#RUN apt-get update && \
#    apt-get install -y gdal-bin && \
#    apt-get install -y libgdal-dev

USER $NB_USER

RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal && \
    export C_INCLUDE_PATH=/usr/include/gdal

RUN conda install -y r-base && \
    conda install -c conda-forge imagemagick && \
    conda install -c conda-forge udunits2 && \
    conda install -c conda-forge gdal

RUN R -e "install.packages(c('units'), repos = 'http://cran.us.r-project.org')"

RUN R -e "install.packages(c('tidyverse', 'janitor', 'readxl', 'lubridate', 'lucid', 'magrittr', 'learnr', 'haven', 'summarytools', 'ggplot2', 'kableExtra', 'flextable', 'sf', 'viridis', 'titanic', 'labelled', 'Lahman', 'babynames', 'nasaweather', 'fueleconomy'), repos = 'http://cran.us.r-project.org')"

RUN R --quiet -e "devtools::install_github('UrbanInstitute/urbnmapr')"
RUN R --quiet -e "devtools::install_github('rapporter/pander')"

# remove cache
RUN rm -rf ~/.cache/pip ~/.cache/matplotlib ~/.cache/yarn && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
