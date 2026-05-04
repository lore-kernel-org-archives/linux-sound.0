Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E234AAEB
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884940; cv=none; b=TIRpFWLC8RDpwmJAajiwDbrIDm8tbBiwgeHFe03VeCgbAwJTX89zlbkD+INQpUqs2cBf4AqOJbSetJLPuyCmF4vaeB1f2E5WxX1YgmPxCsHisLYl8kQzF4eOZj+L93HNYdmW3Z7Q9wrGWY4DxDw2fk08awOdbzkmRdow32uTEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884940; c=relaxed/simple;
	bh=lU2EDQmU/1kWE63VUdyooIeqP4HSnxnVwO+yb1yVx/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3obOCVGwwn2vfoWB1DwHHJvLYT/BwhFpSbo1KHRngHXGTr3VlFsQfkyokdsQ7IiVqB7euKgSPh7E5RJtMuGPbm8cLob0gxvOlGY1ONgLGWPbcykIetK13GqriIlIrObnzP4jnwQDDu94J4/iRzvjX/Qv+tP335lsbWJ9EwbcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JB21TqaW; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JB21TqaW"
Message-ID: <ee566ae6-79bf-4ee5-9f0f-ba1a2607df25@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777884936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsPkd9qpP6g2Z+ZakrmHXZSm5egfMFIHZXqJrltcnJY=;
	b=JB21TqaWe96hW7W4QuSINZUiQgMvSZ4chnRAxoTKYZekty2f/Ne0xnoP06TcX5y8OIy58L
	+ezBWuqTL3Rz55uChwXusSvlBFdLoVAprdEEmdxh+nHxQ5tkYfikq08djvawdK+zSGAW26
	oUGB6Gz4KyUVeGy0KN13ccazkU3q5iA=
Date: Mon, 4 May 2026 10:55:12 +0200
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
 <78c57b26-505f-473d-8472-a491ede5aad9@linux.dev>
 <CAJ6xRxVeOJWteUsRZNE6QdYvv7ODoErRc7DQda6CdQfvq8-Z8g@mail.gmail.com>
 <579aaccd-990f-449e-a3ab-802b17925ab4@linux.dev>
 <CAJ6xRxWx1QO286deAhLsCivV2_mx8VFAq=fA8gOkHOUrjATYRA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAJ6xRxWx1QO286deAhLsCivV2_mx8VFAq=fA8gOkHOUrjATYRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/1/26 14:23, Aaron Ma wrote:
