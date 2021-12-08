*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary


*** Variables ***
${URL}  https://www.hepsiburada.com/
${User}  guneycan.test@gmail.com
${Pass}  Test1234
${Browser}  firefox
${Catagory}  Kitap
${Delay}  5


*** Keywords ***
Start
    open browser  ${URL}  ${Browser}
    maximize browser window

Click Login
    click element  id:myAccount
    click element  id:login
    Wait Until Element Contains  id:btnLogin  Giriş yap  15

LoginNew
    Input Text  name:username  ${User}
    Click Button  id:btnLogin
    Sleep  ${Delay}
    Input Text  name:password  ${Pass}
    Click Button  id:btnEmailSelect

Catagory
    Sleep  ${Delay}
    Click Element  xpath://div/ul/li[last()]/span
    Sleep  ${Delay}
    Click Element  xpath://*[contains(text(), 'Çok Satanlar')]

Sepete Ekle
    Sleep  ${Delay}
    Click Element  xpath://div/figure
    Click Button  id:addToCart
    sleep  ${Delay}

Sepete Git
    Click Element  xpath://*[text()='Sepete git']
    sleep  ${Delay}
    Click Button  id:continue_step_btn
    sleep  ${Delay}
    Click Button  id:continue_step_btn
    sleep  ${Delay}

Aninda Havele
    Click Element  xpath://h3[text()='Anında Havale']
    Click Element  xpath://div[@class='sardesPaymentPage-MoneyTransfer-bank_description']/p[text()='İş Bankası']
    Click Button  id:continue_step_btn

Banka Kontrol
    Wait Until Element Contains  xpath://*[text()='İş Bankası']  İş Bankası  ${Delay}

*** Test Cases ***
Case 1 Login
    [Documentation]  Bowserı Açıyorum
    Start


Case 2 Login olma
    [Documentation]  Login Oluyorum
    Click Login
    LoginNew

Case 3 Katagoriye gitme
    [Documentation]  Kitap Katagorisinde Çok Satanlara Gidiyorum
    Catagory

Case 4 Sepete ürün Ekleme
    [Documentation]  Listedeki İlk Kitabı Sepete Ekliyorm
    Sepete Ekle

Case 5 Sepete Git
    [Documentation]  Sepete Gidiyorum
    Sepete Git

Case 6 Odeme Aracı Seçme
    [Documentation]  Ödeme Yönemi olarak "Anında Havale" Seçiyorum
    Aninda Havele

Case 7 Banka Kontrol
    [Documentation]  Bankaların aynı olduğunu kontrol ediyorum...
    Banka Kontrol