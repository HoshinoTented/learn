package org.hoshino9.antlr;

@SuppressWarnings("SpellCheckingInspection")
public class Generate {
    public static void main(String[] args) {
        org.antlr.v4.Tool.main(
                new String[]{
                        "./src/grammar/Hoshino.g4",
                        "-package", "org.hoshino9.antlr",
                        "-o", "src/main/gen/org/hoshino9/antlr"
                });
    }
}
