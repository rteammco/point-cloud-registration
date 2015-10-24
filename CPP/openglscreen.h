#ifndef OPENGLSCREEN_H
#define OPENGLSCREEN_H

#include <QGLWidget>
#include <QMouseEvent>
#include <QPoint>
#include <QWidget>>


class OpenGLScreen : public QGLWidget {
  Q_OBJECT

 public:
  explicit OpenGLScreen(QWidget *parent = 0);

  void initializeGL();
  void paintGL();
  void resizeGL(int w, int h);

  void mousePressEvent(QMouseEvent *event);
  void mouseMoveEvent(QMouseEvent *event);

 private:
  QPoint last_pos_;
  float look_x_;
  float look_y_;
};

#endif // OPENGLSCREEN_H
