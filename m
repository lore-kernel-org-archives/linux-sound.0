From: William Law Kar Wai <willaw79@yahoo.com>
Date: Thu, 10 Dec 1998 05:28:00 +0000
Subject: Re: help needed for cs423x chips
Message-Id: <marc-linux-sound-91334971309315@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91325015828495@msgid-missing>
In-Reply-To: <marc-linux-sound-91325015828495@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
  I once successfully configured the sound for the cs4236 sound chip.
Unfortunately I forgot how to configure it, but here is something that
I might recall. I was using Redhat 5.0. I downloaded OSSfree version
3.8. I first compiled the kernel without the sound support. Then I use
the isapnp tools to configure the pnp card, of course you have to edit
the files and enable certain configurations. After that, I decompress
the ossfree sound driver in the /usr/src/linux directory. Then I
recompile the kernel using the configuration I set in the isapnp.conf.
It once worked, even the MIDI and other stuff worked. But when I
reformatted the hard disk and reinstall everything, is doesn't work at
all. You can also try to download the ALSA sound driver. I heard that
it works. It supports your sound chips. I haven't try it yet, but soon.

Trying my best to help...

William,
Running Redhat 5.1
www.redhat.com




---moc liamtoh <mackilla@hotmail.com> wrote:
>
> alright, i cant get my sound to work. i have an aopen MB with built
on 
> sound and video. sound chip says cs4235 on the chip but isapnp
detects 
> as 4236. i have tried different settings with isapnp and different 
> modules for sound support....i have also tried without modules and
just 
> ocmpiling into kernel...i have tried configuration manager alone and 
> with isapnp and modules...basically i was trying about everything i 
> could think...only problem being that i dont know that much yet and 
> therefore am running out off ideas...plus it is taking time to learn 
> stuff to try different things....not that i mind the knowledge but i 
> would like to get sound working quickly =)
> 
> so if anyone could spare the time to help i would appreciate it. i am 
> fairly knowledgeable with linux, i just mainly need to know what to 
> do...(i guess basically a brief howto sort of answer would be cool, 
> detailing the steps enough that i can understand. eg: say 
> 
> tar xvf blahblahbalh
> 
> not just "decompress with gzip and then use tar on it."
> 
> thanks again.
> 
> Joshua Kukovec
> 
> 
> 
> ______________________________________________________
> Get Your Private, Free Email at http://www.hotmail.com
> 

_________________________________________________________
DO YOU YAHOO!?
Get your free @yahoo.com address at http://mail.yahoo.com
