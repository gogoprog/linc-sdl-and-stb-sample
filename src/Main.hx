import sdl.SDL;
import sdl.Window;
import sdl.Renderer;

class Main {

    static var state : { window:Window, renderer:Renderer };
    static var texture:sdl.Texture;
    static function main()
    {
        SDL.init(SDL_INIT_VIDEO | SDL_INIT_EVENTS);
        state = SDL.createWindowAndRenderer(640, 480, NONE);

        var image = stb.Image.load("data/sdl-logo.png", 4);

        var surface = SDL.createRGBSurfaceFrom(
            image.bytes,
            image.w,
            image.h,
            32,
            image.w * 4,
            0x000000ff,
            0x0000ff00,
            0x00ff0000,
            0xff000000
            );

        texture = SDL.createTextureFromSurface(state.renderer, surface);

        SDL.setRenderDrawBlendMode(state.renderer, SDL_BLENDMODE_BLEND);
        SDL.setTextureBlendMode(texture, SDL_BLENDMODE_BLEND);

        while(update())
        {
            SDL.delay(4);
        }

        SDL.destroyTexture(texture);
        SDL.freeSurface(surface);
        SDL.destroyRenderer(state.renderer);
        SDL.destroyWindow(state.window);
    }

    static function update()
    {
        while(SDL.hasAnEvent())
        {
            var e = SDL.pollEvent();

            switch(e.type)
            {
                case SDL_QUIT:
                    return false;
                case SDL_KEYDOWN:
                    if(e.key.keysym.scancode == 41)
                    {
                        return false;
                    }
                default:
            }
        }

        SDL.setRenderDrawColor(state.renderer, 128, 128, 128, 255);
        SDL.renderClear(state.renderer);
        SDL.renderCopy(state.renderer, texture, null, null);
        SDL.renderPresent(state.renderer);

        return true;
    }
}
