import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Main {
    public static void main(String[] args) throws IOException {
        File file = new File("./public");

        if(!file.exists()) {
            System.out.println("./public is nonexistent!");
            System.exit(404);
        };
        List<File> dirs = new ArrayList<>();
        for (File f : Objects.requireNonNull(file.listFiles())) {
            if(f.isDirectory()){
                dirs.add(f);
            }
        }

        File file1 = new File("./public/index.html");
        File file2 = new File("./public/hipslist");
        if(file1.exists()) file1.delete();
        if(file2.exists()) file2.delete();

        file1.createNewFile();
        file2.createNewFile();

        try (FileWriter indexWriter = new FileWriter(file1)) {
            try (FileWriter hipsWriter = new FileWriter(file2)) {
                indexWriter.write("""
                        <head>
                            <title>HiPS.itoncek.space</title>
                        </head>
                        <body>
                            <h1>HiPS.itoncek.space</h1><br>
                            <h3>You can find more info at <a href="https://aladin.cds.unistra.fr/hips/">Aladin</a> site""");
                for (File dir : dirs) {
                    indexWriter.write(String.format("    <a href=\"%s\">%s</a> <br>\n", "./" + dir.getName() + "/", "/" + dir.getName()));
                    hipsWriter.write(String.format("hips_service_url = %s\n", "./" + dir.getName()));
                    hipsWriter.write(String.format("hips_release_date = %s\n", Instant.now().toString()));
                    hipsWriter.write("hips_status = public mirror clonableOnce\n");
                }
                indexWriter.write("</body>");
            }
        }
    }
}