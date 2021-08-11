From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 11 Aug 2021 13:30:29 +0000
Subject: Re: USB-Audio: Device or resource busy (strace log)
Message-Id: <CAHhAz+gD-UtvXgsWnWx8yPwMbpY4R-ZJqPg9TNNF+iZrmKxQSA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
 <41bebccc-7940-8379-0108-047bd1cc92f9@perex.cz> <CACk2A5ZcrVTv4AVHdmRDh-xWkx=1BHi6SV8yYqX1Z2DzcDR8hA@mail.gmail.com>
In-Reply-To: <CACk2A5ZcrVTv4AVHdmRDh-xWkx=1BHi6SV8yYqX1Z2DzcDR8hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vishnu <vardhanraj4143@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Wed, Aug 11, 2021 at 6:19 PM vishnu <vardhanraj4143@gmail.com> wrote:
>
> can you paste output of
> arecord -l (list of capture devices).
$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: USB [Plantronics .Audio 628 USB], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


> Which device you are using and os.
> Does this instance is already open by default? like any video playing or something like that?
lsof does not catch it.

>
> Yes you can stop pulse audio and try..
>
> On Wed, Aug 11, 2021 at 6:17 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> On 11. 08. 21 14:36, Muni Sekhar wrote:
>> > Hi All,
>> >
>> > $ cat /proc/asound/cards
>> >  0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
>> >                       Plantronics Plantronics .Audio 628 USB at
>> > usb-0000:00:14.0-2, full speed
>> >
>> > I am using a Plantronics USB Audio headset.
>> >
>> > $ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
>> > arecord: main:722: audio open error: Device or resource busy
>> >
>> >
>> > 'arecord' command always fails the first time after system boot in my
>> > system. But subsequent execution of the 'arecord' command runs fine.
>> >
>> >
>> > I've attached the strace log for the "audio open error: Device or
>> > resource busy" failure. Is there any fix available for this issue?
>>
>> You may check which other task blocks the PCM device:
>>
>>   lsof /dev/snd/pcmC0D0c
It does not output any process.
$ lsof /dev/snd/pcmC0D0c

1st run:
----------
$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
arecord: main:722: audio open error: Device or resource busy

2nd run:
----------
$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
^CAborted by signal Interrupt...


>>
>> I guess that it will be pulseaudio (device enumeration).
>>
>>                                         Jaroslav
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.



-- 
Thanks,
Sekhar
