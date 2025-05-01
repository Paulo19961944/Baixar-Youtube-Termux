#!/data/data/com.termux/files/usr/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# ASCII de topo
echo -e "${CYAN}"
echo "====================================="
echo "    ███ YouTube Downloader ███       "
echo "====================================="
echo -e "${NC}"

# Pede link
echo -e "${GREEN}Digite o link do vídeo do YouTube:${NC}"
read LINK

# Escolha de formato
echo -e "${CYAN}Você quer baixar como MP3 ou MP4?${NC}"
select FORMAT in "MP3 (Áudio)" "MP4 (Vídeo)"; do
    case $FORMAT in
        "MP3 (Áudio)")
            yt-dlp -x --audio-format mp3 "$LINK"
            FILE=$(yt-dlp --get-filename -x --audio-format mp3 "$LINK")
            break
            ;;
        "MP4 (Vídeo)")
            yt-dlp -f "bv*+ba/b" --merge-output-format mp4 "$LINK"
            FILE=$(yt-dlp --get-filename -f "bv*+ba/b" --merge-output-format mp4 "$LINK")
            break
            ;;
        *) echo -e "${RED}Opção inválida.${NC}";;
    esac
done

# Move para /sdcard/Download/
mv "$FILE" /sdcard/Download/

echo -e "${GREEN}Arquivo salvo em: /sdcard/Download/${NC}"
echo

# Deseja abrir?
echo -e "${CYAN}Deseja abrir a pasta onde o arquivo foi salvo? (s/n)${NC}"
read OPEN

if [[ "$OPEN" == "s" || "$OPEN" == "S" ]]; then
    am start -a android.intent.action.VIEW -d file:///sdcard/Download/
    echo -e "${GREEN}Abrindo gerenciador de arquivos...${NC}"
else
    echo -e "${CYAN}Feito! Use seu gerenciador de arquivos para acessar /sdcard/Download.${NC}"
fi
