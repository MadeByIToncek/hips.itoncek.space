mkdir public 
cp hipslist public/hipslist
cp index.html public/index.html
wget -O aladin.jar https://aladin.cds.unistra.fr/java/Hipsgen.jar
java -jar aladin.jar in="./danielkurtin" out="./public/danielkurtin" id=HERE/p/danielkurtin color=png mode=overlayFading
rm aladin.jar