From: Pete Zaitcev <zaitcev@redhat.com>
Date: Wed, 04 Jan 2006 11:13:00 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060104031300.270541d9.zaitcev@redhat.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	<200601031347.19328.s0348365@sms.ed.ac.uk>
	<200601031452.10855.ak@suse.de>
	<mailman.1136300646.6679.linux-kernel2news@redhat.com>
In-Reply-To: <mailman.1136300646.6679.linux-kernel2news@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: linux-kernel@vger.kernel.org, zaitcev@redhat.com, linux-sound@vger.kernel.org

On Tue, 3 Jan 2006 14:01:40 +0000, Alistair John Strachan <s0348365@sms.ed.ac.uk> wrote:

> Is multiple-source mixing really a "high end" requirement? When I last 
> checked, the OSS driver didn't support multiple applications claiming it at 
> once, thus requiring you to use "more bloat" like esound, arts, or some other 
> crap to access your soundcard more than once at any given time.

If ALSA's OSS emulator does not support mixing properly, it's a bug
in ALSA, clearly, because real OSS in 2.4 allowed for mixing, as long
as the hardware supported it. I played Doom while listening to MP3s on
ymfpci (which, in fact, was a copy of ALSA's ymfpci with OSS API on top).

If ALSA developers wanted, they could have supported mixing in their OSS
emulator. They intentionally chose not to, in order to create an incentive
for developers to program in native ALSA.

-- Pete
