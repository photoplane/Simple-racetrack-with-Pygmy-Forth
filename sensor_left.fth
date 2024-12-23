CODE LEFTSENSOR
    import RPi.GPIO as GPIO     
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    capteur2 = 18 # capteur optique 
    GPIO.setup(capteur2, GPIO.IN)
    init2 = GPIO.input(capteur2)
    etat2 = GPIO.input(capteur2)
    dpush(etat2)
END-CODE
