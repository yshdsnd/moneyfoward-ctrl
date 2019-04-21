require 'selenium-webdriver'

module MF_form
    Tab_spending = '//*[@id="important"]/label'
    Tab_income = '//*[@id="info"]/label'
    Tab_transfer = '//*[@id="success"]/label'

    form_date = '//*[@id="updated-at"]'
    cbox_recurring = '//*[@id="user_asset_act_recurring_flag"]'
    form_amount = '//*[@id="appendedPrependedInput"]'
    list_wallet = '//*[@id="user_asset_act_sub_account_id_hash"]'

    list_l_category = '//*[@id="js-large-category-selected"]'
    list_s_category = '//*[@id="js-middle-category-selected"]'
    form_category_text = '//*[@id="js-content-field"]'
end


email = "your@e-mail"
passwd = "your passwd"

browser = :chrome
url = "https://www.moneyforward.com/users/sign_in"
#url = "https://www.moneyforward.com/auth/google"
email_form_id = "sign_in_session_service_email"
passwd_form_id = "sign_in_session_service_password"

driver = Selenium::WebDriver.for browser
driver.get(url)

wait = Selenium::WebDriver::Wait.new(:timeout => 5)

email_form = driver.find_element(:id, email_form_id)
passwd_form = driver.find_element(:id, passwd_form_id)
login_button = driver.find_element(:id, "login-btn-sumit")

email_form.clear
email_form.send_keys(email)
passwd_form.clear
passwd_form.send_keys(passwd)
login_button.click

sleep 3
driver.get("https://moneyforward.com/cf")
sleep 3

btn_xpath = '//*[@id="kakeibo"]/section/div[1]/div[1]/div/button'
elem = driver.find_element(:xpath, btn_xpath)
elem.click
sleep 3
#driver.save_screenshot("mf.png")



driver.quit

