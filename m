From: zewei chen <zchen@research.att.com>
Date: Tue, 08 Sep 1998 15:48:05 +0000
Subject: Re: Yamaha opl3
Message-Id: <marc-linux-sound-90528344324658@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90522162401464@msgid-missing>
In-Reply-To: <marc-linux-sound-90522162401464@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm not sure this helps, but I had the same problem a while ago.
Not quite resolved, yet.  Here's my experience (in the hopes of
helping Catalin gather some data, and soliciting some insight
for my own situation) -

pnpdump detected nothing.  may I assume the card is not plug-n-play?

I created a file /etc/conf.modules, following some instructions
from one of the FAQ/HOW-TOs, with these lines (parameters
copied from Win95 - yes the card works there):

alias sound sb
options -k sb io=0x220 irq=5 dma=0,5
alias midi opl3
options -k opl3 io=0x388

loaded the sound module by hand, now lsmod shows:

# lsmod
Module         Pages    Used by
3c589_cs           2            1
ds                 2    [3c589_cs]      3
i82365             4            2
pcmcia_core        8    [3c589_cs ds i82365]    4
opl3               3            0
sb                 6            0
uart401            2    [sb]    0
sound             16    [opl3 sb uart401]       0

I was able to play some mpeg sound files, though the sound
was terrible.  When I tried to play some sound files in another
format using our own software, I get "can't open wave dev, -1"
as an error message.  doing an strace on it shows:

open("/dev/dsp", O_WRONLY)              = 3
ioctl(3, SOUND_PCM_WRITE_CHANNELS, 0xbfffd3e0) = 0
ioctl(3, SNDCTL_DSP_SETFMT, 0xbfffd3dc) = 0
write(2, "cant open wave dev, err -1\n", 27cant open wave dev, err -1
) = 27

Well, it seems that one of the ioctl syscall did not get the right value back.
perhaps I'm missing some sound drivers?

Would appreciate some insight.

Zewei

Catalin Marinescu wrote:

>     Hi all !
>     I have a sound card Yamaha opl3 and I can't make it work on my linux
> system.
>     If anyone knows how can I fix this please help me.
> Thanks.
