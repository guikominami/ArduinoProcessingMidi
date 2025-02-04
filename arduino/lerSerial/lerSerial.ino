#include "SoftwareSerial.h"

//variáveis
int potenciometro = A0;
int retorno_potenciometro = 0;
int botao = 8;
int retorno_botao = 0;

void setup() {   

  Serial.begin(9600);
               
  // inicializa as variáveis e portas
  pinMode(potenciometro, INPUT);
  pinMode(botao, INPUT);
  
}

void loop() {

  retorno_potenciometro = analogRead(potenciometro);
  
  Serial.println("Potenciometro:");
  Serial.println(retorno_potenciometro);

  retorno_botao = digitalRead(botao);

  Serial.println("Botão:");
  Serial.println(retorno_botao);  
  
  delay(1000);  
}
