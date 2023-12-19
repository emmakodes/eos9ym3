FROM bentoml/model-server:0.11.0-py37
MAINTAINER ersilia

RUN pip install rdkit
# RUN conda install -c conda-forge openbabel
RUN pip install numpy
RUN pip install pandas
RUN pip install scikit-learn
RUN pip install TensorFlow
RUN pip install Keras
RUN wget https://anaconda.org/conda-forge/openbabel/3.0.0/download/linux-64/openbabel-3.0.0-py27hdef5451_1.tar.bz2
RUN conda install openbabel-3.0.0-py27hdef5451_1.tar.bz2 -y

WORKDIR /repo
COPY . /repo
