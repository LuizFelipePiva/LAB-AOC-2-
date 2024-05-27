#include <stdio.h>


int powerbase2(int num, int exp);

int main(){
    int num, exp;

    printf("Digite um numero: ");
    scanf("%d", &num);
    printf("Digite a potencia: ");
    scanf("%d", &exp);
    printf("\n\nO resultado eh: %d", powerbase2(num, exp));
}


int powerbase2(int num, int exp){

    int res = 2;

    if(exp == 0){
        return num;
    }

    else if(exp == 1){
        return 2 * num;
    }

    for(int i = 1; i != exp; i++){

       res = res * 2;
    }
    return res * num;
}
