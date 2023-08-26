mkdir public 
wget -O aladin.jar https://aladin.cds.unistra.fr/java/Hipsgen.jar
mkdir cache
mkdir cache/aladin
mkdir cache/java
java -Xmx6G -Djava.io.tmpdir=/cache/java -jar aladin.jar in="./danielkurtin" out="./public/danielkurtin" maxThread=20 cache="/cache/aladin" cacheRemoveOnExit=false order=7 id=HERE/p/danielkurtin color=jpeg mode=overlayFading
java -Xmx6G -jar aladin.jar out="./public/danielkurtin" pixelCut="-8000 16000 sqrt" JPEG
java -Xmx6G -jar aladin.jar out="./public/danielkurtin" TRIM
rm aladin.jar
wget -O GenerateIndexFile.java https://github.com/MadeByIToncek/hipstools/raw/master/src/GenerateIndexFile.java
javac GenerateIndexFile.java
java GenerateIndexFile
rm GenerateIndexFile.java
rm GenerateIndexFile.class