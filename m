From: Dan Lasley <Dan_Lasley@hilton.com>
Date: Mon, 17 Jul 2000 14:32:22 +0000
Subject: Ensoniq AudioPCI problem solved
Message-Id: <marc-linux-sound-96384437322596@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In a recent posting, I asked if anyone knew why Red Hat 6.0 couldn't
see and configure my Ensoniq AudioPCI sound card.  A number of
respondents suggested I load the ALSA sound drivers
(http://www.alsa-project.org/).

I thanked everyone who responded (except jay@toltec.metran.cx, who I
could not reach via e-mail).

The ALSA code worked, but eLinux.com, the vendor who sold the AudioPCI
card, had a better solution:

   "It is supported automatically under redhat 6.2 but under 6.0 you're
   probably going to have to recompile your kernel and enable its support
   as a module under sound support. Redhat 5.2 and 6.0 didn't have the
   sound autodetected too well although 6.2 is just fine for the most part."

The RH 6.0 information in the first sentence is incorrect; I'd already
tried that.

I guessed that a newer kernel (rather than a Red Hat 6.2 component
such as "sndconfig") would fix the problem, so I loaded the 2.2.16
kernel and configured sound as:

   <M> Sound card support
   <M> Creative Ensoniq AudioPCI 97 (ES1371)

Now the Ensoniq AudioPCI works with standard Linux components,
including the X Windows mixer.

Dan
