#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>



#define UNUSED_VAR(x) ((void)x)


#define TEXT_LIMIT_SIZE (8*1024)

int rot13basis(int c, int basis);
int rot13(int c);

int rot13(int c){

    if('a' <= c && c <= 'z'){
            return rot13basis(c,'a');
    }else if('A' <= c && c <='Z'){
            return rot13basis(c,'A');
    }

    return c;
}

int rot13basis(int c, int basis){
    c = (((c-basis)+13)%26)+basis;
    return c;
}





void read_input(char *out){
    
    char *buf = NULL;
    int read = 0;
    size_t len = 0;

    while((read = getline(&buf, &len, stdin)) != EOF ){
        strncat(out, " ", 2);
        int len = strnlen(buf,255)-1;
        strncat(out, buf, strnlen(buf,len));
    } 


    free(buf);
 
}

void convert_rot13(char* s){


    char *out = NULL;
    int len = strnlen(s,TEXT_LIMIT_SIZE);
    out = malloc(len+1);
    memset(out,0,len+1);


    while(s++ != NULL && *s != '\0' &&  *s != EOF){
        char c = rot13(*s);
        strncat(out, &c, 1);
    }


    fprintf(stdout,"%s\n",out);
    fprintf(stdout, "Length: %d\n", len+1);
    free(out);

}

void help(){
	
	fprintf(stdout, "USAGE:\n");
	fprintf(stdout, "echo \"Text Here\" | [rot13|./rot13]\n\n");
	exit(0);
}
int main(int argc,  char *argv[]){
 	
    UNUSED_VAR(argc);
    UNUSED_VAR(argv);

    if(argc > 1){
        help();
    }

    char *text = NULL;
    text = malloc(TEXT_LIMIT_SIZE);
    read_input(text);
    //fprintf(stdout, "Original Text: %s\n", text);
    convert_rot13(text);
    free(text);



    return 0;
}
