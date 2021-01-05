
Transform cube = new Transform();
Transform cubeA = new Transform();
Transform cubeB = new Transform();
Transform cubeC = new Transform();

Transform sphere = new Transform();

PImage diamond;
PImage grassTop;
PImage grassBottom;
PImage grassSide;


public void setup()
{
  size(600, 600, P3D);
  cube.position = new PVector(150, height/ 2, -300);
  cube.scale = new PVector(200, 200, 200);
  
  cubeA.position = new PVector(400, height/ 2, -300);
  cubeA.scale = new PVector(200, 200, 200);
  
  cubeB.position = new PVector(450, 100, -300);
  cubeB.scale = new PVector(100, 200, 200);
  
  cubeC.position = new PVector(150, 100, -300);
  cubeC.scale = new PVector(200, 200, 200);

  sphere.position = new PVector(450, height/ 2, -300);
  sphere.scale = new PVector(100, 200, 200);
  
  diamond = loadImage("diamond.png");
  grassTop = loadImage("grass_top.png");
  grassBottom = loadImage("dirt.png");
  grassSide = loadImage("grass_side.png");

  
  textureMode(NORMAL);
}

public void draw()
{
  background(255);
  Cube(cube, new PImage[] {grassSide, grassSide, grassSide, grassSide, grassTop, grassBottom});
  Cube(cubeA, diamond);
  Cube(cubeB, grassBottom);
  Cube(cubeC, color(0, 0, 150));

  //Sphere(sphere, color(0, 0, 255));

}

private void Cube(Transform transform, color colour)
{
  stroke(8);
  pushMatrix();
  
  translate(transform.position.x, transform.position.y, transform.position.z);
  rotateX(transform.rotation.x);
  rotateY(transform.rotation.y);
  rotateZ(transform.rotation.z);
  
  fill(colour);

  box(transform.scale.x, transform.scale.y, transform.scale.z);
  
  popMatrix();
}

private void Cube(Transform transform, PImage[] textures)
{
  pushMatrix();
  
  translate(transform.position.x, transform.position.y, transform.position.z);
  rotateX(transform.rotation.x);
  rotateY(transform.rotation.y);
  rotateZ(transform.rotation.z);
  
  scale(transform.scale.x);
  noStroke();
 
  beginShape(QUADS);
  //f
  
  texture(textures[0]);
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
    endShape();

  //b
    beginShape(QUADS);

    texture(textures[1]);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
    endShape();

  //l
    beginShape(QUADS);

    texture(textures[2]);

  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
    endShape();

  //r
    beginShape(QUADS);

    texture(textures[3]);

  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
    endShape();

  //t
    beginShape(QUADS);

    texture(textures[4]);

  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
    endShape();

  //b
    beginShape(QUADS);

    texture(textures[5]);

  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  
  popMatrix();
}

private void Cube(Transform transform, PImage texture)
{
  pushMatrix();
  
  translate(transform.position.x, transform.position.y, transform.position.z);
  rotateX(transform.rotation.x);
  rotateY(transform.rotation.y);
  rotateZ(transform.rotation.z);
  
  scale(transform.scale.x);
  noStroke();
 
  beginShape(QUADS);
  texture(texture);
  //f
  
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //b
  
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //l
  
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //r
  
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  //t
  
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  //b
  
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  
  popMatrix();
}

private void Sphere(Transform transform, color colour)
{
  pushMatrix();
  
  translate(transform.position.x, transform.position.y, transform.position.z);
  rotateX(transform.rotation.x);
  rotateY(transform.rotation.y);
  rotateZ(transform.rotation.z);
  
  fill(colour);

  sphere(transform.scale.x);
  
  popMatrix();
}

public void mouseDragged()
{
  cube.rotation.x += (pmouseY - mouseY) * 0.01;
  cube.rotation.y -= (pmouseX - mouseX) * 0.01;
  
    cubeA.rotation.x += (pmouseY - mouseY) * 0.01;
  cubeA.rotation.y -= (pmouseX - mouseX) * 0.01;
    cubeB.rotation.x += (pmouseY - mouseY) * 0.01;
  cubeB.rotation.y -= (pmouseX - mouseX) * 0.01;
    cubeC.rotation.x += (pmouseY - mouseY) * 0.01;
  cubeC.rotation.y -= (pmouseX - mouseX) * 0.01;
  
  
  sphere.rotation.x += (pmouseY - mouseY) * 0.01;
  sphere.rotation.y -= (pmouseX - mouseX) * 0.01;
}

public class Transform
{
   public PVector position = new PVector();
   public PVector rotation = new PVector();
   public PVector scale = new PVector(1, 1, 1);
}
