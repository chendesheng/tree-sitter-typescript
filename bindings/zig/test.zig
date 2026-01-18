const testing = @import("std").testing;
const ts = @import("tree-sitter");
const root = @import("tree-sitter-typescript");

test "can load typescript grammar" {
    const Parser = ts.Parser;

    const parser = Parser.create();
    defer parser.destroy();

    const lang: *const ts.Language = @ptrCast(root.languageTs());
    defer lang.destroy();

    try testing.expectEqual(void{}, parser.setLanguage(lang));
    try testing.expectEqual(lang, parser.getLanguage());
}

test "can load tsx grammar" {
    const Parser = ts.Parser;

    const parser = Parser.create();
    defer parser.destroy();

    const lang: *const ts.Language = @ptrCast(root.languageTsx());
    defer lang.destroy();

    try testing.expectEqual(void{}, parser.setLanguage(lang));
    try testing.expectEqual(lang, parser.getLanguage());
}
