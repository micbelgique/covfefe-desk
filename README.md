# Famidesk

## Team

SummerCamp 2017.

* [Simon Depelchin](http://webartisan.be)
* [Mathias Biard](http://codingowl.eu)
* [Michaël Hoste](http://80limit.com)
* [Aurélien Malisart](http://phonoid.com)

## Tech Stack

* Ruby 2.3.1
* Rails 5.1.2
* React 15.6.1
* Swift 3.0
* CocoaPod 1.2.0

## Screenshots

![Image](https://github.commicbelgique/covfefe-desk/raw/master/famidesk.gif)

## Usage

### Development

`cd backend`

Start the server:

 * `bin/webpack-dev-server` (for assets)
 * `bundle exec rails s`

Generate fake data :

 * `bundle exec rake app:reset`

### Production

Deploy :

 * `bundle exec cap production deploy`
