From: Bill Nottingham <notting@redhat.com>
Date: Fri, 09 Jun 2000 14:39:05 +0000
Subject: Re: ESS Maestro 3i support status
Message-Id: <marc-linux-sound-96056594008423@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96055090722587@msgid-missing>
In-Reply-To: <marc-linux-sound-96055090722587@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dr. Michael Weller (eowmob@exp-math.uni-essen.de) said: 
> I just learned about the OSS maestro driver. It does, however, only
> support Maestro 1, 2 and 2e. I hacked the the module to accept the Maestro
> 3i as one of those and the module installed but produced many Cannot
> select APU register warnings. I could change mixer setting (even got
> crackles while adjusting it), but it did not produce any sound.

That won't work; the chips are sufficiently different that you
can't program them in the same way. You can either initialize
it in DOS and then warm boot to linux and use the SB compatiblity,
or wait for the specs on how to program the ASSP to appear from
ESS.

Bill
