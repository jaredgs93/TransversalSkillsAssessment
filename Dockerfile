# Usa Miniconda como base
FROM continuumio/miniconda3:4.12.0

# Establece el directorio de trabajo
WORKDIR /app

# Instala las dependencias necesarias para OpenCV
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
# Copia el archivo environment.yml al contenedor
COPY environment.yml /app/environment.yml

# Crea el entorno Conda usando environment.yml
RUN conda env create -f /app/environment.yml && \
    conda clean --all --yes

# Configura el entorno por defecto
ENV PATH /opt/conda/envs/skillsevaluation/bin:$PATH
ENV CONDA_DEFAULT_ENV=skillsevaluation

# Activa el entorno por defecto al iniciar
SHELL ["conda", "run", "-n", "skillsevaluation", "/bin/bash", "-c"]

# Copia el código fuente al contenedor
COPY src /app/src
