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

# Verifica acesso ao armazenamento
termux-setup-storage

# Pede link
echo -e "${GREEN}Digite o link do vídeo do YouTube:${NC}"
read LINK

# Escolha de formato
echo -e "${CYAN}Você quer baixar como MP3 ou MP4?${NC}"
select FORMAT in "MP3 (Áudio)" "MP4 (Vídeo)"; do
    case $FORMAT in
        "MP3 (Áudio)")
            yt-dlp -x --audio-format mp3 "$LINK"
            FILE=$(ls -t *.mp3 | head -n 1)
            break
            ;;
        "MP4 (Vídeo)")
            yt-dlp -f "bv*+ba/b" --merge-output-format mp4 "$LINK"
            FILE=$(ls -t *.mp4 | head -n 1)
            break
            ;;
        *) echo -e "${RED}Opção inválida. Tente novamente.${NC}";;
    esac
done

# Confirma o nome do arquivo detectado
echo -e "${CYAN}Arquivo detectado: $FILE${NC}"

# Move para /sdcard/Download/
mv "$FILE" /sdcard/Download/
echo -e "${GREEN}Arquivo movido para: /sdcard/Download/${NC}"

# Deseja abrir o gerenciador de arquivos?
echo -e "${CYAN}Deseja abrir a pasta onde o arquivo foi salvo? (s/n)${NC}"
read OPEN

if [[ "$OPEN" == "s" || "$OPEN" == "S" ]]; then
    am start -a android.intent.action.VIEW -d file:///sdcard/Download/
    echo -e "${GREEN}Abrindo gerenciador de arquivos...${NC}"
else
    echo -e "${CYAN}Tudo certo! Você pode abrir /sdcard/Download pelo seu gerenciador de arquivos.${NC}"
fi
