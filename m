From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 25 Jun 2018 14:34:45 +0000
Subject: Re: [alsa-devel] first and last audio sample timestamp
Message-Id: <s5hbmbzylx6.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CAPY=qRT-AvUiLFLTx7MzMzreLkWK8Fk06egUMCJsVJ7VwgziuA@mail.gmail.com>
In-Reply-To: <CAPY=qRT-AvUiLFLTx7MzMzreLkWK8Fk06egUMCJsVJ7VwgziuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Fri, 22 Jun 2018 16:00:10 +0200,
Subhashini Rao Beerisetty wrote:
> 
> [ Please keep me in CC as I'm not subscribed to the list]
> 
> Hi All,
> 
> 
> 
> Hello all,
> 
> 
> I’m using aplay and arecord utilities for playback and capture. I need to
> capture the timestamps for the first and last audio samples that arrive at
> the driver level.
> 
> For this I’m capturing the CLOCK_MONOTONIC_RAW timestamp at the
> .trigger(for playback & capture) callback in SNDRV_PCM_TRIGGER_START  case
> – is it the correct timestamp for the first audio sample arrived at the
> driver level?
> 
> Similarly does .trigger callbacks SNDRV_PCM_TRIGGER_STOP gives the last
> audio sample timestamp?

No, it's the timestamp upon calling the trigger callback.
It has nothing to do directly with the first or the last sample.
(But usually the start trigger is the time of the first sample for
 capture, though.)


Takashi
