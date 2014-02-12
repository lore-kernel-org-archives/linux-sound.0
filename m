From: Evgeny Sagatov <sagatov@ya.ru>
Date: Wed, 12 Feb 2014 20:01:11 +0000
Subject: Re: Sound issue with stk1160 driver
Message-Id: <37561392235271@web25g.yandex.ru>
List-Id: <linux-sound.vger.kernel.org>
References: <6561391433979@web15h.yandex.ru>
In-Reply-To: <6561391433979@web15h.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

The stk1160 driver has a problem with AC97 codec.
Look at this picture http://sagatov.net/temp/sound-wave.png
In the picture only the right audio channel connected. But for a fraction o=
f a second channels are swapped.
Please tell any ideas why this might happen?

This driver source code, which is responsible for the sound. It is short. M=
ay be specified any invalid parameter? http://lxr.free-electrons.com/source=
/drivers/media/usb/stk1160/stk1160-ac97.c
Please help those who are understands the AC97 codec programming.

Data is not lost. But the audio channels are reversed.

03.02.2014, 17:26, "Evgeny Sagatov" <sagatov@ya.ru>:
> Dear Sirs,
>
> I have EasyCAP device with STK1160+GM7113C+ALC101 chips.
> On my Ubuntu 12.04 with 3.11.0 kernel video capturing functioned perfectl=
y, but audio capturing have problem with sound clicks.
> You can hear these sounds in the linked audio file (Initially both audio =
inputs enabled and then I mute one, then both audio inputs.).
> http://sagatov.net/temp/audio.wav
> Clearly audible clicks in the headphones. A feeling that for a moment lef=
t and right channels are swapped.
> I tested three devices on three computers. I also tested the device on a =
freshly installed Ubuntu 13.10. But the result is the same everywhere.
> In MS Windows no clicks.
>
> I have tried to boot my Ubuntu 12.04 with the 3.2.0-58 kernel.
> Turned out that the legacy driver is already installed. Probably it is in=
cluded in Ubuntu distribution.
> I have a beautiful sound in this case without any problems.
> But I have a problem with the video :-) The video is displayed few second=
s, and then the gray bars (see picture in the attachment).
>
>> =9A=9AWhat kind of video/audio source are you using to trigger this nois=
e?
>> =9A=9ADo you get the noise on all captures or only on some of them?
>
> I tried two different cameras and video player. Also I tried to leave inp=
uts unconnected.
> Noise is always, regardless of the source.
>
> Noise is better heard when only one audio channel is connected. A feeling=
 that for a split second sound goes to another channel and back.
>
> Earlier I have the correspondence with the developer of stk1160 driver an=
d that the information he sent to me.
>
> 03.02.2014, 16:37, "Ezequiel Garcia" <elezegarcia@gmail.com>:
>
>> =9A=9AHi,
>>
>> =9A=9AYesterday I spent all the day debugging this issue. The noise you =
report
>> =9A=9Ais also present on any capture I do. In fact, I noticed it in the =
past but never
>> =9A=9Acared.
>>
>> =9A=9ABad news are I still don't have a clue about it.
>>
>> =9A=9ALet me explain you the differences between stk1160 and easycap aud=
io.
>> =9A=9Astk1160 depends on a separate ac97-mixer driver to setup the AC97
>> =9A=9Aparameters and on the snd-usb-audio driver to handle the audio str=
eam.
>>
>> =9A=9Aeasycap does both things by itself.
>>
>> =9A=9ASince I'm out of specific ideas, I'll try to implement the audio
>> =9A=9Ahandling in stk1160 (just as easycap does) and see what happens.
>> =9A=9AHowever, it's not a simple task and it might take a few days/weeks.
>>
>> =9A=9AFor now, you can use the easycap setting easycap_bars =3D 0 parame=
ter
>> =9A=9Ato avoid those bars. I'm sorry for this regression!
>>
>> =9A=9AIn addition, you can help by taking care of the bug report. This s=
hould
>> =9A=9Abe reported to the linux-sound mailing list:
>> =9A=9Ahttp://vger.kernel.org/vger-lists.html#linux-sound
>>
>> =9A=9AThe problem must be either in snd-usb-audio or in the sound/pci/ac=
97/..
>> =9A=9Acode. If you can report this (put me on Cc), it would be of great =
help.
>>
>> =9A=9AThanks again and sorry for this inconvenience,
>> =9A=9AEzequiel
>
> I hope very much for your help in solving this problem.
>
> Thank you!
