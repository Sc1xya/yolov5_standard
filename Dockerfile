FROM python:3.10.12
WORKDIR /workspace
ADD requirements.txt .
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --upgrade pip \
    && pip install -r requirements.txt
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
ADD . .
RUN mkdir /root/.config/Ultralytics \
    && mv yolov5_replacement/Arial.ttf /root/.config/Ultralytics \
    && mv yolov5_replacement/train.py /usr/local/lib/python3.10/site-packages/yolov5
CMD ["./run_train.sh"]