FROM immcantation/suite:4.3.0

RUN pip3 install --upgrade pip
RUN dnf install -y nodejs
RUN pip3 install \
    pandas \
    numpy \
    matplotlib \
    seaborn \
    scikit-learn \
    jupyter \
    jupyterlab \
    rpy2 \
    && rm -rf /root/.cache/pip

RUN wget https://download.java.net/java/GA/jdk19.0.1/afdd2e245b014143b62ccb916125e3ce/10/GPL/openjdk-19.0.1_linux-x64_bin.tar.gz -P /tmp \
    && tar xvf /tmp/openjdk-19*_bin.tar.gz -C /opt/ \
    && ln -s /opt/jdk-19.0.1/bin/java /bin/java


RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip -P /tmp/ \
    && unzip /tmp/fastqc_v0.12.1.zip -d /opt/ \
    && ln -s /opt/FastQC/fastqc /bin/fastqc

COPY run.sh run.sh

EXPOSE 8080 8081

CMD ./run.sh
