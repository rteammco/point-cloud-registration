#include "openglscreen.h"
#include <vector>


OpenGLScreen::OpenGLScreen(QWidget *parent) : QGLWidget(parent) {}

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
  glPointSize(1.0);
  glBegin(GL_POINTS);
  for (int i = 0; i < 100; ++i) {
    const float offset = 2.0 / 100;
    const float val = offset * i - 1;
    glVertex3f(val, val, val);
  }
  glEnd();
  glFlush();
}

void OpenGLScreen::resizeGL(int w, int h) {
  // TODO
}
