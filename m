From: "Dr. Michael Weller" <eowmob@exp-math.uni-essen.de>
Date: Tue, 13 Jun 2000 09:18:38 +0000
Subject: Re: ESS Maestro 3i support status
Message-Id: <marc-linux-sound-96088792806349@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96055090722587@msgid-missing>
In-Reply-To: <marc-linux-sound-96055090722587@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 9 Jun 2000, Bill Nottingham wrote:

> Dr. Michael Weller (eowmob@exp-math.uni-essen.de) said: 
> > I just learned about the OSS maestro driver. It does, however, only
> > support Maestro 1, 2 and 2e. I hacked the the module to accept the Maestro
[...]
> That won't work; the chips are sufficiently different that you
> can't program them in the same way. You can either initialize
> it in DOS and then warm boot to linux and use the SB compatiblity,
> or wait for the specs on how to program the ASSP to appear from
> ESS.

Aha, so even for SB compatiblity, I need a dos driver to program the card
first?

Michael.

--

Michael Weller: eowmob@exp-math.uni-essen.de, eowmob@ms.exp-math.uni-essen.de,
or even mat42b@spi.power.uni-essen.de. If you encounter an eowmob account on
any machine in the net, it's very likely it's me.
