From: fe88 <fe88@dial.pipex.com>
Date: Sat, 15 May 1999 09:39:40 +0000
Subject: AWE64 Gold
Message-Id: <marc-linux-sound-92679833902066@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi Folks

Help, AAARRRRRRRRRGhhhhhhhhhhhh !

I've done a seriously large amount of RTFM of numerous FAQ's, HOWTO's and 
other documentation that are sound related out on the Web and in the kernel 
source tree and getting this blighter to work is still proving elusive. I even 
went through a proof reading exercise this week on the ALSA-sound-mini-HOWTO 
to help me understand this more. 99% of the documentation is excellent, some 
that I have come across could be taken as being contradictory and more than a 
little confusing unfortunately.

Before I go ahead and post the contents of the usual suspects, dmesg, cat 
/dev/sndstat, /etc/isapnp.conf, etc/conf.modules, cat /proc/ioports, procinfo 
and the sound section from the kernel configure file etcetera for your 
amusement I have a couple of simple requests:

If there is anyone on this listing who has succeeded in getting the AWE64 to 
work please could they share copies of their /etc/isapnp.conf, 
/etc/conf.modules and the sound section from the kernel configure file with 
us. Does some of the #define #undef of awe_configure.h in the kernel source 
need some editing ? To my eye there seems to be a couple of #define that 
should be included there which I have tried but to no avail though.

My feeling is that once I have sight of genuine working versions of these 
three main items I will be able to edit my own versions appropriately and if 
needed do another kernel recompile...

Currently running RH6. 2.2.9 kernel with SMP. 

Hoping someone can cure this growing feeling of frustration.

Cheers





-- 
Steve Crowder clerk.kant@dial.pipex.com
