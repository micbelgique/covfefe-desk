# Famidesk

**Description courte :** FamiDesk a pour mission de préserver l’autonomie des personnes en rassemblant
autour d’eux professionnels de la santé, aidant proches, voisins, livreurs, famille, amis et bien
d’autres. Afin de ne pas s’emmêler les pinceaux dans ces multiples interactions, ils
ont développé un cahier de communication en ligne permettant à chacune des aides de pouvoir notifier
son passage et son action. C’est ce processus qu’ils souhaitent améliorer en rendant
automatique l’identification des aidants à leur arrivée dans la maison de la personne.
L’idée ? Un beacon identifie directement la personne à son arrivée et fait apparaitre
une notification de checkin sur son téléphone. Rien de plus simple !

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

### Mobile

![Image](https://github.com/micbelgique/covfefe-desk/blob/master/famidesk-mobile.gif)

### Web (+ backend)

![Image](https://github.com/micbelgique/covfefe-desk/blob/master/famidesk.gif)

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
