import socket
import threading
import time

PORT = 8888
FORMATO = 'utf-8'
SERVER = "192.168.0.109"
ADDR = (SERVER, PORT)

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(ADDR)

def handle_mensagens():
    while(True):
        msg = client.recv(1024).decode()
        msg_split = msg.split("=")
        print(msg_split[1] + ": " + msg_split[2])

def enviar(mensagem):
    client.send(mensagem.encode(FORMATO))

def enviar_msg():
    mensagem = input()
    enviar("Msg: " + mensagem)

def enviar_nome():
    nome = input('Como gostaria de ser chamado? ')
    enviar("Nome: " + nome)

def iniciar_envio():
    enviar_nome()
    enviar_msg()

def iniciar():
    thread1 = threading.Thread(target=handle_mensagens)
    thread2 = threading.Thread(target=iniciar_envio)
    thread1.start()
    thread2.start()

iniciar()