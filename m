From: "17.hzV.tRL.478" <opt@web.fm>
Date: Tue, 08 Jun 1999 16:21:07 +0000
Subject: pcmcia & streaming audio
Message-Id: <marc-linux-sound-92885934411488@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

helo

my problem:
i m using a realtime sound-synthesis engine ('pd') on three different
machines. 2 of them are desktop pc's, one is a laptop.
among those i  stream uncompressed audio data
(pcm) from one one machine to the other over tcp/ip within the environment
of pd.
this works fine with two pc's but i get periodic bursts and lots of
collisions on the e.net as soon as i activate either streaming to or from
the laptop.
i dont think its a problem of overall bandwidth.
rather i suspect, its got something to do with the pcmcia based network
setup on the laptop machine? (old drivers, some wrong  buffersizes)
its running redhat 5.1.

thks for any hints.
.so

--
bzorstogipptude
