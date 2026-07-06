Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCA381AF;
	Mon,  6 Jul 2026 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783299321; cv=none; b=C79IP9ZtbRQGKttqShAEgO2lNDWWJbIE/1SV7jp3CEYy/gLlx0c045e9rRWJ/KIb4a1jdnIG7ScUVqclJY81GQGS1hmw63W1DV0uqsq9RLnXMdymWl+adALrinmPBq6LS+qG7wSBNewfpLUp3iFyVRxO7vXDpcb2Rfg9mX2345Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783299321; c=relaxed/simple;
	bh=4v9vAFV89Whx56wKAmsfobwrDO4ngmjvzGg/dxBD+tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1Rk9tm6PmidlNE8+2Tk5t3aeik2Lv0spq3WDqSbcR0irw73ULbHESZ+VujQ11+M9nYpx29mZJd5eBrkKX/H3fvPb27XDkDFPGckf7DLX2SYzkivmRBavgntGEnE1qHm3NNqwlIcRx4mRW0ZTFSUVdhfzD+XJ/Cs9RjPzMGxhaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DA4o7oTE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DA4o7oTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783299319; x=1814835319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4v9vAFV89Whx56wKAmsfobwrDO4ngmjvzGg/dxBD+tA=;
  b=DA4o7oTERImQHJPKleJm8OUm7xbRKQeI1XSXZGGBk0UMIQeiQNVo9ald
   Aq/ZmLbinKjpGU1I4QV4N9VN8swx/oS4IVsJaQo2egCAzpXUP2bBvZrhj
   a20MvrRhN5bF5gpLbcHAiP6FNKly82JIut8TfrtmLwCTUCsx2CLDVmPtz
   mcOjaeYb+o1ziVjgUrWn0/TjOK52kUrbgfRLktqlO/+CZRuEiYhxaUmqV
   A5e/nbuVa3vp/EJ22rpS9Z7gvWOLlI4F7U/VkWzbxyTtizOtwnQeq13r8
   yH6lVnFwj1X0Xliq0NfBRj+sKpH0oiNwWwg3n57jOIDUMTPmyt+XJ0GYY
   w==;
X-CSE-ConnectionGUID: VEM0DIkoRravNVpPwI9ZVQ==
X-CSE-MsgGUID: xx7aWkVTTpeoyG/QgbrX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94531577"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94531577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 17:55:18 -0700
X-CSE-ConnectionGUID: fhBff7VjTkyQtOCIhYXm2w==
X-CSE-MsgGUID: 7PfYJYkhSJCGTJvvkBOHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="276789406"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.168]) ([10.246.104.168])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 17:55:15 -0700
Message-ID: <f57534be-ee55-4132-b34e-632ee6dc2193@linux.intel.com>
Date: Mon, 6 Jul 2026 08:55:02 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
To: Marco Griep <mail@marcogriep.de>, "Liao, Bard" <bard.liao@intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <30dd273a.AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHg@mailjet.com>
 <SJ2PR11MB8424C0407CEC9D51F2C9EF5FFFF22@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <01e6e41e-21df-4e2e-b4aa-d173a2bb0848@marcogriep.de>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <01e6e41e-21df-4e2e-b4aa-d173a2bb0848@marcogriep.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/6/2026 12:50 AM, Marco Griep wrote:
> Hi Mark,
> 
> On my system it doesn't.
> 
> With the standalone RT721 ACP70 machine entry, |card->components|does
> not end up containing |spk:rt721|, so the RT721 speaker device is
> missing from the UCM component list. As a result, UCM doesn't include
> the speaker device and PipeWire only exposes the headset devices.

Please file an issue on https://github.com/thesofproject/linux/issues
with alsa-info output. I will take a look. We should fix the issue
instead of adding the spk tag back to asoc_sdw_rt_mf_sdca_spk_rtd_init()

> 
> Appending |spk:rt721|from |asoc_sdw_rt_mf_sdca_spk_rtd_init()|fixes that
> on my ASUS Vivobook S16 M3607GA (ACP70 + RT721-SDCA). After the change,
> UCM exposes the expected Speaker, Headphones, Internal Mic and Headset
> devices.
> 
> If the token is expected to be added by |asoc_sdw_rtd_init()|, I'd be
> happy to investigate why that doesn't happen with this machine
> configuration.
> 
> 
> Best Regards
> 
> Marco
> 
> 
> Am 05.07.26 um 14:49 schrieb Liao, Bard:
>>
>>> -----Original Message-----
>>> From: Marco Griep <mail@marcogriep.de>
>>> Sent: Saturday, July 4, 2026 8:51 PM
>>> To: Mark Brown <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>
>>> Cc: Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>;
>>> Charles
>>> Keepax <ckeepax@opensource.cirrus.com>; Kuninori Morimoto
>>> <kuninori.morimoto.gx@renesas.com>; linux-sound@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; Marco Griep <mail@marcogriep.de>
>>> Subject: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
>>>
>>> The RT721 multifunction SDCA speaker helper adds the DAPM routes for
>>> its internal speaker path, but it does not add the corresponding
>>> spk:rt721 token to card->components.
>> .component_name = "rt721", is set in the rt721 codec info in
>> codec_info_list[]. And the "spk" tag will be added in the
>> asoc_sdw_rtd_init() function. Doesn't it work on your device?
>>
>>> UCM uses that token to include the RT721 speaker device. Without it,
>>> systems with standalone RT721 expose the ALSA SmartAmp PCM but PipeWire
>>> only sees the headset devices.
>>>
>>> Append the speaker codec token from the RT721 multifunction SDCA speaker
>>> runtime init path so UCM can create the internal speaker route.
>>>
>>> Tested on an ASUS Vivobook S16 M3607GA with ACP70 SoundWire RT721-SDCA.
>>> With the standalone RT721 ACP70 machine entry, this makes the HiFi
>>> profile expose Speaker, Headphones, internal Mic and Headset devices.
>>>
>>> Signed-off-by: Marco Griep <mail@marcogriep.de>
>>> ---
>>>   sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>>> b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>>> index 5bf3627a97a0..e895397eefd6 100644
>>> --- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>>> +++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
>>> @@ -74,6 +74,12 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct
>>> snd_soc_pcm_runtime *rtd, struct snd
>>>           return -EINVAL;
>>>       }
>>>
>>> +    card->components = devm_kasprintf(card->dev, GFP_KERNEL,
>>> +                      "%s spk:%s",
>>> +                      card->components, codec_name);
>>> +    if (!card->components)
>>> +        return -ENOMEM;
>>> +
>>>       /* Add routes */
>>>       ret = snd_soc_dapm_add_routes(dapm, route_map->route_map,
>>> route_map->route_size);
>>>       if (ret)
>>>
>>> base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
>>> -- 
>>> 2.55.0
>>>
> 

