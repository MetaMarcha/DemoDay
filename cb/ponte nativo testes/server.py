import socket
import threading
import time

SERVER_IP = socket.gethostbyname(socket.gethostname())
PORT = 8888
ADDR = (SERVER_IP, PORT)
FORMATO = 'utf-8'

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(ADDR)

ponte = []
conteudo = []

def enviar_msg_dm(conexao):
    print(f"Enviando mensagens para {conexao['addr']}...")
    for i in range(conexao['last'], len(conteudo)):
        msg_envio = "msg=" + conteudo[i]
        conexao['conn'].send(msg_envio.encode())
        conexao['last'] = i + 1
        time.sleep(0.2)

def enviar_msg_lobby():
    global ponte
    for conexao in ponte:
        enviar_msg_dm(conexao)

def handle_clientes(conn, addr):
    print(f"NOVA CONEXAO [endereço {addr}]")
    global ponte
    global conteudo
    nome = False

    while(True):
        msg = conn.recv(1024).decode(FORMATO)
        if(msg):
            if(msg.startswith("nome=")):
                msg_sep = msg.split("=")
                nome = msg_sep[1]
                mapa_ponte = {
                    "conn": conn,
                    "addr": addr,
                    "nome": nome,
                    "last": 0
                }
                ponte.append(mapa_ponte)
                enviar_msg_dm(mapa_ponte)
            elif(msg.startswith("msg=")):
                msg_sep = msg.split("=")
                mensagem = nome + "=" + msg_sep[1]
                conteudo.append(mensagem)
                enviar_msg_lobby()



def start():
    print("Iniciando...")
    server.listen()
    while(True):
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_clientes, args=(conn, addr))
        thread.start()

start()