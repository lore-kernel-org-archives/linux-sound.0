Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381D2DF152
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781565787; cv=none; b=Mhnqm572PMJPUOO0ds28ovJxCjjYk/U2cKwGNXL3EiC0gXOoKOgozTdTVRT8+nV+Vj3y1JPOYjm7a0VbWixMxUw29ZZgLxBN7oIebic4HHqO5hLJomhcPVZEHw7KotRtYglO2F/ObjGrMNgmeLLk+KbUXVa63oGn1B0wMyUm2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781565787; c=relaxed/simple;
	bh=Poj8X2BczBlVpbcDeVlJlm9xdCTagH7LfgDANQ5rzEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuZI6EfQK5vpE0qTgOq3hdWCczgtEzWBFVY0ZJrkfZcSzZnffSrjCLQAMNsN7OSxt6KYJqENr+yIsax0D6otqQt+lnrTDT2L6ba3JV/u9qo9W3nO5N2s+z6rZpZp0/uG1l4plcwYDiR4PDyj71U8BeYy5g1GuGlk3V9/e+W6EU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=PvyZfV0r; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="PvyZfV0r"
Date: Tue, 16 Jun 2026 01:22:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1781565778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GYSAFl/VjbYl9hVw9tZzlj4CMrNjuB0KBZg49Zsf/8=;
	b=PvyZfV0rNZtbcMiszVA9UlcLKijcS46PqWWsy6yUp3ahofOvYjdbxHrW4LlBu8fhLYahww
	6kSUxd4vLhYoqyZHu3gNxIQwWN/F8XiPYsfGxH55hSVPBnnidXOK6Slj2Pz9SDAUj+xfxN
	nHhM8LqjnXdCHrZ2/uCa/Z0Vo4B9dBAJwZVnl+kfvy1opqf+JlwcJ2jAxuP7D4QWt374R9
	QmUU8LlpNpAeqOaAxPvPCglrcmnN4aYtYT15Ub1DJSF8sAfmRjSPezHGPbie+fmRVU+YTN
	lc2gHnUX84Xpr2F1qs7QhnmyGzO6tzaM+R+gS/P1GKaNz3IrbGZsCs87VVPenQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Baojun Xu <baojun.xu@ti.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Herve Codina <herve.codina@bootlin.com>, 
	Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Support Opensource <support.opensource@diasemi.com>, 
	Takashi Iwai <tiwai@suse.com>, 
	=?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH v3 9/9] ASoC: audio-graph-card2: recommend to use auto
 select DAI format
Message-ID: <dajhjm3tz6zug7dkdkqeis6bhxd6yxzxzyolmcbqaeer42ewut@czswsgsz5gok>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
 <87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
X-Migadu-Flow: FLOW_OUT

Hi Kuninori,

I'm a bit late to the discussion, but I hope you can answer a few
questions I have about auto_selectable_formats. See below.

(BTW, I just moved job and don't have the means to test your latest
changes right now. Please excuse any obvious questions.)

On Tue, Jun 09, 2026 at 12:23:41AM +0000, Kuninori Morimoto wrote:
> "Simple Audio Card", "Audio Graph Card", "Audio Graph Card2" are
> possible to set DAI format via DT.
> 
> OTOH, ASoC is supporting .auto_selectable_formats to select DAI
> format automatically. Let's recommend to use it on "Audio Graph Card2".
> One note is that it keeps supporting DAI format setting via DT.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/generic/audio-graph-card2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
> index 0202ed0ee78e8..6894bb936cfd2 100644
> --- a/sound/soc/generic/audio-graph-card2.c
> +++ b/sound/soc/generic/audio-graph-card2.c
> @@ -778,6 +778,18 @@ static void graph_link_init(struct simple_util_priv *priv,
>  	graph_parse_daifmt(ports_cpu,	&daifmt);
>  	graph_parse_daifmt(ports_codec,	&daifmt);
>  	graph_parse_daifmt(lnk,		&daifmt);
> +	if (daifmt) {
> +		struct device *dev = simple_priv_to_dev(priv);
> +
> +		/*
> +		 * Recommend to use Auto Select by using .auto_selectable_formats.
> +		 * linux/sound/soc/renesas/rcar/core.c can be good sample for it.
> +		 *
> +		 * One note is that Audio Graph Card2 still keeps compatible to set
> +		 * DAI format via DT.
> +		 */
> +		dev_warn_once(dev, "use .auto_selectable_formats on each corresponding CPU/Codec driver");

1. What happens if CPU and codec both support e.g. DSP_A and I2S as
well-tested first priority formats? AFAIU I2S is only well-defined for
2-channel stereo. But for the TDM (>2 channel) use case, will auto
select choose I2S, when actually we should have used DSP_A?

2. Regarding the warning: for DPCM use-case, I was always setting the
DAI format on both the FE and BE links. Now I assume this will
unconditionally warn?

3. I can also see it being annoying that the sound card warns me just
because the CPU or codec driver I'm using does not (correctly?) specify
.auto_selectable_formats. Maybe it is hard for someone to send a patch
if he doesn't know a lot about the third-party hardware.

4. Last, just a comment: In my previous company we always used either I2S or
DSP_A by convention, depending on if it is 2-channel stereo or TDM
respectively. Both me and the hardware engineers would rely on this
knowledge when debugging digital audio signals with an oscilloscope for
example. While I agree in spirit that the DAI format is a SW setting and
might not belong in the device tree, in practice I'm not sure the
hardware engineers would completely agree. Hardware can also be buggy
and forcing a format in the sound card is needed to make things work.

It's just a warning so it's not a big deal. But I can see myself
patching this warning s/warn/dbg/ if I kept seeing it, for the reasons
stated above. Especially because I'm a big fan of audio-graph-card2 and
use it all the time :-)

Thanks for your work!

Kind regards,
Alvin
