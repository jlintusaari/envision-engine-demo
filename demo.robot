*** Settings ***
Library                 QVision
Suite Setup             DemoSetup


*** Keywords ***
DemoSetup
    QVision.SetConfig      default_timeout     5sec
    SetOcrEngine           EnvisionEngine


*** Test Cases ***
Do shopping
    # Open the webshop in chrome
    RunCommand          chrome -homepage "https://qentinelqi.github.io/shop/"
    HotKey              ctrl  win  up
    VerifyText          Find your spirit animal

    # Navigate and add product to cart
    HotKey              PageDown
    VerifyText          Sacha the Deer
    ClickUntil          Add to cart          Sacha the Deer     index=1
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


Take a Screenshot
    # Snipping tool
    HotKey              win  shift  s
    Wait                0.1

    # Draw the area using offsets from texts
    HoverText           Products      left=5  above=1
    DragTo              Contact Us    right=5  below=1
    VerifyText          Snip saved to clipboard
    HotKey              esc

    # Close browser (tab)
    HotKey              ctrl  w


Paste image to Paint and click around
    # Open paint and maximize window
    RunCommand          mspaint
    VerifyText          Untitled Paint
    HotKey              ctrl  win  up

    # Paste the image
    ClickText           Paste
    ClickText           Paste         Paste from

    # Click gridlines checkbox on
    ClickText           View
    ClickCheckbox       Rulers        checked
    ClickCheckbox       Rulers        unchecked
    ClickCheckbox       Gridlines     checked
    ClickText           Home


Drawing with offset
    [Documentation]     We draw things on the pasted image using text offsets like "below" or "right"
    # Choose brush
    ClickText           Brushes
    HotKey              down
    HotKey              enter

    # Underline text
    HoverText           Success       below=0.6  left=1
    DragTo              Success       below=0.6  right=1

    # Click the text icon, write and select text
    ClickText           Brushes       left=5  above=3
    ClickText           Success       above=9  left=3
    WriteText           Thanks for watching!
    TripleClick         Thanks for watching!

    # Click of gridlines checkbox with offset
    ClickText           View
    ClickText           Gridlines    left=2

    ClickText           File
    ClickText           Exit
    ClickText           Dont' Save
