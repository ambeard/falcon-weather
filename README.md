# README



### Set ArcGIS API credentials

Edit Rails credentials:

```sh
EDITOR="emacs -nw"  bin/rails credentials:edit
```

Add your real ArcGIS credentials:

```ruby
arcgis_api_user_id: ambeard
arcgis_api_secret_key: 123456
```

## Join OpenWeather API

Sign up at <https://openweathermap.org>

* The process creates your API key.


### Set OpenWeather API credentials

Edit Rails credentials:

```sh
EDITOR="emacs -nw"  bin/rails credentials:edit
```

Add your OpenWeather credentials by replacing these fake credentials with your real credentials:

```ruby
openweather_api_key: 987654321
```

### Enable the cache

Enable the Rails development cache, so a developer can see that the forecasts are cached as expected.


```sh
bin/rails dev:cache
```

## Run the specs

Use tthe following command to run all specs:

```sh
% bundle exec rspec spec
```

## Run the server locally

Use tthe following command to run the server:

```sh
% bin/dev
```

In your browser, navigate to <http://127.0.0.1:3000>
