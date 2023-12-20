FROM bentoml/model-server:0.11.0-py37
MAINTAINER ersilia

RUN sudo apt update -y
RUN sudo apt install python3.7 -y
RUN sudo apt install gfortran-7 -y
RUN sudo apt install libfontconfig1 libxrender1 -y
RUN conda create -n eos9ym3-py27 python=3.7 -y
RUN conda install -n eos9ym3-py27 -c rdkit rdkit=2018.09.3 -y
RUN wget https://anaconda.org/conda-forge/openbabel/3.0.0/download/linux-64/openbabel-3.0.0-py27hdef5451_1.tar.bz2
RUN conda install -n eos9ym3-py27 openbabel-3.0.0-py27hdef5451_1.tar.bz2 -y
RUN conda install -n eos9ym3-py27 -c conda-forge mopac -y
RUN conda install -n eos9ym3-py27 pip -y
RUN CONDA_PATH=$(dirname $(dirname $(which conda))) && PYTHON_ENV_PATH="${CONDA_PATH}/envs/eos9ym3-py27/bin/python" && $PYTHON_ENV_PATH -m pip install scikit-learn==0.17.1 && $PYTHON_ENV_PATH -m pip install numpy && $PYTHON_ENV_PATH -m pip install pandas && $PYTHON_ENV_PATH -m pip install tensorFlow==1.13.1 && $PYTHON_ENV_PATH -m pip install keras==2.2.4 && $PYTHON_ENV_PATH -m pip install pip install matplotlib==1.3.1

# RUN pip install rdkit
# RUN conda install -c conda-forge openbabel
# RUN pip install numpy
# RUN pip install pandas
# RUN pip install scikit-learn
# RUN pip install TensorFlow
# RUN pip install Keras

WORKDIR /repo
COPY . /repo
