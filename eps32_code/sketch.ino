#include <WiFi.h>
#include "FirebaseESP32.h"

#include "DHTesp.h"
const int DHT_PIN = 15;
DHTesp dhtSensor;

#include <addons/TokenHelper.h>

#include <addons/RTDBHelper.h>

#define WIFI_SSID "Wokwi-GUEST"
#define WIFI_PASSWORD ""

#define FIREBASE_HOST "<----PUT THE DATABASE URL HERE---->"
#define FIREBASE_AUTH "<----PUT THE DATABASE KEY HERE---->"

FirebaseData firebaseData;
FirebaseAuth auth;
FirebaseConfig config;

String path = "/ESP32_Device";
unsigned long sendDataPrevMillis = 0;
unsigned long count = 0;
float prev_temp;
float prev_humidity;

void setup()
{

  Serial.begin(115200);

  dhtSensor.setup(DHT_PIN, DHTesp::DHT22);
  
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD, 6);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  
  //Set database read timeout to 1 minute (max 15 minutes)
  Firebase.setReadTimeout(firebaseData, 1000 * 60);
  //tiny, small, medium, large and unlimited.
  //Size and its write timeout e.g. tiny (1s), small (10s), medium (30s) and large (60s).
  Firebase.setwriteSizeLimit(firebaseData, "tiny");
}

void loop() {
  delay(5000);
  
  TempAndHumidity  data = dhtSensor.getTempAndHumidity();
  if (isnan(data.temperature)) {
    Serial.println(F("Error reading temperature!"));
  }
  else {
    Serial.println("Temp: " + String(data.temperature, 2) + "°C");
    updateTemp(data.temperature);
  }

  if (isnan(data.humidity)) {
    Serial.println(F("Error reading humidity!"));
  }
  else {
    Serial.println("Humidity: " + String(data.humidity, 1) + "%");
    updateHumidity(data.humidity);
  }
}

void updateTemp(float temp){
  if(prev_temp != temp){
    prev_temp = temp;
    Firebase.setDouble(firebaseData, path + "/Temperature/Data", temp);
  }
}

void updateHumidity(float humidity){
  if(prev_humidity != humidity){
    prev_humidity = humidity;
    Firebase.setDouble(firebaseData, path + "/Humidity/Data", humidity);
  }
}
