#include "libjaltop.hpp"
#include "httplib.h"

#include <string>

int main() {
    using namespace httplib;
    Server server;

    server.Get("/ram/total", [&](const Request&, Response& res) {
        res.set_content(std::to_string(jaltop_ram_total()), "text/plain");
    });

    server.listen("0.0.0.0", 6969);
}
