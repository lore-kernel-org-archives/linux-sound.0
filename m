Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420E377574
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536437; cv=none; b=LrmKXPq2CyeMTqgvhN1xpQopypc3lyT1JqH3er6nGa5lW/U1l92WP40yjE1LhKll329AsHJ73J1fFErGu8XwSGZL5kKy4F91hXJrd2OHyRCxbEvzAdlpPSBI2gAqDtvDyQutQmaqVSQnMbXFrgsvKIZV1XMeKgVzreuNcvYQ5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536437; c=relaxed/simple;
	bh=q9h0MvbHGEw6d25Ym6ANGUDWnGDI9afZd7TZ+Z/PU/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpMWK5kXyeX7+fXiwEo/tbSbi0+kmuITBewUZxoZy6VpGsXkt4W6I4E7rCVYcrkQMBtp1HGDvWqkEvh4S/+Fk07EoFzJ1BpMDsWNVsqjKDczoixB830Nu/VHKJuqDNEmASDBSweRfaUP5U2qWTTYFouStkZmeSistM8aRYVvLyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LK44AKVF; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LK44AKVF"
Message-ID: <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777536433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4SmEOnwak44qk6ykdANG6Tok8fpdAo9btlLDOvpeIo=;
	b=LK44AKVFt6ISQy6YWqLkKH8H84lJsIyC1f954WDBM+hDAE25wXEVc8D0YRxdvKgWOf+nYt
	3Rncerg2JxzEftdT6TBuBp4ii9iDyox/asAMfeiIJsPfgyWJWp3MVwEiEHHerCEdMMtxHC
	dOMl95ouETiLshUqBItbW4FhNF3mD6k=
Date: Thu, 30 Apr 2026 10:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
To: Aaron Ma <aaron.ma@canonical.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuming Fan <shumingf@realtek.com>
References: <20260428073726.1611777-1-aaron.ma@canonical.com>
 <69a3d80d-c9aa-459f-8522-c07e225bd5d9@linux.dev>
 <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAJ6xRxUuOgfoJ1VP3++Hm_UdhYLJH-16J3rXUcN6O1BmSDJVbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 4/29/26 06:12, Aaron Ma wrote:
> On Wed, Apr 29, 2026 at 4:20 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev> wrote:
>>
>> On 4/28/26 09:37, Aaron Ma wrote:
>>> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=PS3 then polls
>>> ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
>>> is still streaming — the codec cannot reach PS3 until the port stops,
>>> so the poll always times out during playback. This blocks
>>> snd_ctl_elem_write() for 2-3s making mute unresponsive.
>>>
>>> Remove the poll from PRE_PMD in rt1320_pde23_event() and
>>> rt1320_pde11_event(). The codec transitions to PS3 on its own once the
>>> data port becomes inactive. Keep the POST_PMU poll — on power-up the
>>> domain must reach PS0 before audio can flow.
>>>
>>> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>>> ---
>>>  sound/soc/codecs/rt1320-sdw.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
>>> index 192faa431b5e9..e42e8b6de853e 100644
>>> --- a/sound/soc/codecs/rt1320-sdw.c
>>> +++ b/sound/soc/codecs/rt1320-sdw.c
>>> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_dapm_widget *w,
>>>               regmap_write(rt1320->regmap,
>>>                       SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11,
>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, ps3);
>>>               break;
>>>       default:
>>>               break;
>>> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_dapm_widget *w,
>>>               regmap_write(rt1320->regmap,
>>>                       SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, ps3);
>>
>> no, sorry, that's clearly wrong.
>>
>> When we touch the requested power state, we *shall* wait for the power state to be reached.
>> removing the transition delay is silly.
>>
>> You would really need to find out why streaming still occurs when you get a DAPM event. That doesn't seem right in the first place.
>>
> 
>  The stream is active by design — this is a mute, not a stream close.
> 
> To reproduce:
> 
>   1. Play audio through rt1320 speaker (aplay or PipeWire)
>   2. Press speaker mute key (or amixer cset on both FU21 channels)
>   3. Second channel mute takes 2-3s to return
> 
> Muting both channels removes the last DAPM path consumer of PDE23.
> DAPM fires PRE_PMD while PipeWire still holds the PCM open —
> DP1 keeps streaming zeros. The codec cannot reach PS3 while its data
> port is active, so the poll always times out. The mute register write
> that actually silences the speaker happens after this useless wait.
> 
> I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE stays PS0
> while the port streams and only transitions to PS3 after PipeWire calls
> hw_free (~3s later). The poll can never succeed in this path.
> 
> Every other Realtek SDCA amp driver does fire-and-forget on PRE_PMD with
> no transition delay — rt712_sdca_pde23_event(), rt721_sdca_pde41_event(),
> rt1316_pde24_event(), and rt1017_sdca_pde23_event() all just write PS3
> and return. rt1320 is the only one that polls on power-down.
> 
> The POST_PMU poll is kept — on power-up the domain must reach PS0 before
> audio can flow, and the port is not yet active at that point so the
> transition succeeds immediately.

well that's an interesting issue. IMHO all those drivers are broken then... 
A mute should let the ports active and not start any power transitions on the codec side. 
That's what should be fixed first.

I am not sure either why PipeWire would send a hw_free on a mute either, that's a sure what to have audible delays and glitches. Mute != Stop.

