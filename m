Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F822471D1C
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201924; cv=none; b=XEmRiUEhE9cSum3QH/rZmogD7c08+EwopV4RZw8RNvz47yPGC5vs+8BBZuNgUUTx+EKiEEdIhBgwTPaCEJUbaEcYGyq7O2oQYGC6axSkZa10VXxU/7JG/vM/iY1Wvldj9nPgJ5EXXWOPLuinvEvSTu4vs1CI1pG/c2A7VhDrQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201924; c=relaxed/simple;
	bh=6dlpcnb+tdp66nN6jG8jDwCoXWviXKTkEcoYblkcfgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnLV6RKYHuxv5kmHrcJ4FVQE5am3dq30YIldubW0I2j/NemFf99wkh35+s737L9hx5vHy538leUOXuG49Y9+AOWrC3cSpiUHG7z6GRQkauLRrhHTxVDHSJxdjbtuG10V+8pNPiBbJeO0IgrRGGLpZliS+XYtxu9h4w9anSFRAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s0J4RFaz; arc=none smtp.client-ip=95.215.58.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s0J4RFaz"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6dlpcnb+tdp66nN6jG8jDwCoXWviXKTkEcoYblkcfgM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791201919; v=1; x=1791806719;
 b=s0J4RFazBd9bzwcujPpQrHzeCs+muXVyyjl/9MF/sK996urUuJZrJxvJewrcnsbIjzTWJcHm
 YKu/NG9dtfql5l5G97UnqKll1x2VwtPQXWVgkMU3F9h/dmjmyHJ9FrvKVBmLKSxyL5UCUiZaW59
 8+4l+qLWUA/Iz7poUrX7yOa0=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70abc1d24c59e4ee;
	Mon, 05 Oct 2026 12:05:17 +0000
X-Mizu-Trace-ID: 70abc1d24c59e4ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev>
Date: Mon, 5 Oct 2026 13:22:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
To: =?UTF-8?Q?David_M=C3=A1rquez?= <davidmarquezfernandez@gmail.com>,
 linux-sound@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org, broonie@kernel.org,
 kai.vehmanen@linux.intel.com
References: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Problem
> -------
> The speaker randomly goes silent, typically when a browser stops and
> restarts playback (for example YouTube ad transitions). While it is
> silent the PCM is RUNNING and hw_ptr advances at 48 kHz, PipeWire reports
> no errors, the ALSA mixer is unchanged and nothing is logged in dmesg.
> Toggling "Speaker Switch" off and on restores the sound without closing
> the PCM. Before I worked around it, this happened 15 times in about 10
> hours of use on one day.
my money is on the asymmetric code structure which mixes DAPM and stream
triggers, see below.

> Evidence
> --------
> I captured the full DAPM debugfs tree, the ES8336 regmap registers and
> /sys/kernel/debug/gpio in the broken and in the working state. Everything
> is identical (including "Speaker Power: On" and "Speaker: On") except the
> speaker enable GPIO:
> 
>   broken:   gpio-541 (speakers-enable) out lo ACTIVE LOW
>   working:  gpio-541 (speakers-enable) out hi ACTIVE LOW
> 
> Setting pmdown_time to 0 on the codec and BE links did not prevent it.
> 
> Analysis
> --------
> In sound/soc/intel/boards/sof_es8336.c, sof_8336_trigger() drives the
> speaker GPIO to the "off" level on PAUSE_PUSH, SUSPEND and STOP without
> updating priv->speaker_en, while START, PAUSE_RELEASE and RESUME do
> nothing. The GPIO is only restored by sof_es8316_speaker_power_event()
> when DAPM actually powers the "Speaker Power" supply down and up again.
> If the stream is stopped and started again without that full power
> cycle, nothing re-enables the amplifier: the GPIO stays off while DAPM
> still considers the speaker on. I have not determined which exact path
> triggers it on my machine (pause/resume, xrun recovery, or a restart
> within pmdown_time).

Does this happen if the time between stop and restart is greater than
3s, or only when the delta is really short? In the latter case, IIRC
there's a DAPM feature where the power down happens with a delay, to
avoid unnecessary power transitions. so if the new stream starts
immediately, then the power-up transition will never happen.

> Proposed change (sketch, not a formal patch)
> --------------------------------------------
> Re-enable the amplifier on resume when the driver believes it is on:
> 
> case SNDRV_PCM_TRIGGER_START:
> case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> case SNDRV_PCM_TRIGGER_RESUME:
> + if (substream->stream == 0 && priv->speaker_en == false)
> + schedule_delayed_work(&priv->pcm_pop_work,
> +      msecs_to_jiffies(70));
> break;

alternatively you could deal with power management only in
sof_es8316_speaker_power_event(), and completely remove the transitions
on trigger start/stop/pause. In general it's a bad idea to add delays to
the trigger, it's supposed to be real fast.


