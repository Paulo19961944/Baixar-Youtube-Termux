# 🎧 YouTube Downloader para Termux (MP3/MP4)

Script interativo em **Bash**, com interface estilizada em **ASCII colorido**, que permite baixar vídeos do YouTube como **áudio (MP3)** ou **vídeo (MP4)** diretamente pelo **Termux** no Android.

---

## 🚀 Funcionalidades

- Baixa vídeos do YouTube em **MP3 (áudio)** ou **MP4 (vídeo)**
- Interface com **cores e menus interativos**
- Move o arquivo automaticamente para **/sdcard/Download/**
- Pergunta se você deseja **abrir a pasta de destino**
- Suporte a **áudio com `ffmpeg`** e **visualização com `mpv`**
- 100% gratuito e local

---

## 📦 Requisitos

Antes de rodar o script, execute os comandos abaixo no Termux:

```bash
pkg update && pkg upgrade -y
pkg install python ffmpeg mpv termux-api -y
pip install yt-dlp
termux-setup-storage
```

## 💾 Instalação
Clone o repositório:

```bash
git clone https://github.com/Paulo19961944/Baixar-Youtube-Termux.git
cd Baixar-Youtube-Termux
```

### Dê permissão de execução:

```bash
chmod +x baixar_youtube.sh
```

## ▶️ Uso
Execute o script:

```bash
./baixar_youtube.sh
```

## O que vai acontecer:

**1. Você verá um menu com arte ASCII colorida.** <br></br>
**2.Será solicitado o link do vídeo do YouTube.** <br></br>
**3.Escolha o formato desejado: MP3 ou MP4.** <br></br>
**4.O download será iniciado.** <br></br>
**5.O arquivo será movido automaticamente para a pasta /sdcard/Download/.** <br></br>
**6.Será perguntado se deseja abrir a pasta.**


## 📁 Onde ficam os arquivos?
Todos os arquivos baixados são salvos em:

```bash
/sdcard/Download/
```

**Você pode acessar essa pasta pelo gerenciador de arquivos do Android.**

## 🛠️ Autor
Criado por [Paulo Henrique Azevedo do Nascimento]

## 🧪 Licença
MIT License – livre para uso, modificação e distribuição.


