From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 08 Jun 2021 10:51:01 +0000
Subject: USB sound card issues
Message-Id: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi all,

I am using a USB sound card(snd-usb-audio), and it fails while doing
the audio recording "arecord: pcm_read:2032: read error: Input/output
error".

What could be the problem? and is there a workaround for this?

$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


$ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
arecord: pcm_read:2032: read error: Input/output error

-- 
Thanks,
Sekhar
