//"RBL_nRF8001.h/spi.h/boards.h" is needed in every new project
#include <SPI.h>
#include <EEPROM.h>
#include <boards.h>
#include <RBL_nRF8001.h>

void setup() {
    // Set your BLE advertising name here, max. length 10
    ble_set_name("Remote Car");
    
    // Init. and start BLE library.
    ble_begin();
    
    // Enable serial debug
    Serial.begin(57600);
    
    pinMode(8, OUTPUT);
}

unsigned char buf[16] = {0};
unsigned char len = 0;

void loop() {
    
    sendString();
    
    readCenterData();
    
    ble_do_events();
    
    printDebugMessage();
    
    delay(1000);
}

void sendString() {
    
    if (ble_connected()) {
        
        ble_write('H');
        ble_write('e');
        ble_write('l');
        ble_write('l');
        ble_write('o');
        ble_write(' ');
        ble_write('W');
        ble_write('o');
        ble_write('r');
        ble_write('l');
        ble_write('d');
        ble_write('!');
    }
}

void readCenterData() {
    
    byte cmd = ble_read();
    switch(cmd){
            
        case 'T': {
            digitalWrite(8, HIGH);
        }
            break;
            
        case 't': {
            digitalWrite(8, LOW);
        }
            break;
    }
}

void printDebugMessage() {
    
    if (ble_available()) {
        
        while (ble_available()) {
            
            Serial.write(ble_read());
        }
        Serial.println();
    }
}
