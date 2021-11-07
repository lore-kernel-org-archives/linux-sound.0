From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 07 Nov 2021 16:08:42 +0000
Subject: Re: [Bug][5.16-rc0] Between commits dcd68326d29b and 7ddb58cb0eca, was broken play sound via the Dis
Message-Id: <s5h1r3sdk39.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsP-JJAUh-SV0u1ALu5+awxcWT3BsQ=FzKrqb+9HOk2EUA@mail.gmail.com>
In-Reply-To: <CABXGCsP-JJAUh-SV0u1ALu5+awxcWT3BsQ=FzKrqb+9HOk2EUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: alsa-devel@alsa-project.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Sun, 07 Nov 2021 14:27:33 +0100,
Mikhail Gavrilov wrote:
> 
> Hi!
> Between commits dcd68326d29b and 7ddb58cb0eca, was broken play sound
> via the DisplayPort and HDMI.
> When selected DisplayPort or HDMI in a gnome control center instead of
> sound in speakers in the kernel log pops errors:
(snip)

Yes, it's a known regression and already the problematic commit
(2d9ea39917a4) was reverted in sound git tree for the next PR.


thanks,

Takashi
