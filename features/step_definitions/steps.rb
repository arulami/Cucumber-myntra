Given('User is on Main page') do
  $wait.until { $driver.find_element(:xpath, "//a[@class='myntraweb-sprite desktop-logo sprites-headerLogo']")}
end

When('User enter search item {string}') do |item|
  $wait.until { $driver.find_element(:xpath, "//input[@placeholder='Search for products, brands and more']")}
  $driver.find_element(:xpath, "//input[@placeholder='Search for products, brands and more']").send_keys item
end


When('User enter search item') do
  $wait.until { $driver.find_element(:xpath, "//input[@placeholder='Search for products, brands and more']")}
  $driver.find_element(:xpath, "//input[@placeholder='Search for products, brands and more']").send_keys "iPhone 11 Case"
end

When('User click on Search') do
  $driver.find_element(:xpath, "//span[@class='myntraweb-sprite desktop-iconSearch sprites-search']").click
end

Then('User navigate to search result page') do
  $wait.until { $driver.find_element(:xpath, "//h4[normalize-space()='Model Name']")}
  $driver.find_element(:xpath, "//h4[normalize-space()='Model Name']").click
end

Then('User select the Model name {string}') do |string|
  $wait.until { $driver.find_element(:xpath, "//label[normalize-space()='#{string}']")}
  $driver.find_element(:xpath, "//label[normalize-space()='#{string}']").click
  $wait.until { $driver.find_element(:class, "img-responsive")}
  $driver.find_element(:class, "img-responsive").click
  sleep(10)
end


Then('User add to bag') do
  original_window = $driver.window_handle
  #Wait for the new window or tab
  $wait.until { $driver.window_handles.length == 2 }

  #Loop through until we find a new window handle
  $driver.window_handles.each do |handle|
    if handle != original_window
      $driver.switch_to.window handle
      break
    end
  end
  #Wait for the new tab to finish loading content
  $wait.until { $driver.title.include?('Buy')}
  $wait.until { $driver.find_element(:css, "div.pdp-add-to-bag.pdp-button.pdp-flex.pdp-center")}
  $driver.find_element(:css, "div.pdp-add-to-bag.pdp-button.pdp-flex.pdp-center").click
  end

And('User go to bag') do
  sleep(4)
  $driver.find_element(:xpath, "//span[normalize-space()='Bag']").click
  #check for place order text
  $driver.find_element(:xpath, "//div[contains(text(),'Place Order')]")
  sleep(10)
end