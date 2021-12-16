FROM python:3.7-slim
RUN pip install flask
WORKDIR /app
COPY app.py /app/app.py
COPY templates/version.html /app/templates/version.html
ENTRYPOINT ["python"]
CMD ["/app/app.py"]