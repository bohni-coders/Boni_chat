FROM ruby:2.3

COPY docker/entrypoints/rails.sh docker/entrypoints/rails.sh 

RUN chmod +x docker/entrypoints/rails.sh

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]