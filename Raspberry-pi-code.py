import mysql.connector
from read_data import ph_status, ec_status, temp_status
from Adafruit_CharLCD import Adafruit_CharLCD
import serial, time
import seeed_dht

mydb = mysql.connector.connect(
    host = "192.168.1.22",
    user = "root",
    password = "",
    database = "denemedb"
)

mydb.autocommit = True
mycursor = mydb.cursor()

ser = serial.Serial(
     port='/dev/ttyACM0',
     baudrate = 9600,
     parity=serial.PARITY_NONE,
     stopbits=serial.STOPBITS_ONE,
     bytesize=serial.EIGHTBITS,
     timeout=1
    )

lcd = Adafruit_CharLCD(rs=26, en=19,
                       d4=13, d5=6, d6=5, d7=11,
                       cols=16, lines=2)
lcd.clear()

PhValue = ph_status()
EcValue = ec_status()
WtempValue = temp_status()

sensor = seeed_dht.DHT("11", 12)
humi, temp = sensor.read()

t = time.strftime("%H:%M", time.localtime(time.time()))

def Lcd():
    texts = ["PH :","EC :","TEMP :" ]
    values = [PhValue, EcValue, WtempValue]
    for i in range(len(texts)):
        lcd.set_cursor(1,0)
        lcd.message(texts[i])
        lcd.set_cursor(7,0)
        lcd.message(values[i])
        time.sleep(3.5)
        lcd.clear()

def DataUpdate():
    sql = "UPDATE getdata SET phData = %s, ecData = %s, wtempData = %s, humiData = %s, atempData = %s WHERE idUsers = '25'"
    val = (PhValue, EcValue, WtempValue, humi, temp,)
    mycursor.execute(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "record(s) affected")

def SetPh(binary, val):
    if binary == True:
        high_val = int(val) + 1
        low_val = int(val) - 1
        if PhValue > high_val:
            ser.write("ph_down".encode())
        elif PhValue < low_val:
            ser.write("ph_up".encode())

def SetLights(binary, val):
    if binary == True:
        if val == "turn on":
            #ser.write("lights_on".encode())
            print("lights on")
        elif val == "turn off":
            #ser.write("lights_off".encode())
            print("lights off")

#def Timer(binary, val):
    #if binary == True:
        

def decimalToBinary(n):
    return bin(n).replace("0b", "")

def main():
    sql2 = "SELECT \
        command.commands AS data \
        FROM command \
        INNER JOIN users ON users.macidUsers = 'dasd'"
    mycursor.execute(sql2)
    myresult = mycursor.fetchall()
    out = list(sum(myresult, ()))
    finalout = out[0].split(",")
    DecBinary = finalout[0] #to binary
    binary = decimalToBinary(int(DecBinary))
    if binary[0] == "1":
        SetPh(True, finalout[1])
    #elif binary[1] == "1":
        #SetWtemp(True, finalout[2])
    #elif binary[2] == "1":
        #SetAtemp(True, finalout[3])
    elif binary[3] == "1":
        SetLights(True, finalout[4])
    elif binary[4] == "1":
        for i in range(5,len(finalout)-1):
            SetTimer(True, finalout[i])
    elif finalout[6] == "GetData":
        DataUpdate()

if __name__ == "__main__":
    while True:
        main()
        Lcd()
