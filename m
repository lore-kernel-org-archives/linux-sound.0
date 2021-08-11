From: Jaroslav Kysela <perex@perex.cz>
Date: Wed, 11 Aug 2021 12:46:20 +0000
Subject: Re: USB-Audio: Device or resource busy (strace log)
Message-Id: <41bebccc-7940-8379-0108-047bd1cc92f9@perex.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
In-Reply-To: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muni Sekhar <munisekharrms@gmail.com>, alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

On 11. 08. 21 14:36, Muni Sekhar wrote:
> Hi All,
> 
> $ cat /proc/asound/cards
>  0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
>                       Plantronics Plantronics .Audio 628 USB at
> usb-0000:00:14.0-2, full speed
> 
> I am using a Plantronics USB Audio headset.
> 
> $ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
> arecord: main:722: audio open error: Device or resource busy
> 
> 
> 'arecord' command always fails the first time after system boot in my
> system. But subsequent execution of the 'arecord' command runs fine.
> 
> 
> I've attached the strace log for the "audio open error: Device or
> resource busy" failure. Is there any fix available for this issue?

You may check which other task blocks the PCM device:

  lsof /dev/snd/pcmC0D0c

I guess that it will be pulseaudio (device enumeration).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
