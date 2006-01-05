From: "Jim Crilly" <jim@why.dont.jablowme.net>
Date: Thu, 05 Jan 2006 21:20:19 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060105212019.GA23780@voodoo>
List-Id: <linux-sound.vger.kernel.org>
References: <20060103231009.GI3831@stusta.de> <Pine.BSO.4.63.0601040048010.29027@rudy.mif.pg.gda.pl> <20060104000344.GJ3831@stusta.de> <Pine.BSO.4.63.0601040113340.29027@rudy.mif.pg.gda.pl> <20060104010123.GK3831@stusta.de> <Pine.BSO.4.63.0601040242190.29027@rudy.mif.pg.gda.pl> <20060104113726.3bd7a649@mango.fruits.de> <s5hsls398uv.wl%tiwai@suse.de> <20060104191750.798af1da@mango.fruits.de> <74F7C515-831F-42E4-9A6F-70A9C11E8BB3@neostrada.pl>
In-Reply-To: <74F7C515-831F-42E4-9A6F-70A9C11E8BB3@neostrada.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcin Dalecki <dalecki.marcin@neostrada.pl>
Cc: Florian Schmidt <tapas@affenbande.org>, Takashi Iwai <tiwai@suse.de>, Adrian Bunk <bunk@stusta.de>, Jesper Juhl <jesper.juhl@gmail.com>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On 01/04/06 08:28:59PM +0100, Marcin Dalecki wrote:
> 
> On 2006-01-04, at 19:17, Florian Schmidt wrote:
> >Maybe create a /proc control, so users can revert
> >to the olde behaviour if there really is any need.
> 
> YES YES! After all who doesn't use his system logged in as root?

You can change the rights and ownership of files in /proc, so distributions
that use something like pam_console could change them when someone logs in.
That and most people know that poking around in /proc generally requires
root priviledges so making them use su or sudo wouldn't be a surprise.

Jim.
