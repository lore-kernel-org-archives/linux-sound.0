From: Matthew White <mtw@vne.net>
Date: Tue, 20 Jul 1999 20:09:29 +0000
Subject: MP3s and Dell Latitude CPi D300XT
Message-Id: <marc-linux-sound-93250171720342@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello All-

I'm having a bit of a problem getting my Dell to play MP3 files.
I've tried using both OSS/Free and ALSA drivers with no luck.  With
mpg123 all I get is:

High Performance MPEG 1.0/2.0/2.5 Audio Player for Layer 1, 2 and 3.
Version 0.59q (1999/Jan/26). Written and copyrights by Michael Hipp.
Uses code from various people. See 'README' for more!
THIS SOFTWARE COMES WITH ABSOLUTELY NO WARRANTY! USE AT YOUR OWN RISK!
unsupported playback rate: -1

Directory: ../../
Playing MPEG stream from New Order Blue Monday.mp3 ...
MPEG 1.0, Layer: III, Freq: 44100, mode: Stereo, modext: 0, BPF : 418
Channels: 2, copyright: No, original: Yes, CRC: No, emphasis: 0.
Bitrate: 128 Kbits/s, Extension value: 0
Audio: 1:1 conversion, rate: 44100, encoding: signed 16 bit, channels: 2

notice "unsupported playback rate: -1" at the end of the first block
of text.

If I try to use x11amp, all I get is "decode loop" printed to stderr.

any ideas?

mtw@roo:~ % cat /proc/asound/cards 
0 [card1          ]: CS4236 - CS4237B
                     CS4237B at 0x530, irq 5, dma 1&0



from /etc/conf.modules:

alias char-major-116 snd
options snd snd_major6 snd_cards_limit=1
alias snd-card-0 snd-card-cs4236
options snd-card-cs4236 snd_port=0x530 snd_cport=0x210 \\
  snd_mpu_port=0x220 snd_fm_port=0x388 snd_jport=-1 snd_irq=5 \\
  snd_mpu_irq=7 snd_dma1=1 snd_dma2=0

alias char-major-14 soundcore
alias sound-slot-0 snd-card-0
alias sound-service-0-3 snd-pcm1-oss
alias sound-service-0-12 snd-pcm1-oss

alias char-major-14  sound

mtw@roo:~ % lsmod
Module                  Size  Used by
snd-pcm1-oss           13848   0  (autoclean)
snd-card-cs4236         3908   0 
snd-cs4236              6240   0  [snd-card-cs4236]
snd-cs4231              9996   0  [snd-card-cs4236 snd-cs4236]
snd-mixer              15192   0  [snd-pcm1-oss snd-card-cs4236 snd-cs4236 snd-cs4231]
snd-pcm1               17040   0  [snd-pcm1-oss snd-cs4236 snd-cs4231]
snd-pcm                 9260   0  [snd-pcm1-oss snd-card-cs4236 snd-cs4236 snd-cs4231 snd-pcm1]
snd-mpu401-uart         1560   0  [snd-card-cs4236]
snd-midi               14860   0  [snd-card-cs4236 snd-mpu401-uart]
snd-opl3                1960   0  [snd-card-cs4236]
snd-timer               3340   0  [snd-cs4231 snd-opl3]
snd-synth               1164   0  [snd-card-cs4236 snd-opl3]
snd                    30732   1  [snd-pcm1-oss snd-card-cs4236 snd-cs4231 snd-mixer snd-pcm1 snd-pcm snd-mpu401-uart snd-midi snd-opl3 snd-timer snd-synth]
sound                  57208   0  (unused)
soundlow                 300   0  [sound]
soundcore               2372   7  [snd sound]

mtw@roo:~ % strace mpg123 "New Order Blue Monday.mp3" 
execve("/usr/bin/mpg123", ["mpg123", "New Order Blue Monday.mp3"], [/* 26 vars */]) = 0
brk(0)                                  = 0x8083f90
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
[snip...]
12:02:30.015759 ioctl(17, SNDCTL_DSP_SETFRAGMENT, 0xbffff780) = 0
12:02:30.015911 ioctl(17, SNDCTL_DSP_SETFMT, 0xbffff780) = 0
12:02:30.016052 ioctl(17, SNDCTL_DSP_GETFMTS, 0xbffff780) = 0
12:02:30.016192 ioctl(17, SNDCTL_DSP_STEREO, 0xbffff780) = 0
12:02:30.016330 ioctl(17, SNDCTL_DSP_SPEED, 0xbffff780) = 0
12:02:30.032196 write(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 16384) = 16384
12:02:30.037625 write(17, "\2\0\372\377\377\377\375\377\1\0"..., 16384) = 16384
12:02:30.052929 write(17, "\n\t>\0203\r\317\22\235\r\267\23"..., 16384) = -1 EIO (Input/output error)
12:02:40.058035 write(17, ".\1\333\0\4\1\314\0\344\0\321\0\322"..., 16384) = -1 EIO (Input/output error)
12:02:50.059367 write(17, "\241\377\27\0\246\377\21\0\246\377"..., 16384 <unfinished ...>

any ideas would be appreciated...

-mtw
