FROM redhat/ubi8

RUN yum install -y python3 python3-pip && pip3 install flask

COPY app.py /app/app.py

WORKDIR /app

EXPOSE 5000

CMD ["python3", "app.py"]
