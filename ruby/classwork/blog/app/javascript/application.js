// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require bootstrap-sprockets

import { Turbo } from "@hotwired/turbo-rails";

import {loadStripe} from '@stripe/stripe-js';