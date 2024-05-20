#ifndef UTILITIES_HPP
#define UTILITIES_HPP
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <vector>

SDL_Surface *load_png(char const *path);
bool checkCollision(std::vector<SDL_Rect>& a, std::vector<SDL_Rect>& b);
bool checkCollision2(std::vector<SDL_Rect>& a, std::vector<SDL_Rect>& b);

enum class Direction
{
    NONE,
    UP,
    DOWN,
    LEFT,
    RIGHT
};

typedef struct
{
    SDL_Rect pos;
    SDL_RendererFlip flip;
    int rotation;
} Param;

typedef struct
{
    SDL_Rect clip;
    std::vector<Param> params;
} Clip;

typedef struct
{
    SDL_Texture *asset;
    std::vector<Clip> clips;
} Tiles;

#endif