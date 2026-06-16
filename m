Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9EB30D3FA
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595349; cv=none; b=PWx56N509qmz0o5f0uIh4aNy/b2GfWEMBfDENM3SjBfb5LvemRNlzE51qQFLgyLe52K97qxd2fdf48QFzLgdrP7yhkDWhvIeoQ47oPcJFAphWk58+ySySWtFATNDFLA6wTdqgnRKxrQ+7T09cp8MQYXKU4E8OuRVf596//h9+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595349; c=relaxed/simple;
	bh=TnYkDouuG4csMI/D7w9ME6ZIeYV5QZ6uLtJOrSOZ8jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY3goeSHwXqkpCmv0P2VgJHG8ys/d6ZZOg/i6RWVDMUoiXqoYU0S+Yb+pbkvlZo92k7w33BRIjbWlrRRttUsRDZDbJGLY+CHTG/izsd94UKtpcXRP/ECdF/3ccPMdJ8PsOKv3B3Q58MqC+9qwpILaXRjaG4Kph+0vgkG9WeEf4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=zjhlGFqp; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="zjhlGFqp"
Date: Tue, 16 Jun 2026 09:35:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1781595342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TIxMr6p/Yv9hpTP9dv8eovugvzGEvZJ8rqq8R5629E=;
	b=zjhlGFqp8fRe4Ve9v6zRPVgsN9qwr+ZBzqXokGMHw2qBPdaB7bnjw4KrnYBD5xPceQmEUn
	ej6utvbWV5ax6Jmnjf+F4lZiZM7KQEGqXB8s2qKkkV85gt4sau5hXLVFzXq/NijfMOHCqz
	mJn23602vobeZodvk47XSEj8P5JYqzrTmnFmuxn0N1QZ9FBKe6kcNDnnojt0YtPnzV8Y0t
	YezpsOukPvG0vQWN8PYjLhXSAQbdFj+B+bRe6FtQh75/3R9uRy++FhnB5bCR7BeqVhJkNM
	Ej/r7Qbhzz7qVfpx/kQwBqt6oO11yauKHaDUCio4+wrhAd91bMqITwtEMCYNSA==
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
Message-ID: <wcwjhkd4czypxcantb3mb7suo2vegpd4p24chi27hduongxjtw@mb3ee6rv24vs>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
 <87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
 <dajhjm3tz6zug7dkdkqeis6bhxd6yxzxzyolmcbqaeer42ewut@czswsgsz5gok>
 <87qzm7mg6s.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzm7mg6s.wl-kuninori.morimoto.gx@renesas.com>
X-Migadu-Flow: FLOW_OUT

Hi Kuninori,

On Tue, Jun 16, 2026 at 01:23:23AM +0000, Kuninori Morimoto wrote:
> 
> Hi Alvin
> 
> Thank you for your question
> 
> > 1. What happens if CPU and codec both support e.g. DSP_A and I2S as
> > well-tested first priority formats? AFAIU I2S is only well-defined for
> > 2-channel stereo. But for the TDM (>2 channel) use case, will auto
> > select choose I2S, when actually we should have used DSP_A?
> 
> Auto format can have priority. But if DSP_A and I2S are set as same
> priority, DSP_A will be selected first.
> It doesn't care about channel numbers etc, just checking CPU/Codec
> format only.
> Please see soc_dai_convert_possiblefmt_to_daifmt() to know how it was
> selected.

OK, just reading soc_dai_convert_possiblefmt_to_daifmt(), it looks like
lower bits are preferred, so:

#define SND_SOC_DAI_FORMAT_I2S          1 /* I2S mode */
#define SND_SOC_DAI_FORMAT_RIGHT_J      2 /* Right Justified mode */
#define SND_SOC_DAI_FORMAT_LEFT_J       3 /* Left Justified mode */
#define SND_SOC_DAI_FORMAT_DSP_A        4 /* L data MSB after FRM LRC */

... would mean I2S gets selected.

My point here is that maybe "best effort" auto select actually makes a
bad choice, since DAI_FORMAT_I2S with >2 channel might lead to different
HW implementations on either side of the link.

