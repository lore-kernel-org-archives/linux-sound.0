From: Brendon Baumgartner <brendon@pangeaconsulting.com>
Date: Mon, 07 Jun 1999 01:33:16 +0000
Subject: Alsa and sb16 not working ...
Message-Id: <marc-linux-sound-92871855623823@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Here is the error ...

viper:~# /etc/init.d/alsa start
Starting sound driver: snd-sb16 /lib/modules/2.2.9/sound/isapnp.o:
init_module: Device or resource busy
snd-sb-dsp: No such file or directory
failed.
viper:~# 

The file /lib/modules/2.2.9/sound/isapnp.o exists. I compiled the kernel
with module sound support and thats all. No card or anything selected. I
also compiled and isntalled the alsa modules. I ran the debian alsaconfig
which autodetected the soundcard. I then give it some settings (which I
tried many different ones). Thats all, it won't work ... I'm not even sure
where to look next. Anyone have a good idea?

Brendon
