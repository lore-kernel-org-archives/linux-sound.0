From: David Limon Romero <dlr@bret.com.mx>
Date: Thu, 10 Feb 2000 22:21:45 +0000
Subject: alsa cs4232 ?
Message-Id: <marc-linux-sound-95023680505004@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hello

I'm trying to get running a PCI cs4232 based card with alsa (0.5.2), I've
read that alsa-sound-mini-howto reffers mostly to ISA cards, I know that
PCI cards are supported too, but when I type modprobe snd-card-cs4232 with
all it's options (snd_irq, snd_port, etc.), which port I have to type? in
howto says that I must type 0x534 for snd_port but I get messages saying
that the device was not found, but I think it's for ISA cards... I used
snd-card-cs461x (autoprobing), and it seems to work, but I can't find
/proc/asound/card1/pcm0, /proc/asound/card1 exists... what's wrong? how do
I get it running? (I've RTFM before asking here...)

TIA
David
--
David Lim=F3n Romero       | mailto:dlr@bret.com.mx
Depto. de Comunicaciones | http://linux.bret.com.mx/
Grupo Embotellador BRET  | ICQ#:20804046
Puebla, Pue. M=E9xico      | Beep:800-3332337 Pin 22155794
Tel. 2-2291100 Ext. 2308 | Powered by Linux!
--------------------------------------------------------
Help Linux grow, we need drivers:
                   http://www.libranet.com/petition.html
