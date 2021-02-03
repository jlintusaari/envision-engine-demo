# EnvisionEngine Demo

This Robot Framework script shows how to use Qentinel's QVision computer vision
library in test automation and RPA. It uses the new EnvisionEngine OCR engine
that provides fast and reliable OCR that runs on commodity hardware. 
EnvisionEngine achieves its performance using a combination of deep learning
and probabilistic modelling.

The whole test script relies purely on computer vision extracting UI elements
from an image of the computer screen and then issuing emulated keyboard and 
mouse commands to control the UI. Essentially it uses the UI as a human would. 

As QVision uses no API access to the application under test, QVision can be 
used to test/automate applications in web, mobile, desktop and embedded 
environments. It is possible to run tests through remote connections (such as 
RDP) allowing remote automation without need to install testing related 
software to the system under test.

You can register to `pace.qentinel.com` to try QVision and EnvisionEngine 
yourself.
