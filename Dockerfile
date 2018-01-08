FROM tedakshay/dockerfile 

ADD ./service/ /ml/service/
RUN cd /ml/service
WORKDIR "/ml/service"
COPY .s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i
RUN chmod 777 /ml/service
EXPOSE 5000
CMD ["python3", "flask_app.py"]