> On Fri, May 1, 2026 at 3:59 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev> wrote:
>>
>> On 4/30/26 10:45, Aaron Ma wrote:
>>> On Thu, Apr 30, 2026 at 4:07 PM Pierre-Louis Bossart
>>> <pierre-louis.bossart@linux.dev> wrote:
>>>>
>>>> On 4/29/26 06:12, Aaron Ma wrote:
>>>>> On Wed, Apr 29, 2026 at 4:20 AM Pierre-Louis Bossart
>>>>> <pierre-louis.bossart@linux.dev> wrote:
>>>>>>
>>>>>> On 4/28/26 09:37, Aaron Ma wrote:
>>>>>>> rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=PS3 then polls
>>>>>>> ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
>>>>>>> is still streaming — the codec cannot reach PS3 until the port stops,
>>>>>>> so the poll always times out during playback. This blocks
>>>>>>> snd_ctl_elem_write() for 2-3s making mute unresponsive.
>>>>>>>
>>>>>>> Remove the poll from PRE_PMD in rt1320_pde23_event() and
>>>>>>> rt1320_pde11_event(). The codec transitions to PS3 on its own once the
>>>>>>> data port becomes inactive. Keep the POST_PMU poll — on power-up the
>>>>>>> domain must reach PS0 before audio can flow.
>>>>>>>
>>>>>>> Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
>>>>>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>>>>>>> ---
>>>>>>>  sound/soc/codecs/rt1320-sdw.c | 2 --
>>>>>>>  1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
>>>>>>> index 192faa431b5e9..e42e8b6de853e 100644
>>>>>>> --- a/sound/soc/codecs/rt1320-sdw.c
>>>>>>> +++ b/sound/soc/codecs/rt1320-sdw.c
>>>>>>> @@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_dapm_widget *w,
>>>>>>>               regmap_write(rt1320->regmap,
>>>>>>>                       SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11,
>>>>>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
>>>>>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, ps3);
>>>>>>>               break;
>>>>>>>       default:
>>>>>>>               break;
>>>>>>> @@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_dapm_widget *w,
>>>>>>>               regmap_write(rt1320->regmap,
>>>>>>>                       SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
>>>>>>>                               RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
>>>>>>> -             rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, ps3);
>>>>>>
>>>>>> no, sorry, that's clearly wrong.
>>>>>>
>>>>>> When we touch the requested power state, we *shall* wait for the power state to be reached.
>>>>>> removing the transition delay is silly.
>>>>>>
>>>>>> You would really need to find out why streaming still occurs when you get a DAPM event. That doesn't seem right in the first place.
>>>>>>
>>>>>
>>>>>  The stream is active by design — this is a mute, not a stream close.
>>>>>
>>>>> To reproduce:
>>>>>
>>>>>   1. Play audio through rt1320 speaker (aplay or PipeWire)
>>>>>   2. Press speaker mute key (or amixer cset on both FU21 channels)
>>>>>   3. Second channel mute takes 2-3s to return
>>>>>
>>>>> Muting both channels removes the last DAPM path consumer of PDE23.
>>>>> DAPM fires PRE_PMD while PipeWire still holds the PCM open —
>>>>> DP1 keeps streaming zeros. The codec cannot reach PS3 while its data
>>>>> port is active, so the poll always times out. The mute register write
>>>>> that actually silences the speaker happens after this useless wait.
>>>>>
>>>>> I confirmed via SoundWire debugfs reads: ACTUAL_POWER_STATE stays PS0
>>>>> while the port streams and only transitions to PS3 after PipeWire calls
>>>>> hw_free (~3s later). The poll can never succeed in this path.
>>>>>
>>>>> Every other Realtek SDCA amp driver does fire-and-forget on PRE_PMD with
>>>>> no transition delay — rt712_sdca_pde23_event(), rt721_sdca_pde41_event(),
>>>>> rt1316_pde24_event(), and rt1017_sdca_pde23_event() all just write PS3
>>>>> and return. rt1320 is the only one that polls on power-down.
>>>>>
>>>>> The POST_PMU poll is kept — on power-up the domain must reach PS0 before
>>>>> audio can flow, and the port is not yet active at that point so the
>>>>> transition succeeds immediately.
>>>>
>>>> well that's an interesting issue. IMHO all those drivers are broken then...
>>>> A mute should let the ports active and not start any power transitions on the codec side.
>>>> That's what should be fixed first.
>>>>
>>>> I am not sure either why PipeWire would send a hw_free on a mute either, that's a sure what to have audible delays and glitches. Mute != Stop.
>>>>
>>>
>>> hw_free is not involved here. The mute is purely at the codec's FU
>>> level (FU_MUTE=1 silences the output) — the PCM stream remains open and
>>> DP1 stays active. SoundWire debugfs confirms: after mute during
>>> playback, REQ_POWER_STATE=PS3 but ACTUAL_POWER_STATE remains PS0. The
>>> codec cannot transition while the port is streaming. As long as the
>>> application keeps playing, this state persists indefinitely.
>>>
>>> The power transition is not triggered by PipeWire either. It is standard
>>> DAPM behavior: muting both FU21 channels removes the last active path
>>> consumer of PDE23, so DAPM evaluates the widget as unused and fires
>>> PRE_PMD. This is how every rt7xx/rt13xx driver's DAPM graph works today.
>>>
>>> The poll itself is broken in this path: it cannot succeed while the port
>>> is active, always times out, and the handler continues anyway. Removing
>>> it fixes the user-facing 2-3s mute latency without changing any DAPM
>>> topology or power semantics — the REQ_POWER_STATE=PS3 write is still
>>> issued, and the codec transitions once the port stops.
>>
>> well we're talking past each other. The only thing we agree on is that going to PS3 while audio is still streaming is really bad.
>>
>> To repeat myself, there is *no reason* why a mute should trigger a power-down.
>> I am not expert enough in DAPM but that isn't a desired behavior.
>>
>> Don't fix this unwanted behavior with a change in how the power state transition is implemented, fix the unwanted behavior instead.
>>
>>
> 
> The current rt1320 behavior is consistent with how this driver models
> the playback path in DAPM.
> 
> DAPM is documented to make power decisions from stream activity and
> mixer settings,
> with those decisions derived from the routing graph
> (`Documentation/sound/soc/dapm.rst`).
> 
> In rt1320, the speaker mute controls are `SOC_DAPM_SINGLE_AUTODISABLE`
> switches on the two `FU21` mute bits,
> and the playback path is `DP1RX -> FU21 -> OT23 L/R -> SPOL/SPOR`,
> with `FU21` also depending on `PDE 23`.
> 
> With that graph, muting both speaker switches removes the active
> speaker path, so `PDE 23` receiving `PRE_PMD` is consistent with the
> current DAPM model of this driver.
> 
> Given that, I think the immediate bug is the synchronous wait in
> `rt1320_pde23_event(PRE_PMD)`, not the fact that DAPM attempts to
> power down the now-unused speaker supply path.

My point is that the DAPM model seems wrong. Muting should not have any impacts on power management.

For some reason the RT1320 driver differs from previous codec drivers:

static const struct snd_kcontrol_new rt1320_spk_l_dac =
	SOC_DAPM_SINGLE_AUTODISABLE("Switch",
		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_FU21, RT1320_SDCA_CTL_FU_MUTE, CH_01),
		0, 1, 1);

static const struct snd_kcontrol_new rt1318_sto_dac =
	SOC_DAPM_DOUBLE_R("Switch",
		SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, RT1318_SDCA_ENT_FU21, RT1318_SDCA_CTL_FU_MUTE, CH_L),
		SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, RT1318_SDCA_ENT_FU21, RT1318_SDCA_CTL_FU_MUTE, CH_R),
		0, 1, 1);

And the main question is "why"? 
There's been no change in the topology definition, FU21 plays exactly the same role but is handled differently.

Maybe there are separate DACs for left and right, but that doesn't mean we want muting to impact PDE management.
If you look at the helper that is being introduced, no one has any plans to remove the synchronous wait after changing power states.

Shuming, can you please chime in?