> 
> > 2. Regarding the warning: for DPCM use-case, I was always setting the
> > DAI format on both the FE and BE links. Now I assume this will
> > unconditionally warn?
> 
> Your concern is about dummy DAI ?
> dummy DAI will have auto format settings too.
> (But, it should be included in 1st patch-set, but I have forgot to include
> it..., Will post for -rcX).
> 
> So there is no concern about DPCM case, but is this clear answer for you ?

Assuming the extra patch with auto format for dummy DAI, where dummy DAI
supports everything as first priority (my assumption), there are two cases:

    1. The user continues setting DAI format in graph-card2 DT. Auto
    format selection is skipped and a warning is emitted. Same behaviour
    as before except for a warning.

    2. The user sees the new warning and removes the DT setting. Since
    it's DPCM, the DAPM playback toplogy could look like this:

        FE                                      BE


                                { 0 --------> codec0
      cpu -------> audio mux {
                                { 1 --------> codec1

    cpu, codec0, codec1 are connected to dummies, so their format is
    just one of their first priority formats.

    But if there is no conflict resolution, so we could end up with
    incompatible formats between cpu and codec0 or codec1. For example,
    cpu and codec0 both have I2S as first priority, DSP_A as second. But
    codec1 only supports DSP_A. So you end up with:

        FE                                      BE

                                              [I2S]
    [I2S]                       { 0 --------> codec0
      cpu -------> audio mux {
                                { 1 --------> codec1
                                              [DSP_A]

    ... and cpu can't properly talk to codec1. But it would work if
    DSP_A was set everywhere.

    Maybe I missed the code/patch, but to resolve the conflict, wouldn't
    the code have to walk all possible permutations of the DAPM graph to
    resolve the conflict?

My point here is that for DPCM, auto format selection seems not to
work. I hope the example is clear.

> 
> > 3. I can also see it being annoying that the sound card warns me just
> > because the CPU or codec driver I'm using does not (correctly?) specify
> > .auto_selectable_formats. Maybe it is hard for someone to send a patch
> > if he doesn't know a lot about the third-party hardware.
> 
> I will post 2nd auto format patch-set, and all existing driver will
> have auto format settings by it. So, v7.2 will have warns, but v7.3 should
> be no warn. Unfortunately it is patch accepted timing issue.

OK, good to know! Feel free to put me on cc and I will check it out.

> Actually, I have no big opinion about sound card warning.
> I just thought it might be a good to indication.
> If it is annoying for people, I have no objection to remove it ;)
> 
> > 4. Last, just a comment: In my previous company we always used either I2S or
> > DSP_A by convention, depending on if it is 2-channel stereo or TDM
> > respectively. Both me and the hardware engineers would rely on this
> > knowledge when debugging digital audio signals with an oscilloscope for
> > example. While I agree in spirit that the DAI format is a SW setting and
> > might not belong in the device tree, in practice I'm not sure the
> > hardware engineers would completely agree. Hardware can also be buggy
> > and forcing a format in the sound card is needed to make things work.
> 
> Yeah
> 
> If you know that it can't use some format for some reasons, it's better to
> set it as lower priority, or disable from automatic selection.
> 
> And more, if the best format can't be automatically selected based on the
> CPU / Codec combination, you can use previous selection method as-is.
> 
> If CPU/Codec drivers has auto select settings, *basic* format will be
> automatically selected. But it is not necessarily the *best*.
> In most cases, I hope it is sufficient.
> 
> Unfortunately, auto format can't help all best cases. So I need to say it
> is "better than nothing".

It's for this reason that I think the warning is too strict. There are
"normal" setups where the user cannot avoid setting the DAI format in
the DT. Something to consider.

> 
> > It's just a warning so it's not a big deal. But I can see myself
> > patching this warning s/warn/dbg/ if I kept seeing it, for the reasons
> > stated above. Especially because I'm a big fan of audio-graph-card2 and
> > use it all the time :-)
> 
> Hehe :)
> I'm happy to know that there is audio-graph-card2 user :)

:-)

Kind regards,
Alvin
