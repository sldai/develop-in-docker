FROM tensorflow/tensorflow:latest

RUN python3 -m pip install --no-cache-dir jupyter matplotlib
# Pin ipykernel and nbformat; see https://github.com/ipython/ipykernel/issues/422
RUN python3 -m pip install --no-cache-dir jupyter_http_over_ws ipykernel==5.1.1 nbformat==4.4.0
RUN jupyter serverextension enable --py jupyter_http_over_ws

RUN mkdir /workspace && chmod -R a+rwx /workspace
RUN mkdir /.local && chmod a+rwx /.local
RUN apt-get install -y --no-install-recommends wget
# some examples require git to fetch dependencies
RUN apt-get install -y --no-install-recommends git

RUN apt-get autoremove -y && apt-get remove -y wget


RUN python3 -m ipykernel.kernelspec

RUN apt-get -y update && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh start.sh
RUN chmod 0755 start.sh

WORKDIR /workspace
EXPOSE 22 8889

ENTRYPOINT [ "bash"]
CMD [ "/start.sh" ]

