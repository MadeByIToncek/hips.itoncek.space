mkdir public 
wget -O aladin.jar https://aladin.cds.unistra.fr/java/Hipsgen.jar
mkdir cache
mkdir cache/aladin
mkdir cache/java
java -Xmx6G -Djava.io.tmpdir=./cache/java -jar aladin.jar in="./danielkurtin" out="./public/danielkurtin" maxThread=20 cache="./cache/aladin" cacheRemoveOnExit=false order=6 id=HERE/p/danielkurtin color=png mode=overlayFading
java -Xmx6G -Djava.io.tmpdir=./cache/java -jar aladin.jar out="./public/danielkurtin" pixelCut="-8000 16000 sqrt" cache="./cache/aladin" cacheRemoveOnExit=false PNG
java -Xmx6G -Djava.io.tmpdir=./cache/java -jar aladin.jar out="./public/danielkurtin" cache="./cache/aladin" cacheRemoveOnExit=false TRIM
rm aladin.jar
wget -O GenerateIndexFile.java https://github.com/MadeByIToncek/hipstools/raw/master/src/GenerateIndexFile.java
javac GenerateIndexFile.java
java GenerateIndexFile
rm GenerateIndexFile.java
rm GenerateIndexFile.class
ls -la