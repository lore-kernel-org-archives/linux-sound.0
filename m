From: Adam Wiggins <adam@angel.com>
Date: Fri, 11 Sep 1998 18:59:04 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90554118024934@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 11 Sep 1998, Hamish Moffatt wrote:
> What's wrong with isapnptools? Works fine for me. Setting up /etc/isapnp.conf
> is a bit harder than letting Windows do it for you, but Linux is general
> requires more intelligence than 95/98 at present. As a result, you get
> more flexibility; isapnp doesn't care where you stick your hardware, while 
> Windows will do everything it can to stop you manually allocating machine
> resources.
> 
> To me, Linux uses isapnp just like software setup of ethernet cards; it lets
> me pick where to put hardware without changing jumpers, rather than allocating
> it where it THINKS it fits.

I agree pnpdump/isapnp is a snap to use once you get used to it, but it's
pretty difficult at the start when you just want to get your sound card
working.

At the moment I think a little shell script which worked like xf86config
or even the kernel "make config" would be a big improvement.  Ie, it just
seds the pnpdump file and gives you options:

% pnpsetup
Detected: "Creative Labs PnP Sound Chip"
Use this device? (y/n) y
What IO base? (220, 240, 260, 280, 2A0, 300) 280
What IRQ? (5, 7, 9, 10, 11) 10

Etc.  With a little bit of smarts it could keep track of which irqs were
already in use (and check /proc/pci to not overlap with non-isa pnp
stuff) and warn of conflicts.  This would be highly useful to a person who
is perfectly familiar with setting up their sound blaster to run DOS games
- a "computer person" without being a unix wizard, who is probably Linux's
biggest potential target audience right now.

I'd do it myself if I could program shell scripts worth a damn.  Or does
something like this already exist?
