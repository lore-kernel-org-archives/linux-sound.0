From: Gerd Bavendiek <bav@rw.sni.de>
Date: Tue, 19 Jan 1999 08:02:49 +0000
Subject: Re: Crystal CS4235 with 2.2.0-pre7
Message-Id: <marc-linux-sound-91673295019972@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91669060300940@msgid-missing>
In-Reply-To: <marc-linux-sound-91669060300940@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Tony Nugent writes:
 > On Mon Jan 18 1999 at 19:54, Gerd Bavendiek wrote:
 > 
 > > Alan Cox stated a few weeks ago that there is support for the Crystal
 > > soundchip CS4235 in kernel 2.1.132ac1. I have an Acer motherboard with
 > > this chip and so decided to make the latest available kernel
 > > linux-2.2.0-pre7.
 > > 
 > > I found no references to CS4235 and so took the closest config option
 > > CS4232.
 > 
 > I think you need to enable "config experimental drivers" to enable it.
 > 

I tried but nothing visible changed in section "sound" or "low level
drivers" while doing make menuconfig.

 > > Unfortunately
 > > 
 > > cat /usr/lib/xemacs-20.4/etc/sounds/im_so_happy.au > /dev/audio
 > > 
 > > simply gave silence.
 > 
 > What does "cat /dev/sndstat" say?
 > 

Please have a second look on my posting.

Thanks !

Kind regards

Gerd
