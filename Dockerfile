FROM bentoml/model-server:0.11.0-py37
MAINTAINER ersilia

RUN conda create -n eos9ym3 python=3.7 -y

RUN conda install -n eos9ym3 -c rdkit -y
RUN wget https://anaconda.org/conda-forge/openbabel/3.1.1/download/linux-aarch64/openbabel-3.1.1-py312h7d6d27c_9.conda
RUN conda install -n eos9ym3 openbabel-3.1.1-py312h7d6d27c_9.conda -y
RUN conda install -n eos9ym3 pip -y
RUN CONDA_PATH=$(dirname $(dirname $(which conda))) && PYTHON_ENV_PATH="${CONDA_PATH}/envs/eos9ym3/bin/python" && $PYTHON_ENV_PATH -m pip install rdkit && $PYTHON_ENV_PATH -m pip install scikit-learn && $PYTHON_ENV_PATH -m pip install numpy && $PYTHON_ENV_PATH -m pip install pandas && $PYTHON_ENV_PATH -m pip install tensorFlow && $PYTHON_ENV_PATH -m pip install keras

WORKDIR /repo
COPY . /repo
