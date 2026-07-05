Received: from www728.your-server.de (www728.your-server.de [167.235.121.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477442E06EF;
	Sun,  5 Jul 2026 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.121.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783270216; cv=none; b=YCWsVRFrX3fTa7W0LDuOrMs2tC4z/tsff9rzfNCBKan60EtqHwnIyqByfyU6tnOMV/kh0HfwvsGIPiSF8+KZwbc1K7lwPwzEQP7xi0OAs/80ZZuIYlV1YjqDsPwDx4NsW4FX8jlJqDNpRsorr+OnCwWaBIXC3KcEomuQe433sgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783270216; c=relaxed/simple;
	bh=eU8wCsm6YkkF+R5d7RUL+LhfTCVwekNNMje9KlCVQzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdiPE7h98QDH0N8eZjcqDmM2KV2qCJMmESVC9JA7KCfuSI9UNFf/uc9D3pVSq06YOXIXiVrtEtZWGeYHZz7PLzlXidD5k4ukxy27FVOtkKRbo3GxTjBt0ItpAORTCFD5cJwaw6i4z3VLImyzlJTMRjg/mPml2gRhXnkecKCeUCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de; spf=pass smtp.mailfrom=marcogriep.de; dkim=pass (2048-bit key) header.d=marcogriep.de header.i=@marcogriep.de header.b=F+SLv1NE; arc=none smtp.client-ip=167.235.121.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcogriep.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcogriep.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcogriep.de header.i=@marcogriep.de header.b="F+SLv1NE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=marcogriep.de; s=default2606; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DHLCAI/z6H22okFXsfrCtpzy8QAU2oa4S9g+jdQAu6U=; b=F+SLv1NEPqIYqnvWM90wq852qu
	veZQmJWrmRTcWspmVcG2uyhf7d0319VzRWtWgDGIzEj3lJQNAbElz05Ft+wamcUyoen5ycAN5fvhT
	QPfbXtatoetXeAOwnSdbU/N43xsAF5WZR0bIOrlfUCjuQuOL90pz2nl+e/2idHt3R2NV+5Q/RwB+D
	9UNY9uADgUZSQkH9YDWrqNec2StWdhriv3pQqbTOOXBTXoM8CRTkc6oEDd2oX9yMi5dArPBQsy03g
	xvGxgURVFu4SKHVYd2zWoygn0d+U4so2TosfdjNbV7cE77beAYmzZa3RvnX4QltJNWRCeo8qj5oe6
	JeSjYxQQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www728.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <mail@marcogriep.de>)
	id 1wgQ2k-00000000OwI-2lO6;
	Sun, 05 Jul 2026 18:50:10 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mail@marcogriep.de>)
	id 1wgQ2k-000PYe-0g;
	Sun, 05 Jul 2026 18:50:10 +0200
Message-ID: <01e6e41e-21df-4e2e-b4aa-d173a2bb0848@marcogriep.de>
Date: Sun, 5 Jul 2026 18:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
To: "Liao, Bard" <bard.liao@intel.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <30dd273a.AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHg@mailjet.com>
 <SJ2PR11MB8424C0407CEC9D51F2C9EF5FFFF22@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Marco Griep <mail@marcogriep.de>
In-Reply-To: <SJ2PR11MB8424C0407CEC9D51F2C9EF5FFFF22@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28051/Sun Jul  5 08:24:23 2026)

Hi Mark,

On my system it doesn't.

With the standalone RT721 ACP70 machine entry, |card->components|does 
not end up containing |spk:rt721|, so the RT721 speaker device is 
missing from the UCM component list. As a result, UCM doesn't include 
the speaker device and PipeWire only exposes the headset devices.

Appending |spk:rt721|from |asoc_sdw_rt_mf_sdca_spk_rtd_init()|fixes that 
on my ASUS Vivobook S16 M3607GA (ACP70 + RT721-SDCA). After the change, 
UCM exposes the expected Speaker, Headphones, Internal Mic and Headset 
devices.

If the token is expected to be added by |asoc_sdw_rtd_init()|, I'd be 
happy to investigate why that doesn't happen with this machine 
configuration.


Best Regards

Marco


Am 05.07.26 um 14:49 schrieb Liao, Bard:
>
>> -----Original Message-----
>> From: Marco Griep <mail@marcogriep.de>
>> Sent: Saturday, July 4, 2026 8:51 PM
>> To: Mark Brown <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Charles
>> Keepax <ckeepax@opensource.cirrus.com>; Kuninori Morimoto
>> <kuninori.morimoto.gx@renesas.com>; linux-sound@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Marco Griep <mail@marcogriep.de>
>> Subject: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
>>
>> The RT721 multifunction SDCA speaker helper adds the DAPM routes for
>> its internal speaker path, but it does not add the corresponding
>> spk:rt721 token to card->components.
> .component_name = "rt721", is set in the rt721 codec info in
> codec_info_list[]. And the "spk" tag will be added in the
> asoc_sdw_rtd_init() function. Doesn't it work on your device?
>
>> UCM uses that token to include the RT721 speaker device. Without it,
>> systems with standalone RT721 expose the ALSA SmartAmp PCM but PipeWire
>> only sees the headset devices.
>>
>> Append the speaker codec token from the RT721 multifunction SDCA speaker
>> runtime init path so UCM can create the internal speaker route.
>>
>> Tested on an ASUS Vivobook S16 M3607GA with ACP70 SoundWire RT721-SDCA.
>> With the standalone RT721 ACP70 machine entry, this makes the HiFi
>> profile expose Speaker, Headphones, internal Mic and Headset devices.
>>
>> Signed-off-by: Marco Griep <mail@marcogriep.de>
>> ---
>>   sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>> b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>> index 5bf3627a97a0..e895397eefd6 100644
>> --- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>> +++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>> @@ -74,6 +74,12 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct
>> snd_soc_pcm_runtime *rtd, struct snd
>>   		return -EINVAL;
>>   	}
>>
>> +	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
>> +					  "%s spk:%s",
>> +					  card->components, codec_name);
>> +	if (!card->components)
>> +		return -ENOMEM;
>> +
>>   	/* Add routes */
>>   	ret = snd_soc_dapm_add_routes(dapm, route_map->route_map,
>> route_map->route_size);
>>   	if (ret)
>>
>> base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
>> --
>> 2.55.0
>>
