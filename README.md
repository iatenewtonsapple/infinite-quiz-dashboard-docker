# Docker container for the IANA Infinite Quiz Dashboard

## Building 
```
docker build -t iatenewtonsapple/infinite-quiz-dashboard .
```

## Running in interactive/development mode
```
docker run -i -t -p 5000:80 --name infinite-quiz-dashboard-live iatenewtonsapple/infinite-quiz-dashboard
```

## Running in production
```
docker run -d -p 80:80 --name infinite-quiz-dashboard-live iatenewtonsapple/infinite-quiz-dashboard
```
