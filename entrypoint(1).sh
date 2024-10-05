version: "3.8"
services:
  jupyter_note:
    hostname: 0.0.0.0
    container_name: note
    image: 87maxi/notebook:debian
    build:
      context: .
      dockerfile: ./Dockerfile_jupyter_debian
    volumes:
      - ./note:/home/jupyter/note
    ports:
      - 8080:8888
    user: jupyter

networks:
  travellist:
    driver: bridge
