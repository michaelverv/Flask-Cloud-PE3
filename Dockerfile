# python image van docker hub
FROM python:3.12-bullseye

# update en installeren van git
RUN apt-get update && apt-get install -y git

# clonen van eigen repository
RUN git clone https://github.com/michaelverv/Flask-Cloud-PE3.git

# veranderen van de directory naar de repository
WORKDIR /Flask-Cloud-PE3

# upgraden van pip
RUN pip install --upgrade pip

# installeren van de requirements (inclusief uvicorn)
RUN pip install -r requirements.txt

# zetten van de environment variabele
#ENV FLASK_APP=crudapp.py

# database initialiseren
RUN flask db init

# migration maken
RUN flask db migrate -m "entries table"

# migration upgraden
RUN flask db upgrade

# poort 8000 openzetten
EXPOSE 8000

# runnen van de applicatie
CMD ["gunicorn -w 4 -b 0.0.0.0:8000 crudapp:app"]