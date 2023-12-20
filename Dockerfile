FROM bentoml/model-server:0.11.0-py37
MAINTAINER ersilia

RUN sudo apt update -y
RUN sudo apt install python3.7 -y
RUN sudo apt install gfortran-7 -y
RUN sudo apt install libfontconfig1 libxrender1 -y
RUN conda create -n eos9ym3 python=3.7 -y

# RUN conda install -n eos9ym3-py27 -c rdkit rdkit=2018.09.3 -y

# RUN conda activate eos9ym3
# RUN conda conda install -n eos9ym3 conda --force-reinstall
# RUN conda install conda -n eos9ym3 --force-reinstall
# RUN conda update -n eos9ym3 --all

RUN conda install -n eos9ym3 -c rdkit -y
RUN wget https://anaconda.org/conda-forge/openbabel/3.1.1/download/linux-aarch64/openbabel-3.1.1-py312h7d6d27c_9.conda
RUN conda install -n eos9ym3 openbabel-3.1.1-py312h7d6d27c_9.conda -y
RUN conda install -n eos9ym3 -c conda-forge mopac -y
RUN conda install -n eos9ym3 pip -y
RUN CONDA_PATH=$(dirname $(dirname $(which conda))) && PYTHON_ENV_PATH="${CONDA_PATH}/envs/eos9ym3/bin/python" && $PYTHON_ENV_PATH -m pip install rdkit && $PYTHON_ENV_PATH -m pip install scikit-learn && $PYTHON_ENV_PATH -m pip install numpy && $PYTHON_ENV_PATH -m pip install pandas && $PYTHON_ENV_PATH -m pip install tensorFlow && $PYTHON_ENV_PATH -m pip install keras && $PYTHON_ENV_PATH -m pip install pip install matplotlib
# RUN pip install rdkit
# RUN pip install rdkit
# RUN conda install -c conda-forge openbabel
# RUN pip install numpy
# RUN pip install pandas
# RUN pip install scikit-learn
# RUN pip install TensorFlow
# RUN pip install Keras


# Activate the Conda environment
# RUN echo "source activate eos9ym3" > ~/.bashrc
# ENV PATH /opt/conda/envs/eos9ym3/bin:$PATH

# Install packages using pip
# RUN /bin/bash -c "source activate eos9ym3 && pip install scikit-learn rdkit tensorflow keras pandas numpy"





WORKDIR /repo
COPY . /repo
