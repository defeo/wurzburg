FROM sagemath/sagemath:8.8

ENV NB_USER=sage
ENV HOME /home/sage

# Make sure the contents of our repo are in ${HOME}
COPY sagemath ${HOME}
USER root
RUN chown -R ${NB_USER}:${NB_USER} ${HOME}
USER ${NB_USER}

EXPOSE 8888
CMD ["jupyter", "notebook", "--notebook-dir=notebooks", "--ip", "'*'", "--port", "8888"]
