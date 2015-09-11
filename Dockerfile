FROM python:2.7.8

RUN pip install gunicorn \
	&& pip install gevent

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install -r /usr/src/app/requirements.txt

COPY . /usr/src/app


EXPOSE 4000

CMD [ "gunicorn","-k","gevent","--max-requests","1000","--access-logfile","-","--error-logfile","-","-b","0.0.0.0:4000","simple_python:app"  ]