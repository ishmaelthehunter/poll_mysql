FROM python:2.7 

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-client dos2unix && \
    rm -rf /var/lib/apt/lists/*

# Set the default workdir
WORKDIR /usr/src/app

# Adding deployment files
ADD . /usr/src/app/

RUN pip install -r /usr/src/app/requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
