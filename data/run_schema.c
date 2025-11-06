#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>
#include <string.h>

#define MAX_SQL_SIZE 1048576  // 1MB max for SQL file

char* read_file(const char* filename) {
    FILE* f = fopen(filename, "rb");
    if (!f) {
        fprintf(stderr, "Error: Could not open file '%s'\n", filename);
        return NULL;
    }

    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);

    if (size > MAX_SQL_SIZE) {
        fprintf(stderr, "Error: SQL file too large\n");
        fclose(f);
        return NULL;
    }

    char* content = malloc(size + 1);
    if (!content) {
        fprintf(stderr, "Error: Memory allocation failed\n");
        fclose(f);
        return NULL;
    }

    fread(content, 1, size, f);
    content[size] = '\0';
    fclose(f);

    return content;
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        printf("Usage: %s <database.db> <schema.sql>\n", argv[0]);
        return 1;
    }

    const char* db_name = argv[1];
    const char* sql_file = argv[2];

    // Read SQL file
    char* sql = read_file(sql_file);
    if (!sql) {
        return 1;
    }

    // Open database
    sqlite3* db;
    int rc = sqlite3_open(db_name, &db);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Error: Cannot open database: %s\n", sqlite3_errmsg(db));
        free(sql);
        return 1;
    }

    printf("Executing schema from '%s' on database '%s'...\n", sql_file, db_name);

    // Execute SQL
    char* err_msg = NULL;
    rc = sqlite3_exec(db, sql, NULL, NULL, &err_msg);

    if (rc != SQLITE_OK) {
        fprintf(stderr, "SQL Error: %s\n", err_msg);
        sqlite3_free(err_msg);
        sqlite3_close(db);
        free(sql);
        return 1;
    }

    printf("Schema executed successfully!\n");

    // Cleanup
    sqlite3_close(db);
    free(sql);

    return 0;
}
