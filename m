From: Bill Nottingham <notting@redhat.com>
Date: Mon, 24 May 1999 02:17:11 +0000
Subject: Re: Can't get AZT1008 sound card to work under RH6.0
Message-Id: <marc-linux-sound-92757627105628@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92729623832366@msgid-missing>
In-Reply-To: <marc-linux-sound-92729623832366@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Cummings, Kevin (kcummings@clariion.com) said: 
> 	The isapnp.conf file looks like (simplified):
> AZT1008 PnP Sound Device
> LD 0	IDE CDROM DISABLED
> 	IO 0 BASE 0x530
> 	IO 1 BASE 0x330
> LD 1	AUDIO
> 	IO 0 BASE 0x220
> (do I want more than 1 IO device here????  IO 1 0x388??  IO 2 0x534 ???)

That's odd - it has settings for 0x530/0x534 in both LD 0 and LD 1 - that
doesn't seem right.

> The sound module (/etc/conf.modules) thinks it is loading an Aztech Sound Galaxy
> driver.  Is this right???? The Aztech source code seems to think so!

That is the Sound Galaxy driver. Unfortunately, I've heard reports of it
not working well with some SG cards - in those cases, no matter what you
do, it seems unable to initialize the WSS compat. on the card; however,
you should be able to at least get it to work in SBPro compatibility mode.

What does your isapnp.conf & conf.modules look like?

Bill
