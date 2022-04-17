# MEE6 to Cliptok Infraction/Warning migration.

This is a simple script that imports MEE6 warnings/infractions to a Redis host in a format compatible with [Cliptok](https://github.com/Erisa/Cliptok).

The warnings will be added with sequential negative IDs (Most recent being `-1`), to signify that they are "legacy" warnings from a servers old system.

## How to use

To get the warnings from MEE6:  
Note: I have not automated this and I don't have much inclination to give hand-holdy instructions.

1. Login to the MEE6 dashboard
2. Grab your MEE6 API `token` out of the localstorage. **Do not share this token with anyone.**
3. Make a GET request to `https://mee6.xyz/api/plugins/moderator/guilds/1234567890/infractions` where `1234567890` is your server ID.
    - Set the `Authorization` header to your `token`.
4. Save the contents as `page 0.json`
5. Add the query param `?page=1` and keep making requests incrementing that number until you reach the end. Save these as `page 1.json` and so on.
6. Put all the json files in the `input` folder, then set `PAGES` in `.env` to the amount of pages you have. If the last page is 6 for example, set 7.
7. Install any version of Ruby, `gem install bundler`, clone the repo and `bundle install` in it.
8. Set the `REDIS_HOST` and `REDIS_PORT` variables in `.env`
8. Run `source .env` and `bundle exec ruby main.rb`
9. It should have worked.

## Information

```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
```
