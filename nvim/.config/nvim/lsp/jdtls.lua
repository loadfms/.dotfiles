local path = require("utils.path")
local home = os.getenv("HOME")
local lombok_path = home .. "/Downloads/lombok.jar"

return {
    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. lombok_path,
    },
    filetypes = { "java" },
    root_dir = path.find_root({
        "build.gradle", "settings.gradle", "pom.xml", ".git"
    }),
}
