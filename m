From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 11 Aug 2021 12:46:18 +0000
Subject: USB-Audio: Device or resource busy
Message-Id: <CAHhAz+iRiLjG+=xMDoZiqZzqn9fO1ZHk4ZtawCkWZ-TyH8forA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

Hi All,

$ cat /proc/asound/cards
 0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
                      Plantronics Plantronics .Audio 628 USB at
usb-0000:00:14.0-2, full speed

I am using a Plantronics USB Audio headset.

$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
arecord: main:722: audio open error: Device or resource busy


'arecord' command always fails the first time after system boot in my
system. But subsequent execution of the 'arecord' command runs fine.


I've attached the strace log for the "audio open error: Device or
resource busy" failure. Is there any fix available for this issue?


-- 
Thanks,
Sekhar
