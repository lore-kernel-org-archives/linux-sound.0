From: Stefan Linnemann <mazur@casema.nl>
Date: Thu, 26 Jun 2008 10:03:22 +0000
Subject: Ancient ac97_clock question.
Message-Id: <20080626120322.7096cb9f@53569b7e.cable.casema.nl>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

   Please Cc: me any reply, as I don't subscribe to the mailing list.
    With the (to me) recent update from kernel 2.6.25.4-10.fc8.i686 to
2.6.25.6-27.fc8.i686, my sound suddenly was always too fast.  After research I discovered the intel8x0 (which I have) ac97_clock option, and from my old /var/log/messages I discovered, that before it was always set to a value averaging to 41137.  However, the ALSA-documentation mentions ac97_clock94 explicitly.
   My question is: is 41194 a better value, or should I stick with the calculated average from the measurements from before?  I know it's an inaudible difference, unless I duplicate my machine ans let them play side by side, but I have a need to be precise and accurate.  (Aperger syndrome).

With kind regards,
Stefan.
