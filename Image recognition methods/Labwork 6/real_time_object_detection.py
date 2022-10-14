#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# import the necessary packages
from imutils.video import VideoStream
from imutils.video import FPS
import numpy as np
import argparse
import imutils
import time
import cv2

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-p", "--prototxt", required=True,
                help="path to Caffe 'deploy' prototxt file")
ap.add_argument("-m", "--model", required=True,
                help="path to Caffe pre-trained model")
ap.add_argument("-c", "--confidence", type=float, default=0.2,
                help="minimum probability to filter weak detections")
args = vars(ap.parse_args())

CLASSES = ["background", "aeroplane", "bicycle", "bird", "boat",
           "bottle", "bus", "car", "cat", "chair", "cow", "diningtable",
           "dog", "horse", "motorbike", "person", "pottedplant", "sheep",
           "sofa", "train", "tvmonitor"]
COLORS = np.random.uniform(0, 255, size=(len(CLASSES), 3))

print("[INFO] loading model...")
net = cv2.dnn.readNetFromCaffe(args["prototxt"], args["model"])

while True:
    # Первое, что мы делаем - считываем кадр из потока
    # затем заменяем его размер
    frame = vs.read()
    frame = imutils.resize(frame, width=400)
    # Поскольку чуть позже нам понадобится ширина и высота, получим их сейчас
    # Затем следует преобразование кадра в blob с модулем dnn
    (h, w) = frame.shape[:2]
    blob = cv2.dnn.blobFromImage(cv2.resize(frame, (300, 300)),
                                 0.007843, (300, 300), 127.5)
    # устанавливаем blob как входные данные в нашу нейросеть
    # и передаём эти данные через net, которая обнаруживает наши предметы.
    net.setInput(blob)
    detections = net.forward()


for i in np.arange(0, detections.shape[2]):
    confidence = detections[0, 0, i, 2]
    # Если значение валидности выше заданного порога, извлекаем
    # индекс лейбла в классе и высчитываем координаты
    # рамки вокруг обнаруженного объекта
    if confidence > args["confidence"]:
        # Затем, извлекаем (x;y)-координаты рамки, которые
        # будем использовать для отображения прямоугольника и текста.
        # Делаем текстовый лейбл, содержащуюимя
        # из CLASS и значение валидности
        idx = int(detections[0, 0, i, 1])
        box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
        (startX, startY, endX, endY) = box.astype("int")
        # рисуем цветной прямоугольник вокруг объекта
        label = "{}: {:.2f}%".format(CLASSES[idx],
                                    confidence * 100)
        cv2.rectangle(frame, (startX, startY), (endX, endY),
                    COLORS[idx], 2)
        y = startY - 15 if startY - 15 > 15 else startY + 15
        cv2.putText(frame, label, (startX, y),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.5, COLORS[idx], 2)
