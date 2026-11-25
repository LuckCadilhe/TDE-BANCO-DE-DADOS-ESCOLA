import mysql.connector
from mysql.connector import Error

conexao = None

try:
    
    conexao = mysql.connector.connect(
        host='localhost',
        database='ESCOLA',
        user='root',
        password='1a2b3c4d'
    )

    if conexao.is_connected():
        print("Conectado ao MySQL!")
        cursor = conexao.cursor()

       
        cursor.execute("SELECT VERSION()")
        versao = cursor.fetchone()
        print("Versão do MySQL:", versao[0])

       
        sql_insert = """
            INSERT INTO PROFESSOR (nome, cpf, dt_nascimento)
            VALUES (%s, %s, %s)
        """
        dados_professor = ('João Silva', '12345678901', '1986-05-20')
        
        cursor.execute(sql_insert, dados_professor)
        conexao.commit()
        print("Linhas inseridas:", cursor.rowcount)

        
        cursor.execute("SELECT nome, cpf, dt_nascimento FROM PROFESSOR")
        resultados = cursor.fetchall()
        
        print("\nLista de Professores:")
        for nome, cpf, dt_nascimento in resultados:
            print(f"{nome} | CPF: {cpf} | Nasc: {dt_nascimento}")

except Error as e:
    print("Erro ao conectar ou executar comandos:", e)

finally:
    if conexao is not None and conexao.is_connected():
        cursor.close()
        conexao.close()
        print("\nConexão encerrada.")