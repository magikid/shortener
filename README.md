# shortener
A private URL shortener website written in Rails.

# README

This project is for a URL shortener that I can use with my domain chriswjon.es.
This project will be running on
[NearlyFreeSpeechNet](https://nearlyfreespeech.net).  It was developed with Ruby
2.4.1 and Rails 5.1.3.


## Models
- User
  * provider
  * uid
  * name
  * email
- Site
  * user
  * short_code
  * url
  * hits

## Controllers

- User Controller (CRUD)
- Site Controller (CRUD)
- Basic Controller (only index)
- Session Controller (only create, destroy)
