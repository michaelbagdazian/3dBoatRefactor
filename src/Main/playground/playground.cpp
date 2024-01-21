#include "playground.h"
#include <glfw3.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <glm/gtc/matrix_transform.hpp>
using namespace glm;
#include <chrono>
#include <thread>
#include <common/shader.hpp>

GLFWwindow* window;

// Function declarations
void scrollCallback(GLFWwindow* window, double xoffset, double yoffset);

int main(void)
{
    // Initialize window
    bool windowInitialized = initializeWindow();
    if (!windowInitialized) return -1;

    // Initialize vertex buffer
    bool vertexbufferInitialized = initializeVertexbuffer();
    if (!vertexbufferInitialized) return -1;

    // Create and compile our GLSL program from the shaders
    programID = LoadShaders("SimpleVertexShader.vertexshader", "SimpleFragmentShader.fragmentshader");

    // Get a handle for our "MVP" and "MV" uniforms and update them for initialization 
    MatrixIDMV = glGetUniformLocation(programID, "MV");
    MatrixID = glGetUniformLocation(programID, "MVP");
    updateMVPTransformation();

    // Enable depth test
    glEnable(GL_DEPTH_TEST);

    // Set up the scroll callback function
    glfwSetScrollCallback(window, scrollCallback);

    // Start animation loop until escape key is pressed
    do {
        updateAnimationLoop();
        std::this_thread::sleep_for(std::chrono::milliseconds(5));
    } while (glfwGetKey(window, GLFW_KEY_ESCAPE) != GLFW_PRESS &&
             glfwWindowShouldClose(window) == 0);

    // Cleanup and close window
    cleanupVertexbuffer();
    glDeleteProgram(programID);
    closeWindow();

    return 0;
}

float zoom = 5;

void updateAnimationLoop()
{
    // Clear the screen
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    // Use our shader
    glUseProgram(programID);

    // Update the MVP transformation with the new values
    updateMVPTransformation();

    // Send our transformation to the currently bound shader, 
    // in the "MVP" uniform and also the "MV" uniform
    glUniformMatrix4fv(MatrixID, 1, GL_FALSE, &MVP[0][0]);
    glUniformMatrix4fv(MatrixIDMV, 1, GL_FALSE, &MV[0][0]);

    // Bind our texture in Texture Unit 0
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, Texture);
    // Set our "myTextureSampler" sampler to use Texture Unit 0
    glUniform1i(texID, 0);

    boat.DrawObject();

    // Swap buffers
    glfwSwapBuffers(window);
    glfwPollEvents();
}

void scrollCallback(GLFWwindow* window, double xoffset, double yoffset)
{
    // Use yoffset to determine the direction of the scroll
    zoom += static_cast<float>(yoffset);
}

bool initializeWindow()
{
    // Initialize GLFW
    if (!glfwInit())
    {
        fprintf(stderr, "Failed to initialize GLFW\n");
        getchar();
        return false;
    }

    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // To make MacOS happy; should not be needed
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    // Open a window and create its OpenGL context
    window = glfwCreateWindow(1024, 768, "sailboat in 3d", NULL, NULL);
    if (window == NULL) {
        fprintf(stderr, "Failed to open GLFW window. If you have an Intel GPU, they are not 3.3 compatible. Try the 2.1 version of the tutorials.\n");
        getchar();
        glfwTerminate();
        return false;
    }
    glfwMakeContextCurrent(window);
    glewExperimental = true; // Needed for core profile
    if (glewInit() != GLEW_OK) {
        fprintf(stderr, "Failed to initialize GLEW\n");
        getchar();
        glfwTerminate();
        return false;
    }
    // Ensure we can capture the escape key being pressed below
    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

    // black background
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    return true;
}

bool updateMVPTransformation()
{
    // Setup Projection matrix: This defines the perspective projection characteristics (like field of view)
    glm::mat4 Projection = glm::perspective(glm::radians(45.0f), 4.0f / 3.0f, 0.1f, 500.0f);

    // Setup View matrix: This defines the position and orientation of the camera
    glm::mat4 View = glm::lookAt(
        glm::vec3(0, 0, 15 + zoom), // Camera position with added zoom
        glm::vec3(0, 0, 0),         // Look at point (the origin)
        glm::vec3(1, 0, 0)          // Up vector
    );

    // Combine Model, View, and Projection matrices to create the final MVP matrix
    MVP = Projection * View;

    return true;
}

bool initializeVertexbuffer()
{
    textureSamplerID = glGetUniformLocation(programID, "myTextureSampler");
    // This is only used for loading the uvs
    bool res = loadOBJ("lifeboatwater.obj", vertices, uvs, normals);
    boat = RenderingObject();
    boat.InitializeVAO();
    glGenVertexArrays(1, &VertexArrayID);
    glBindVertexArray(VertexArrayID);
    std::vector< glm::vec3 > vertices = std::vector< glm::vec3 >();
    std::vector< glm::vec3 > normals = std::vector< glm::vec3 >();
    loadSTLFile(vertices, normals, "sailboat.stl");
    vertexbuffer_size = vertices.size() * sizeof(glm::vec3);
    boat.SetVertices(vertices);
    boat.computeVertexNormalsOfTriangles(vertices, normals);
    boat.SetNormals(normals);
    boat.textureSamplerID = glGetUniformLocation(programID, "myTextureSampler");
    float scaling = 1.0f;
    std::vector< glm::vec2 > uvbufferdata = uvs;
    boat.SetTexture(uvbufferdata, "rawcolor.bmp");
    glGenBuffers(2, vertexbuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer[0]);
    glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(glm::vec3), &vertices[0], GL_STATIC_DRAW);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer[1]);
    glBufferData(GL_ARRAY_BUFFER, normals.size() * sizeof(glm::vec3), &normals[0], GL_STATIC_DRAW);
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 0, 0);

    return true;
}

bool cleanupVertexbuffer()
{
    glDeleteBuffers(2, vertexbuffer);
    glDeleteBuffers(1, &uvbuffer);
    glDeleteProgram(programID);
    glDeleteTextures(1, &Texture);
    glDeleteVertexArrays(1, &VertexArrayID);
    return true;
}

bool closeWindow()
{
    glfwTerminate();
    return true;
}

void loadSTLFile(std::vector< glm::vec3 >& vertices,
                 std::vector< glm::vec3 >& normals,
                 std::string stl_file_name)
{
    stl::stl_data info = stl::parse_stl(stl_file_name);
    std::vector<stl::triangle> triangles = info.triangles;
    for (int i = 0; i < info.triangles.size(); i++) {
        stl::triangle t = info.triangles.at(i);
        glm::vec3 triangleNormal = glm::vec3(t.normal.x, t.normal.y, t.normal.z);
        vertices.push_back(glm::vec3(t.v1.x, t.v1.y, t.v1.z));
        normals.push_back(triangleNormal);
        vertices.push_back(glm::vec3(t.v2.x, t.v2.y, t.v2.z));
        normals.push_back(triangleNormal);
        vertices.push_back(glm::vec3(t.v3.x, t.v3.y, t.v3.z));
        normals.push_back(triangleNormal);
    }
}

