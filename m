From: Jaroslav Kysela <perex@suse.cz>
Date: Wed, 04 Jan 2006 11:16:18 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.LNX.4.61.0601041214050.9321@tm8103.perex-int.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031347.19328.s0348365@sms.ed.ac.uk>
 <200601031452.10855.ak@suse.de> <mailman.1136300646.6679.linux-kernel2news@redhat.com>
 <20060104031300.270541d9.zaitcev@redhat.com>
In-Reply-To: <20060104031300.270541d9.zaitcev@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pete Zaitcev <zaitcev@redhat.com>
Cc: Alistair John Strachan <s0348365@sms.ed.ac.uk>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

On Wed, 4 Jan 2006, Pete Zaitcev wrote:

> On Tue, 3 Jan 2006 14:01:40 +0000, Alistair John Strachan <s0348365@sms.ed.ac.uk> wrote:
> 
> > Is multiple-source mixing really a "high end" requirement? When I last 
> > checked, the OSS driver didn't support multiple applications claiming it at 
> > once, thus requiring you to use "more bloat" like esound, arts, or some other 
> > crap to access your soundcard more than once at any given time.
> 
> If ALSA's OSS emulator does not support mixing properly, it's a bug
> in ALSA, clearly, because real OSS in 2.4 allowed for mixing, as long
> as the hardware supported it. I played Doom while listening to MP3s on
> ymfpci (which, in fact, was a copy of ALSA's ymfpci with OSS API on top).
> 
> If ALSA developers wanted, they could have supported mixing in their OSS
> emulator. They intentionally chose not to, in order to create an incentive
> for developers to program in native ALSA.

You're in a mistake. ALSA supported multi-open feature for the hardware 
capable devices as first before any OSS drivers and it's available for the 
OSS emulation, too.

The thread is about simple hardware without this capability, so the mixing 
must be processed in software.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
Linux Kernel Sound Maintainer
ALSA Project, SUSE Labs
