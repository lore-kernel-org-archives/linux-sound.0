Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B43D34B5
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037114; cv=none; b=MaKDNw6AYJP4ETQLiFo40oezPQdz8Omnc73B2JDvgKavBGu4LwyubJm5Dumk5SZUtrHN3HlqTsBqz2Tj26rGUJhnlPMIafqMcn37u4xHJEPSGklO1i5aAKthDjOTeQth7GRWULyu/7tmLxULlrDyzjxJoOCH7V602S0b2AsfqL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037114; c=relaxed/simple;
	bh=mnLCAdbXW0O9Ton8wP6Qjz7IL8Fhbo0yAwXDNFbSZOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZIQ2uu0StjYiD6+ff5orZfy2gX+RjUKMiyU2fzYrfCKmqvdw/qXrTMAOQocy+UHOVbiu08iHUe+0iOYD5tkjBCR5w6taZCoikfzx84mGHAPome9o/B1Zih13D2QRiVFZW+em5nxMGIL99fnPnVM6BltriZ9O1HBbReUTeJQ0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hOau+sNT; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hOau+sNT"
Message-ID: <5ef5113c-b66f-468f-a906-72a8dcb67920@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777037109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRJiMiTsb7HlCt2LXu84F+RU+TtASIrQsjH8f3xmDEw=;
	b=hOau+sNTlmLmdomQ515mfU4P2dgUpwWSoIJP1ipuoa7si0SqcgRH/4eABnCg1Pz0qWrsmm
	X7ji083IMN66l3DtTIEN0Gm/UJe4lqxeqDexE+9LUFxcw3TxHSyb8nX9K/8kY9BCbqWoyD
	BbPFI6cwX0kEyXx076IKVIYzwZyN9Y4=
Date: Fri, 24 Apr 2026 15:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
To: Aaron Ma <aaron.ma@canonical.com>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, "shumingf@realtek.com" <shumingf@realtek.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
 <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
 <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 4/24/26 05:52, Aaron Ma wrote:
> On Thu, Apr 23, 2026 at 9:01 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev> wrote:
>>
>> On 4/23/26 12:13, Aaron Ma wrote:
>>> The rt722-sdca codec driver exposes FU06 Playback Volume but no
>>> corresponding mute switch. Without a user-facing ALSA switch, UCM
>>> cannot attach the speaker mute LED via snd_ctl_led, and PipeWire
>>> cannot drive hardware mute.
>>>
>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>>> ---
>>>  sound/soc/codecs/rt722-sdca.c | 77 ++++++++++++++++++++++++++++-------
>>>  sound/soc/codecs/rt722-sdca.h |  4 ++
>>>  2 files changed, 67 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
>>> index 79b8b7e70a334..23d2f63d68ef3 100644
>>> --- a/sound/soc/codecs/rt722-sdca.c
>>> +++ b/sound/soc/codecs/rt722-sdca.c
>>> @@ -517,6 +517,61 @@ static int rt722_sdca_fu1e_capture_put(struct snd_kcontrol *kcontrol,
>>>       return changed;
>>>  }
>>>
>>> +static int rt722_sdca_set_fu06_playback_ctl(struct rt722_sdca_priv *rt722)
>>> +{
>>> +     int err;
>>> +     unsigned int ch_l, ch_r;
>>> +
>>> +     ch_l = (rt722->fu06_dapm_mute || rt722->fu06_mixer_l_mute) ? 0x01 : 0x00;
>>> +     ch_r = (rt722->fu06_dapm_mute || rt722->fu06_mixer_r_mute) ? 0x01 : 0x00;
>>> +
>>> +     err = regmap_write(rt722->regmap,
>>> +                     SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
>>> +                     RT722_SDCA_CTL_FU_MUTE, CH_L), ch_l);
>>> +     if (err < 0)
>>> +             return err;
>>> +
>>> +     err = regmap_write(rt722->regmap,
>>> +                     SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU06,
>>> +                     RT722_SDCA_CTL_FU_MUTE, CH_R), ch_r);
>>
>> IIRC you can mute all channels at once in a FU (Feature Unit) using Control Number 0.
>>
>> If both channels need to be muted/unmuted it's better to do so in a single command.
>>
> 
> Thanks for the review.
> 
> The per-channel mute writes are unchanged from the existing DAPM
> handler, just moved into a helper.
> All rt711/rt712/rt722 drivers use per-channel writes for FU_MUTE — no
> CN0 precedent exists.

Fair enough, something to do in the future...

While I am at it, in theory those registers are Dual-Ranked, with a 'commit' mechanism to deal with all volume changes at the same time. We'll need to add support for Dual-Ranked registers at some point, not sure how this can be bolted in regmap support... Cc: Charles for future SDCA improvements...

For now, here's a 

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


