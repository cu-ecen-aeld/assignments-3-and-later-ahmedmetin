#include <stdio.h>
#include <syslog.h>

#ifndef WRITEFILE
 #define WRITEFILE argv[1]
#endif // WRITEFILE

#ifndef WRITESTR
 #define WRITESTR argv[2]
#endif // WRITESTR

int main(int argc, char const *argv[])
{

    openlog(NULL, 0, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Invalid number of input arguments: %d", argc);
        return 1;
    }
    else
    {
        syslog(LOG_DEBUG, "Writing %s to %s", WRITESTR, WRITEFILE);

        // open the file for writing
        FILE *fp = fopen(WRITEFILE, "w");

        if (fp == NULL)
        {
            syslog(LOG_ERR, "Error opening the file %s", WRITEFILE);
            return 1;
        }
        // write to the text file
        fprintf(fp, "%s", WRITESTR);

        // close the file
        fclose(fp);
    }

    return 0;
}
