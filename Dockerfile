FROM bentoml/model-server:0.11.0-py37
MAINTAINER ersilia

RUN conda create -n eos9ym3-py27 python=3.7 -y
RUN wget https://anaconda.org/conda-forge/openbabel/3.0.0/download/linux-64/openbabel-3.0.0-py27hdef5451_1.tar.bz2
RUN conda install -n eos9ym3-py27 openbabel-3.0.0-py27hdef5451_1.tar.bz2 -y
RUN conda install -n eos9ym3-py27 pip -y
RUN CONDA_PATH=$(dirname $(dirname $(which conda))) && PYTHON_ENV_PATH="${CONDA_PATH}/envs/eos9ym3-py27/bin/python" && $PYTHON_ENV_PATH -m pip install rdkit && $PYTHON_ENV_PATH -m pip install scikit-learn && $PYTHON_ENV_PATH -m pip install numpy && $PYTHON_ENV_PATH -m pip install pandas && $PYTHON_ENV_PATH -m pip install TensorFlow && $PYTHON_ENV_PATH -m pip install Keras

# RUN pip install rdkit
# RUN conda install -c conda-forge openbabel
# RUN pip install numpy
# RUN pip install pandas
# RUN pip install scikit-learn
# RUN pip install TensorFlow
# RUN pip install Keras

WORKDIR /repo
COPY . /repo
