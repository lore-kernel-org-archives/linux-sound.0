From: "Bernd Nowak @ Be In Now" <bnowak@gmx.net>
Date: Wed, 14 Jun 2000 11:00:56 +0000
Subject: Terratec EWS 64 And RedHat 6.2
Message-Id: <marc-linux-sound-96098076227047@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello to all. I'm frustated. My EWS64 is working under Win98 but not under
Redhat 6.2. I followed the configuration steps in sbartels document but the
best result is that i can load sam9407 without any control on the volume. If
i try to configure the card basically with sndconfig from redhat 6.2 it
found my card via isapnp tools but thats all. I verified the
/etc/isapnp.conf but i can't find the misstake in it. But there are many
strange entrys in /etc/conf.modules when i try to configure the card with
sndconfig. I'm getting the best result in deleting all sound entrys in
/etc/conf.modules and restart my linux machine. Then did something with the
sam9407 driver, test it under x with x9407, everything OK which means I have
sound but can not control it. Shutdown X run sndconfig hear the first sample
but then sndconfig breaks and thats it.

Bernd Nowak
