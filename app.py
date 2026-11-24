import mysql.connector
from mysql.connector import Error

try:
    # Conexão com o MySQL
    conexao = mysql.connector.connect(
        host='localhost',           # ou IP do servidor MySQL
        database='sistema_escolar',
        user='root',
        password='1a2b3c4d'
    )

    if conexao.is_connected():
        print("Conectado ao MySQL!")

        cursor = conexao.cursor()

        # Exibe versão do MySQL
        cursor.execute("SELECT VERSION()")
        versao = cursor.fetchone()
        print("Versão do MySQL:", versao[0])

        # Exemplo de inserção de um novo professor
        cursor.execute("""
            INSERT INTO professor (nome, departamento_id, salario)
            VALUES (%s, %s, %s)
        """, ('João Silva', 1, 5100.00))
        conexao.commit()
        print("Linhas inseridas:", cursor.rowcount)

        # Exemplo de consulta
        cursor.execute("SELECT nome, salario FROM professor")
        resultados = cursor.fetchall()
        for nome, salario in resultados:
            print(f"{nome} - R$ {salario:.2f}")

except Error as e:
    print("Erro ao conectar ou executar comandos:", e)

finally:
    if conexao.is_connected():
        cursor.close()
        conexao.close()
        print("Conexão encerrada.")