#include "libjaltop.hpp"
#include "httplib.h"

#include <string>

int main() {
    using namespace httplib;
    Server server;

    server.Get("/ram/total", [&](const Request&, Response& res) {
        res.set_content(std::to_string(jaltop_ram_total()), "text/plain");
    });

    server.Get("/ram/free", [&](const Request&, Response& res) {
        res.set_content(std::to_string(jaltop_ram_free()), "text/plain");
    });

    server.Get("/ram/usage", [&](const Request&, Response& res) {
        res.set_content(std::to_string(jaltop_ram_usage()), "text/plain");
    });

    server.Get("/cpu/usage", [&](const Request&, Response& res) {
        res.set_content(std::to_string(jaltop_cpu_usage(0)), "text/plain");
    });

    server.Get("/cpu/usage/:interval", [&](const Request& req, Response& res) {
        const auto interval = std::stoi(req.path_params.at("interval"));
        res.set_content(std::to_string(jaltop_cpu_usage(interval)), "text/plain");
    });

    server.listen("0.0.0.0", 6969);
}
