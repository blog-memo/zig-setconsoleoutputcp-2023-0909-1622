const std = @import("std");
const Build = std.build;

pub fn build(b: *Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "main",
        .root_source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
        .target = target,
    });
    exe.addCSourceFiles(&.{
        "src/code.cpp",
    }, &.{
        "-std=c++17",
    });

    exe.addIncludePath(.{ .path = "src" });

    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("c++");
    b.installArtifact(exe);

    const run = b.addRunArtifact(exe);
    run.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run.step);
}
