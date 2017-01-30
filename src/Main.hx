import sdl.SDL;
import sdl.Window;
import sdl.Renderer;

class Main {

    static var state : { window:Window, renderer:Renderer };

    static function main()
    {

        SDL.init(SDL_INIT_VIDEO | SDL_INIT_EVENTS);
        state = SDL.createWindowAndRenderer(320, 320, SDL_WINDOW_RESIZABLE);

        while(update())
        {
            SDL.delay(4);
        }
    }

    static function update()
    {
        while(SDL.hasAnEvent())
        {
            var e = SDL.pollEvent();
            if(e.type == SDL_QUIT) return false;

            SDL.setRenderDrawColor(state.renderer, 255,255,255,255);
            SDL.renderClear(state.renderer);
            SDL.renderPresent(state.renderer);
        }

        return true;
    }
}
