From: Tony Nugent <tony@growzone.com.au>
Date: Sat, 30 Oct 1999 03:07:21 +0000
Subject: Re: next to last maestro update? (fwd)
Message-Id: <marc-linux-sound-94125689721967@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94122443129261@msgid-missing>
In-Reply-To: <marc-linux-sound-94122443129261@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri Oct 29 1999 at 11:02, Zach Brown wrote:

> oh my goodness guys, I'm such a dork for not sending this your way...

Gnah!  You sure are!

> ---------- Forwarded message ----------

> From: Zach Brown <zab@redhat.com>
> Subject: next to last maestro update?

> v0.10 of the OSS maestro driver is on http://people.redhat.com/zab/maestro
> 
> it finally fixes the memory scribbling, I hope.  It also has some minor
> fixes that made it work on some laptops.  Please do give this one a spin,
> it should be stable.
> 
> the next hurdle is to fix up the proper LRLR support so that mmap() (read:
> quake) works :)

Quake?  Really?

Oh man, I'm running a box with dual p-iii550/256Mb ram here, with a
banshee card in it (soon to be replaced by a 3500 voodoo3), and a
PCI128 (es1371) sound card.

The quake3 demo runs like total crap on this box, only to discover
that the current demo version doesn't like PCI-based sound cards.
Major bummer :-(

(I've seen the q3 demo scream on a p450 with a 32Mb TNT, but those
boxes had an onboard crystal sound chip.  Very impressive).

Does this mean that a fix is on the way so that I'll finally be able
to have some fun running q3 on this box with the pci sound card?

Cheers
Tony
