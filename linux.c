#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//.\gcc c2asm.c -o c2asm.exe
int main(int argc, char *argv[]) {
    // Verificar se o número de argumentos está correto
    if (argc != 2) {
        printf("Uso: %s <nome_do_arquivo.c>\n", argv[0]);
        return 1;
    }

    // Obter o nome do arquivo C a partir dos argumentos da linha de comando
    char *nome_arquivo_c = argv[1];

    // Construir o comando para executar o gcc
    char comando[1000];
    sprintf(comando, "gcc -S -masm=intel %s -o %s.tmp", nome_arquivo_c, nome_arquivo_c);

    // Executar o comando
    printf("\x1c\x1b[43;30mExecutando: %s\n", comando);
    system(comando);

    // Abrir o arquivo gerado pelo gcc
    FILE *arquivo_saida = fopen(strcat(nome_arquivo_c, ".tmp"), "r");
    if (arquivo_saida == NULL) {
        perror("Erro ao abrir o arquivo temporário");
        return 1;
    }

    // Ler e imprimir o conteúdo do arquivo, ignorando linhas com ponto
    char linha[1000];
    while (fgets(linha, sizeof(linha), arquivo_saida) != NULL) {
        if (strstr(linha, ".") == NULL) {
            printf("%s", linha);
        }else{
            if (strstr(linha, ".ascii") != NULL) {
                printf("%s", linha);
            }
            if (strstr(linha, ".string") != NULL) {
                printf("%s", linha);
            }
            if (strstr(linha, ".text") != NULL) {
                printf("%s", linha);
            }
            if (strstr(linha, ".long") != NULL) {
                printf("%s", linha);
            }
        }
    }

    // Fechar o arquivo
    fclose(arquivo_saida);

    // Aguardar antes de fechar o console (para visualizar a saída)
    printf("Pressione Enter para sair...");
    getchar();

    return 0;
}

