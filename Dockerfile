FROM cirrusci/flutter
WORKDIR /home/app
COPY . .
CMD flutter test