#start from ubuntu 24.04
FROM ubuntu:24.04

#set working directory
WORKDIR /mydir

#install curl and python3
RUN apt-get update && apt-get install -y curl python3

#download yt-dlp to /usr/local/bin
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp

#give all users executable permisions
RUN chmod a+x /usr/local/bin/yt-dlp

#entry point
ENTRYPOINT ["/usr/local/bin/yt-dlp"]

# define a default argument
CMD ["https://www.youtube.com/watch?v=Aa55RKWZxxI"]