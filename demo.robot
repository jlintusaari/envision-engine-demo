*** Settings ***
Library                 QVision
Suite Setup             DemoSetup
Suite Teardown          HotKey  ctrl  f4


*** Keywords ***
DemoSetup
    QVision.SetConfig      default_timeout     5sec
    SetOcrEngine           EnvisionEngine


*** Test Cases ***
Do shopping
    # Open the webshop in chrome
    OpenApplication     chrome
    VerifyText          New Tab
    HotKey              ctrl  win  up
    WriteText           https://qentinelqi.github.io/shop/\n
    VerifyText          Find your spirit animal

    # Navigate and add product to cart
    HotKey              PageDown
    VerifyText          Todd the Hedgehog
    ClickUntil          Add to cart          Todd the Hedgehog     index=1
    ClickText           Add to cart
    VerifyText          Checkout

    # Change size
    ClickUntil          Large   Medium
    ClickText           Large   Medium

    # Continue shopping, check different pages
    ClickText           Continue shopping
    VerifyText          Add to cart
    HotKey              PageDown
    ClickUntil          DeliveryDetails      Shipping
    VerifyText          Shipping Services
    ClickText           Our Story
    VerifyText          Passion
    VerifyText          Animal
    VerifyText          Style

    # Take contact but forget to fill in email
    ClickWhile          Style                Contact
    VerifyText          Get in touch                                           tol=0.3
    VerifyText          Send us message
    TypeText            Full Name            Ted Tester
    TypeText            Message              I really like this shirt.

    # Sending message without email should not work
    HotKey              PageDown
    VerifyText          All Rights Reserved
    ClickUntil          Please fill this field    Send Message    pause=0.25

    # Type in the forgotten email
    TypeText            Email Address        ted@qentinel.com
    ClickWhile          Email Address        Message  below=11

    # Verify they will be in touch
    VerifyText          We'll be in touch
