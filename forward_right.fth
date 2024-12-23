CODE FORWARDRIGHT
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)

    GPIO.setup(8, GPIO.OUT)
    GPIO.setup(10, GPIO.OUT)
    GPIO.setup(12, GPIO.OUT)

    pwd=GPIO.PWM(12,100)
    pwd.start(0)

    GPIO.output(8, True)
    GPIO.output(10, False)
    pwd.ChangeDutyCycle(50)
    GPIO.output(12, True)
    sleep(.01)


    GPIO.output(12, False)
    pwd.stop()
    GPIO.cleanup()
END-CODE
