require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-notifications')

Before do
  Selenium::WebDriver::Chrome::Service.driver_path ='/Users/arulamirtharaj/Downloads/chromedriver'
  $driver = Selenium::WebDriver.for :chrome, options: options
  $driver.manage.window.maximize
  $driver.get "https://www.myntra.com/"
  $wait = Selenium::WebDriver::Wait.new(:timeout => 30)
end

After do
  $driver.quit
end