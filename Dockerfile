# Must use a Cuda version 11+
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

WORKDIR /

# Install git
RUN apt-get update && apt-get install -y git

# Install python packages
RUN pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


ADD . . 

RUN cd riffusion && python3 download.py

EXPOSE 8000

CMD python -m riffusion.server --port 8000 --host 0.0.0.0