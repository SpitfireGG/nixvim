{
    plugins.mini = {
        enable = true;
        modules = {
            indentscope = {
                event = [ "BufReadPre" "BufNewFile" ];
                opts = {
                    draw = {
                    delay = 100;
                };
                    mappings = {
                        object_scope = "ii";
                        object_scope_with_border = "ai";

                        goto_top = "[i";
                        goto_bottom = "]i";
                    };
                    symbol = "▏"; 
                    options = {
                        border = "both";
                        indent_at_cursor = true;
                        indent_at_scope = false;
                        try_as_border = false;
                    };
                };
            };
        };
    };
}
