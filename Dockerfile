FROM  debian:latest

RUN apt-get update --fix-missing && apt-get upgrade -y

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y python-pip
RUN apt-get install -y texlive texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
RUN apt-get install -y git wget make build-essential graphviz
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y ruby-dev

RUN   pip install Sphinx==1.3.1
RUN   pip install sphinx_rtd_theme
RUN   pip install alabaster
RUN   pip install sphinx_bootstrap_theme
RUN   pip install sphinx-autobuild
RUN   pip install sphinx-git
RUN   pip install sphinxcontrib-programoutput
RUN   pip install sphinxcontrib-plantuml

RUN   gem install rack
RUN   gem install guard
RUN   gem install guard-rack
RUN   gem install guard-shell
RUN   gem install guard-livereload
RUN   gem install rack-livereload


RUN wget http://garr.dl.sourceforge.net/project/plantuml/plantuml.jar -O /opt/plantuml.jar
ENV PLANTUML_JAR /opt/plantuml.jar

CMD bash
