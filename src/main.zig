const std = @import("std");
const c = @cImport({
    @cInclude("code.h");
});

pub fn main() void {
    c.calling_c_from_zig();
    std.log.info("Zig の道へようこそ。\n道案内はこちらからどうぞ：\nhttps://ziglang.org/ja/\n", .{});
    std.log.info("漢字(韓国語)=한자\n漢字(アラビア語)=كانجي\n", .{});
}
