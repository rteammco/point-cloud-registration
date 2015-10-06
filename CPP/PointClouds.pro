#-------------------------------------------------
#
# Project created by QtCreator 2015-10-06T15:30:51
#
#-------------------------------------------------

QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = PointClouds
TEMPLATE = app


LIBS += -framework Cocoa -framework GLUT

SOURCES += main.cpp\
        mainwindow.cpp \
    openglscreen.cpp

HEADERS  += mainwindow.h \
    openglscreen.h

FORMS    += mainwindow.ui
