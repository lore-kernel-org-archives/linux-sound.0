From: "Dr. Michael Weller" <eowmob@exp-math.uni-essen.de>
Date: Fri, 09 Jun 2000 12:38:00 +0000
Subject: Re: ESS Maestro 3i support status
Message-Id: <marc-linux-sound-96055432325793@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96055090722587@msgid-missing>
In-Reply-To: <marc-linux-sound-96055090722587@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I just learned about the OSS maestro driver. It does, however, only
support Maestro 1, 2 and 2e. I hacked the the module to accept the Maestro
3i as one of those and the module installed but produced many Cannot
select APU register warnings. I could change mixer setting (even got
crackles while adjusting it), but it did not produce any sound.

Any comments are appreciated, thank you in advance,
Michael.

--

Michael Weller: eowmob@exp-math.uni-essen.de, eowmob@ms.exp-math.uni-essen.de,
or even mat42b@spi.power.uni-essen.de. If you encounter an eowmob account on
any machine in the net, it's very likely it's me.
