From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 19 Jul 2023 07:27:40 +0000
Subject: Re: [BUG REPORT] sound: pci: ctxfi: htimestamp dose not work on EMU20k during recording
Message-Id: <87y1jcl5sj.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
In-Reply-To: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Klemm <carl@uvos.xyz>
Cc: alsa-devel@alsa-project.org, alsa-devel@vger.kernel.org, linux-sound@vger.kernel.org

On Wed, 19 Jul 2023 09:10:12 +0200,
Carl Klemm wrote:
> 
> Hi,
> 
> see https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3352
> htimestamp returns nonesensical values when recording is active on a
> EMU20k device

The driver doesn't provide any own implementation of PCM tstamp, hence
it must be the standard values.  That said, the incorrect values are
rather the "avail", that is the PCM position, not the timestamp
itself, I suppose.

Is it only about recording, i.e. playback doesn't show any wrong
values?

In anyway, try to enable the tracing for snd_pcm, get the position and
the system timestamp during recording, and verify whether the reported
values are reasonable or not.


Takashi
