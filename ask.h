/*
**     _    ____  _  __
**    / \  / ___|| |/ /  ASK
**   / _ \ \___ \| ' /   Authentication Sessions Keeper Server
**  / ___ \ ___) | . \   -------------------------------------
** /_/   \_\____/|_|\_\  www.codegazoline.it/ask
**                 v0.1
** ===========================================================================
**
** Copyright (C) 2015, The CodeGazoline Team - gargantua AT codegazoline DOT it
** Luca {joshuagame} Stasio - joshuagame AT gmail DOT com
**
** ask.h
** main header file for the ASK Server
**
** This file is part of the ASK Server.
**
** The ASK Server is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation, either version 3 of the License, or
** (at your option) any later version.
**
** The ASK Server is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with Nome - Programma.If not, see <http://www.gnu.org/licenses/>.
**
** ===========================================================================
*/

#ifndef ASK_SERVER_ASK_H
#define ASK_SERVER_ASK_H

#define _GNU_SOURCE         /*!< this is for asprintf() */

#include "version.h"
#include "ini.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <getopt.h>
#include <string.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <inttypes.h>
#include <microhttpd.h>
#ifndef __APPLE__
#ifdef __CYGWIN__
#include <sys/errno.h>
#else
#include <bits/errno.h>
#endif
#endif

#define ASK_REALM "\"ask\""
#define TEST_USER "test"
#define TEST_PASSWORD "password"

#define ASK_COOKIE_NAME "ASKSESSION"

/* html pages */
#define HOME_PAGE "<html><head><title>ASK Server</title></head>"\
                    "<body>This is the Authentication Sessions Keeper Server up and running instance.</body></html>"
#define API_HOME_PAGE "<html><head><title>ASK Server</title></head>"\
                    "<body>This is the Authentication Sessions Keeper Server API Home:<br>"\
                    "<b>/ask/ab</b>: Basic authentication<br>"\
                    "<b>/ask/af</b>: Form-based authentication<br></body></html>"
#define ERROR_ILLEGAL_REQUEST_PAGE "<html><head><title>ASK Server</title></head>"\
                    "<body>Illegal request.</body></html>"
#define ERROR_NOT_FOUND_PAGE "<html><head><title>ASK Server</title></head>"\
                    "<body>Not found.</body></html>"

#define AUTHENTICATED MHD_YES
#define NOT_AUTHENTICATED MHD_NO
#define NO_BASIC_AUTH_INFO 0x100


/** configuration */

struct Config {
    int port;
    bool ssl;
    const char* name;
    const char* http_auth_url;
    bool http_auth_ssl;
};

enum CL_CONF {
    NONE = 0,
    PORT = 1,
    _SSL = 2
};

extern struct Config globalConfig;
extern const char* configFileName;
extern unsigned int commandLineConfiguredParams;

/** request and session */

#define J_USERNAME "j_username"
#define J_PASSWORD "j_password"

struct FormCredentials {
    char username[256];
    char password[64];
};

typedef struct Session {
    struct Session* next;
    char id[33];
    unsigned int rc;
    time_t start;
    struct FormCredentials fcred;
} Session;

/** sessions linked list. TODO: use an HashMap! */
static Session* sessions;

typedef struct {
    Session* session;
    struct MHD_PostProcessor* postProcessor;
    const char* postUrl;
} Request;

typedef struct MHD_Response Response;
typedef struct MHD_Connection Connection;


/** forward (only public) function declarations */

/* configure.c */
void configure(int argc, char *const *argv);

/* session.c */
Session* getSession(struct MHD_Connection* connection);
void addSessionCookie(Session* session, Response* response);
const char* getSessionCookie(Connection* connection);
void setSessionUsername(Session* session, size_t size, uint64_t offset, const char* data);
void setSessionPassword(Session* session, size_t size, uint64_t offset, const char* data);
const char* getSessionUsername(Session* session);
const char* getSessionPassword(Session* session);

/* protocol.c */

int requestHandler(void* cls, struct MHD_Connection* connection, const char* url, const char* method,
                          const char* version, const char* uploadData, size_t* uploadDataSize, void** ptr);
void requestCompletedCallback(void* cls, struct MHD_Connection* connection,
                                     void** conCls, enum MHD_RequestTerminationCode toe);
const char* getHeaderValue(Connection* connection, const char* headerName);

/* authentication.c */
int authenticate(Connection* connection, Session* session);

/* http_auth_client.c */
int httpBasicAuthentication(const char* username, const char* basicAuth);

#endif //ASK_SERVER_ASK_H
