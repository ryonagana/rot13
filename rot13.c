#include <stdio.h>
#include <string.h>
#include <stdlib.h>



int debug_mode = 0;
int has_args = 0;
#define UNUSED_VAR(x) ((void)x)
void rot13(char *str){
    int i;
    

    if(!str){
        fprintf(stderr, "Invalid String");
        exit(1);
    }

    int len = strlen(str) - 1;
    
    //set \0 in the end of string
    *(str + len + 1) = '\0';

    for(i = 0; str[i] != '\0'; i++){


        if( str[i] >= 'a' && str[i] <= 'n') { str[i] += 13; continue; }
        if( str[i] >= 'A' && str[i] <= 'N') { str[i] += 13; continue; }
        if( str[i] >= 'N' && str[i] <= 'Z') { str[i] -= 13; continue; }
        if( str[i] >= 'n' && str[i] <= 'z') { str[i] -= 13; continue; }
        

    }


    fprintf(stdout, "%s\n",str);

}


void process_args(int v_argc, char *v_argv[], char *out ){
    
    int i;
    
    switch(*v_argv[0]){
        case '-':{

                     if(*v_argv[1] == '-' && *v_argv[2] == 'd'  ){
                        debug_mode = 1;
                        has_args = 1;
                     }

                 }
        break;

    }
    
    if(!has_args){
        for(i = 1; i < v_argc; i++){
            strncat(out, " ", 2);
	    int len = strnlen(v_argv[i],255)-1;
            strncat(out, v_argv[i], len);
        }
    }else {

        for(i = 2; i < v_argc; i++){
            int len = strnlen(v_argv[i],255)-1; 
            strncat(out, " ", 2);
            strncat(out, v_argv[i], len);
         }
    }

    
}


void read_input(char *out){
    
    char *buf = NULL;
    int read = 0;
    size_t len = 0;

    while((read = getline(&buf, &len, stdin)) != EOF ){
        strncat(out, " ", 2);
	int len = strnlen(buf,255)-1;
        strncat(out, buf, strnlen(buf,len));
        free(buf);   
    } 
 
}

void help(){
	
	fprintf(stdout, "USAGE:\n");
	fprintf(stdout, "echo \"YOUR MESSAGE!!\" | [rot13|./rot13]\n\n");
	exit(0);
}
int main(int argc,  char *argv[]){
    
    char tmp[2048] = {0};
    UNUSED_VAR(argv);
    if(argc > 1){
	help();
        /*
	process_args(argc, argv, tmp);
        if(has_args && debug_mode){
            printf("DEBUG");
            fprintf(stdout, "%s", tmp);
        }      

        //process_args(argc, argv, tmp);
        rot13(tmp);
        exit(0);
	*/
    }

    read_input(tmp);
    rot13(tmp);
    //help();
    return 0;
}
