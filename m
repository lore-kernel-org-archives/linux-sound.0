From: Bill Nottingham <notting@redhat.com>
Date: Mon, 07 Feb 2000 15:49:20 +0000
Subject: Re: PnP support
Message-Id: <marc-linux-sound-94993895422600@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94986272808065@msgid-missing>
In-Reply-To: <marc-linux-sound-94986272808065@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Alessandro Zummo (azummo@ita.flashnet.it) said: 
>  I started adding PnP support for Soundblaster compatible
>  soundcards.. i.e. the cards that works with the sb driver.
> 
>  Latest additions include CMI8330 and SoundBlaster AWE64 PnP.

There's already some ISAPnP support in the 2.3.x kernels
(for the SB driver, other drivers will probably be added
soon if not already...); you'll want to look there to
make sure you're not duplicating too much effort.

Bill
