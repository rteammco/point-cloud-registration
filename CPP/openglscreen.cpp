#include "openglscreen.h"

#include <GLUT/glut.h>
#include <QGLWidget>>
#include <QMouseEvent>
#include <QPoint>
#include <QWidget>

#include <iostream>


OpenGLScreen::OpenGLScreen(QWidget *parent) :
    QGLWidget(parent), look_x_(0), look_y_(0) {}

void OpenGLScreen::initializeGL() {
  glClearColor(0.0, 0.0, 0.0, 0.0);
}

void OpenGLScreen::paintGL() {
  glClear(GL_COLOR_BUFFER_BIT);

  glColor3f(1.0, 1.0, 0.0);
  //glBegin(GL_TRIANGLES);
  //glVertex3f(-0.5, -0.5, 0.0);
  //glVertex3f(0.5, -0.5, 0.0);
  //glVertex3f(0.0, 0.5, 0.0);
  //glEnd();
  gluLookAt(0.0, 0.0, -1.0, look_x_, look_y_, 0.0, 0.0, 1.0, 0.0);
  glutWireTeapot(0.6);
//  glPointSize(1.0);
//  glBegin(GL_POINTS);
//  for (int i = 0; i < 100; ++i) {
//    const float offset = 2.0 / 100;
//    const float val = offset * i - 1;
//    glVertex3f(val, val, val);
//  }
//  glEnd();
//  glFlush();
}

void OpenGLScreen::resizeGL(int w, int h) {
  // TODO
}

void OpenGLScreen::mousePressEvent(QMouseEvent *event) {
  last_pos_ = event->pos();
}

void OpenGLScreen::mouseMoveEvent(QMouseEvent *event) {
  if (event->buttons() & Qt::LeftButton) {
    int dx = event->x() - last_pos_.x();
    int dy = event->y() - last_pos_.y();
    look_x_ += dx / 100.0;
    look_y_ += dy / 100.0;
    std::cout << look_x_ << std::endl;
    //std::cout << dx << ", " << dy << std::endl;
//    glMatrixMode(GL_MODELVIEW);
//    glLoadIdentity();
//    glRotatef(180.0 / 3.14159, dx, dy, 0);
//    //glRotatef(dy * 0.1, 1.0, 0.0, 0.0);
//    //glRotatef(dx * 0.1, 0.0, 0.0, 0.0);
    updateGL();
    last_pos_ = event->pos();
  }
}
