use zed_extension_api as zed;

struct P4LangExtension {}

impl zed::Extension for P4LangExtension {
    fn new() -> Self {
        P4LangExtension {}
    }
}

zed::register_extension!(P4LangExtension);
