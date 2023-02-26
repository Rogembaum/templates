#include <stdio.h>
#include <unistd.h>

int main ()
{
    FILE* fp = fopen("testfile","w"); //create file
    fclose(fp);

    return 0;
}
