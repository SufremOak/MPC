#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAX_LINE 1024
#define MAX_ARGS 64

void parse_command(char *cmd, char **args) {
    for (int i = 0; i < MAX_ARGS; i++) {
        args[i] = strsep(&cmd, " ");
        if (args[i] == NULL) break;
    }
}

void execute_command(char **args) {
    pid_t pid = fork();
    if (pid == 0) {
        // Child process
        if (execvp(args[0], args) == -1) {
            perror("Error executing command");
        }
        exit(EXIT_FAILURE);
    } else if (pid < 0) {
        // Fork failed
        perror("Error forking");
    } else {
        // Parent process
        wait(NULL);
    }
}

int main() {
    char line[MAX_LINE];
    char *args[MAX_ARGS];

    while (1) {
        printf("root# ");
        if (fgets(line, sizeof(line), stdin) == NULL) {
            break;
        }

        // Remove newline character from the end of the input
        line[strcspn(line, "\n")] = '\0';

        parse_command(line, args);

        if (args[0] == NULL) {
            continue;
        }

        if (strcmp(args[0], "exit") == 0) {
            break;
        }

        execute_command(args);
    }

    return 0;
}