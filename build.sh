mkdir public 
wget -O aladin.jar https://aladin.cds.unistra.fr/java/Hipsgen.jar
mkdir cache/aladin
mkdir cache/java
java -Xmx6G -Djava.io.tmpdir=/cache/java -jar aladin.jar in="./danielkurtin" out="./public/danielkurtin" maxThread=20 cache="/cache/aladin" cacheRemoveOnExit=false id=HERE/p/danielkurtin color=png mode=overlayFading
java -Xmx6G -jar aladin.jar out="./public/danielkurtin" pixelCut="-8000 16000 sqrt" PNG
java -Xmx6G -jar aladin.jar out="./public/danielkurtin" TRIM
rm aladin.jar
javac GenerateIndexFile.java
java GenerateIndexFile