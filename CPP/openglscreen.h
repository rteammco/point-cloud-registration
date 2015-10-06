#ifndef OPENGLSCREEN_H
#define OPENGLSCREEN_H

#include <QGLWidget>


class OpenGLScreen : public QGLWidget {
  Q_OBJECT

 public:
  explicit OpenGLScreen(QWidget *parent = 0);

  void initializeGL();
  void paintGL();
  void resizeGL(int w, int h);
};

#endif // OPENGLSCREEN_H
