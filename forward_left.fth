CODE FORWARDLEFT
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)

    GPIO.setup(11, GPIO.OUT)
    GPIO.setup(13, GPIO.OUT)
    GPIO.setup(7, GPIO.OUT)

    pgl=GPIO.PWM(7,100)
    pgl.start(0)

    GPIO.output(11, True)
    GPIO.output(13, False)
    pgl.ChangeDutyCycle(50)
    GPIO.output(7, True)
    sleep(.01)


    GPIO.output(7, False)
    pgl.stop()
    GPIO.cleanup()
END-CODE
