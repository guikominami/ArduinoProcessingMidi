int porta_potenciometro1 = A3;
int porta_potenciometro2 = A0;
int porta_potenciometro3 = A1;
int porta_potenciometro4 = A2;

int porta_botao1 = 4;
int porta_botao2 = 6;
int porta_botao3 = 5;
int porta_botao4 = 3;
int porta_botao5 = 8;

int valor_botao1 = 0;
int valor_botao2 = 0;
int valor_botao3 = 0;
int valor_botao4 = 0;
int valor_botao5 = 0;

int potenciometro1 = 0;
int potenciometro2 = 0;
int potenciometro3 = 0;
int potenciometro4 = 0;
String valor_potenciometro1_antigo;
String valor_potenciometro2_antigo;
String valor_potenciometro3_antigo;
String valor_potenciometro4_antigo;

void setup() {
  
  Serial.begin(9600); //Begin serial communication 
  
  pinMode(porta_botao1, INPUT);
  pinMode(porta_botao2, INPUT);
  pinMode(porta_botao3, INPUT);
  pinMode(porta_botao4, INPUT);
  pinMode(porta_botao5, INPUT);
  pinMode(porta_potenciometro1, INPUT);
  pinMode(porta_potenciometro2, INPUT);
  pinMode(porta_potenciometro3, INPUT);
  pinMode(porta_potenciometro4, INPUT);

}

void loop() {

  //so you need to put a scale of 0-1023 numerical scale between 0-255
  //map(value, fromLow, fromHigh, toLow, toHigh)

  //pula tempo
  potenciometro1 = analogRead(porta_potenciometro1);  

  String mensagem_potenciometro1 = String(map(potenciometro1,0,1023,255,0));

  if (mensagem_potenciometro1 != valor_potenciometro1_antigo && 
      mensagem_potenciometro1.substring(0, 1) != valor_potenciometro1_antigo.substring(0, 1)){
      
      enviaMensagemTexto("p1:" + mensagem_potenciometro1);
      valor_potenciometro1_antigo = mensagem_potenciometro1; 
      delay(10);   
  }

  //volume
  potenciometro2 = analogRead(porta_potenciometro2);  

  String mensagem_potenciometro2 = String(map(potenciometro2,0,1023,255,0));

  if (mensagem_potenciometro2 != valor_potenciometro2_antigo){
      
      enviaMensagemTexto("p2:" + mensagem_potenciometro2);
      valor_potenciometro2_antigo = mensagem_potenciometro2; 
      delay(10);   
  }

  //pula frame
  potenciometro3 = analogRead(porta_potenciometro3);  

  String mensagem_potenciometro3 = String(map(potenciometro3,0,1023,255,0));

  if (mensagem_potenciometro3 != valor_potenciometro3_antigo &&
      mensagem_potenciometro3.substring(0, 1) != valor_potenciometro3_antigo.substring(0, 1)){
      
      enviaMensagemTexto("p3:" + mensagem_potenciometro3);
      valor_potenciometro3_antigo = mensagem_potenciometro3; 
      delay(10);   
  } 

  potenciometro4 = analogRead(porta_potenciometro4);  

  String mensagem_potenciometro4 = String(map(potenciometro4,0,1023,255,0));

  if (mensagem_potenciometro4 != valor_potenciometro4_antigo){
      enviaMensagemTexto("p4:" + mensagem_potenciometro4);
      valor_potenciometro4_antigo = mensagem_potenciometro4; 
      delay(10);  
  }   

  valor_botao1 = digitalRead(porta_botao1);

  if (valor_botao1 == 1){
      enviaMensagemTexto("b1");
      delay(1000);
  }  

  valor_botao2 = digitalRead(porta_botao2);

  if (valor_botao2 == 1){
      enviaMensagemTexto("b2");  
      delay(1000);
  }

  valor_botao3 = digitalRead(porta_botao3);

  if (valor_botao3 == 1){
      enviaMensagemTexto("b3");  
      delay(1000);
  }

  valor_botao4 = digitalRead(porta_botao4);

  if (valor_botao4 == 1){
      enviaMensagemTexto("b4");  
      delay(1000);
  }  

  valor_botao5 = digitalRead(porta_botao5);

  if (valor_botao5 == 1){
      enviaMensagemTexto("b5");  
      delay(1000);
  }  
}

void enviaMensagem(byte comando, byte dado1, byte dado2){
  
  Serial.write(comando);
  Serial.write(dado1);
  Serial.write(dado2);

}

void enviaMensagemTexto(String comando){

  Serial.print("{" + comando + "}");
  delay(100);
  
}

void enviaMensagemUnica(byte comando){

  Serial.write(comando);
  
}
